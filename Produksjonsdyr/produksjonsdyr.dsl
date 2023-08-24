// Team Produksjonsdyr sin modell definisjon

workspace extends https://raw.githubusercontent.com/acje/structarch/main/MT_top/mt_top.dsl {
    model {
        properties {
            "structurizr.groupSeparator" "/"
            // Ikke bruk "/" i gruppe navn!
        }

        group "Produksjonsdyr domenet" {
            dyrehold = softwareSystem "Dyrehold og Produksjonsplass" {
                dyreholdSkjema = container "Nytt dyreholdskjema" "Webside hvor bonden kan logge seg på, registrere opplysninger og se opplysninger relevant for bonden"
                dyreholdOversikt = container "Dyreholdoversikt" "Webside hvor Inspektøren kan se info om bonden"
                pdyrService = container "PDYR Service"
                pdyrDB = container "Produksjonsdyr Schema" "Database som inneholder alle produksjonsplasser" "Postgres/GIS" "DB"
                pdyrBerikelse = container "Berikelse Schema" "Data vi henter fra andre" "Postgres/GIS" "DB"
            }
        }
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