// docker run -it --rm -p 8080:8080 -v /Users/ajensen/structurizr:/usr/local/structurizr structurizr/lite  
workspace "MT arch" "Mattilsynet System Architecture: Plan" {
    !identifiers hierarchical
    model {
        properties {
            "structurizr.groupSeparator" "/"
            // Ikke bruk "/" i gruppe navn!
        }
        !include Felles/ekstern.dsl
        !include Felles/roller.dsl

        group "Mattilsynets systemer" {
            !include Mats/mats.dsl
            !include Arkiv/arkiv.dsl
            !include Produksjonsdyr/produksjonsdyr.dsl
            !include Provetaking/provetaking.dsl
            !include Akvakultur/akvakultur.dsl

            group "Min side" {           
                minSide = softwareSystem "Min side" "Portal løsninger for eksterne aktører; Borgere og Bedrifter"
            }

            group "Fagsystem portal" {
                fagPortal = softwareSystem "Intern side" "Webside som kan brukes internt av Mattilsynet til å hente ut info om produksjonsplasser"
            }

        }

// Relasjonsfiler legges nederst da verdiene (system, person, container, component) de refererer må være definert først.
    !include Produksjonsdyr/produksjonsdyr_relations.dsl
    !include Akvakultur/akvakultur_relations.dsl
    !include Mats/mats_relations.dsl

    }

    views {
        systemLandscape "Mattilsynet" "Mattilsynets systemlandskap" {
            include *
            autoLayout
        }
        !include Produksjonsdyr/produksjonsdyr_view.dsl
        !include Arkiv/arkiv_view.dsl
        !include Mats/mats_view.dsl
        !include Provetaking/provetaking_view.dsl
        !include Akvakultur/akvakultur_view.dsl

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