// Team Produksjonsdyr sin modell definisjon
// Arv fra MT_top; stiler, alle softwareSystems og personer ie "!ref dyrehold", groupSeparator: "/"
// Ikke bruk "/" i gruppe navn!

workspace extends ../MT_top/mt_top.dsl {
    name Produksjonsdyr
    description "Produksjonsdyr Domenet"
    model {
        !ref dyrehold {
            dyreholdSkjema = container "Nytt dyreholdskjema" "Webside hvor bonden kan logge seg på, registrere opplysninger og se opplysninger relevant for bonden"
            dyreholdOversikt = container "Dyreholdoversikt" "Webside hvor Inspektøren kan se info om bonden"
            pdyrService = container "PDYR Service"
            pdyrDB = container "Produksjonsdyr Schema" "Database som inneholder alle produksjonsplasser" "Postgres/GIS" "DB"
            pdyrBerikelse = container "Berikelse Schema" "Data vi henter fra andre" "Postgres/GIS" "DB"
        }
        pdyrService -> mats "Opprette/oppdatere/hente info om dyrehold"
        pdyrService -> arkiv "Ny produksjonsplass dokument?"
        pdyrService -> pdyrDB
        pdyrService -> pdyrBerikelse
        minSide -> dyreholdSkjema
        dyreholdSkjema -> pdyrService
        fagPortal -> dyreholdOversikt
        dyreholdOversikt -> pdyrService
        driftsansvarlig -> idPorten "Logger seg på"
        driftsansvarlig -> minSide "Registrerer/oppdaterer dyrehold"
        inspektor -> azureAd "Logger seg på"
        inspektor -> fagPortal "Se dyrehold"
        }

    views {
        systemContext dyrehold "Dyrehold" {
            include *
            autoLayout
        }
        systemContext "x" {
            include *
            autoLayout
        }

        container "Dyrehold" {
            include *
            autoLayout
        }

        container "Dyrehold" {
            include *
            include driftsansvarlig inspektor
            autoLayout
        }
    }
}