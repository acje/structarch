// Team Prøvetaking sin modell definisjon
// Arv fra MT_top; stiler, alle softwareSystems og personer ie "!ref dyrehold", ++?

workspace extends ../MT_top/mt_top.dsl {
    name "Prøvetaking"
    description "Prøvetaking Domenet"
    !identifiers hierarchical
    model {
        properties {
            "structurizr.groupSeparator" "/"
            // Ikke bruk "/" i gruppe navn!
        }

        !ref provetaking {
            provePlan = container "PrøvePlan" "Planlegging av prøver. Typisk OK-programmer"
            proveTa = container "PrøveTa" "Ta og registrere prøver"
            proveSvar = container "PrøveSvar" "Status på innsendte prøver"
            proveApi = container "Prøve ta/svar API" "Backend støtte for ta og svar på prøver"
            planleggingsApi = container "Planleggings API" "Backend støtte for planlegginsapp"
            provetakingDb = container "Prøvetaking DB" "Lagrer alle data ifm planlegging og sporing av prøver" "Postgres/GIS" "DB"
            eksternAktor = container "Eksterne aktører" "Backend støtte for kommunikasjon med eksterne aktører"
        }
        provetaker -> provetaking.proveTa "Bruker App/webapp på, typisk, telefon"
        provetaker -> provetaking.provePlan "Sjekker planer, planlegger i web-leser"
        programeier -> provetaking "Legger planer i web-leser"
        eksternLabSys -> provetaking.eksternAktor "Gjør API spørringer" "REST, JSON"
        provetaking.proveTa -> provetaking.proveApi "Gjør API spørringer" "REST/Graphql, JSON"
        provetaking.proveSvar -> provetaking.proveTa "Gjør API spørringer" "REST/Graphql, JSON"
        provetaking.proveApi -> provetaking.provetakingDb "Leser fra og skriver til" "JDBC/SQL"
        provetaking.eksternAktor -> provetaking.provetakingDb "Leser fra og skriver til" "JDBC/SQL"
        provetaking.planleggingsApi -> provetaking.provetakingDb "Leser fra og skriver til" "JDBC/SQL"
    }
        
    views {
        systemContext provetaking "Dyrehold" {
            include *
            autoLayout
        }

        container "provetaking" {
            include *
            autoLayout
        }
        styles {
            // egen stil som overskriver den arvede stilen
        }
    }
}