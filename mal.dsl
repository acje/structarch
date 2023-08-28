// Team [teamnavn] sin modell definisjon
// Arv fra MT_top; stiler, alle softwareSystems og personer ie "!ref dyrehold", groupSeparator: "/"
// Ikke bruk "/" i gruppe navn!

workspace extends ../MT_top/mt_top.dsl {
    name "Domenenavn"
    description "Domene beskrivelse"
    !identifiers hierarchical
    model {
        !ref mittSoftwareSystem {
            del1 = container "Første del" "Den aller første delen av systemet"
            del2 = container "Andre del" "Den andre delen av systemet"
        }

        del1 -> del2 "del1 er avhengig av del 2"
        del2 -> del1 "del 2 er også avhengig av del1, flotters!"
        }
        
    views {
        systemContext mittSoftwareSystem "Dyrehold" {
            include *
            autoLayout
        }

        container "mittSoftwareSystem" {
            include *
            autoLayout
        }
        styles {
            // egen stil som overskriver den arvede stilen fra MT_top.dsl
        }
    }
}