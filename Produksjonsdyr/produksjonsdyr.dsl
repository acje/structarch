// Team Produksjonsdyr sin modell definisjon
// Arv fra MT_top; stiler, alle softwareSystems ie "!ref dyrehold", ++?

workspace extends https://raw.githubusercontent.com/acje/structarch/main/MT_top/mt_top.dsl {
    name Produksjonsdyr
    description "Produksjonsdyr Domenet"
    model {
        properties {
            "structurizr.groupSeparator" "/"
            // Ikke bruk "/" i gruppe navn!
        }

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

        container "Dyrehold" {
            include *
            autoLayout
        }

        container "Dyrehold" {
            include *
            include driftsansvarlig inspektor
            autoLayout
        }
        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }
            element "DB" {
                shape cylinder
            }
            element "Ekstern" {
                background gray
            }
            element "Stream" {
                shape pipe
                background lightblue
                width 800
                height 80
            }
        }
    }
}