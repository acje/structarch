workspace "MT arch" "Mattilsynet System Architecture: Plan" {
    !identifiers hierarchical
    model {
        properties {
            "structurizr.groupSeparator" "/"
            // Ikke bruk "/" i gruppe navn!
        }
        // Vi velger å modellere mennesker gjennom de rollene de har i møte med våre systemer. "Borger" er eksempel på en
        // person uten spesifikk rolle i den aktuelle konteksten.

        borger = person "Borger" "Person uten spesifikk rolle i denne kontekst" "Ekstern"
        driftsansvarlig = person "Driftsansvarlig" "Person eller underenhet som holder dyr" "Ekstern"
        inspektor = person "Inspektør/ Saksbehandler" "Ansatt hos MT som gjennomfører inspeksjon og saksbehandling"
        programeier = person Programeier "Planlegger prøveuttak"
        provetaker = person Prøvetaker "Den som tar prøve"

        idPorten = softwareSystem "ID Porten" "Autentisering av Borger" "Ekstern"
        azureAd = softwareSystem "AzureAD" "Autentisering av MT-ansatte" "Ekstern"
        eksternLabSys = softwareSystem "Eksterne labsystemer" "Brukes av laboratorier som skal analysere prøver og gi svar" "Ekstern"

        group "Mattilsynets systemer" {
            group "Produksjonsdyr domenet" {
               dyrehold = softwareSystem "Dyrehold og Produksjonsplass"
            }
            
            // Mats modell definisjon
            group "Mats" {
                mats = softwareSystem "Mats" "Mattilsynets tilsynsystem" {
                    matsServer = container "Mats Server"
                    matsDb = container "Mats DB" "Data om virksomhetsmapper og tilsynsobjekter++" "Oracle" "DB"
                    jens = container "Jens"
                }
            }

            group "Arkiv" {
                arkiv = softwareSystem "Arkiv"
            }

            group "Provetaking domenet" {
                provetaking = softwareSystem "Prøvetaking" "System for å støtte programeiere, inspektører og andre i jobben med å planlegge og utføre prøvetaking. Inkluderer både OK-programmer og 'ad-hoc' prøver" 
            }

            group "Min side" {           
                minSide = softwareSystem "Min side" "Portal løsninger for eksterne aktører; Borgere og Bedrifter"
            }

            group "Fagsystem portal" {
                fagPortal = softwareSystem "Intern side" "Webside som kan brukes internt av Mattilsynet til å hente ut info om produksjonsplasser"
            }

            // Team Akvakultur sin modell definisjon
            group "Akvakultur domenet" {
                group "Altinn 2 plattform" {
                    altinnSkjema = softwareSystem "Altinn skjema" {
                        altinnSplittAvData = container "Splitt av data"
                        lakselusRapportering = container "Lakselus rapportering"
                        biomasseRapportering = container "Biomasse rapportering"
                        slaktRapportering = container "Slakt rapportering"
                        settefiskRapportering = container "Settefisk rapportering"
                    }

                    altinnSkjema.lakselusRapportering -> altinnSkjema.altinnSplittAvData
                    altinnSkjema.biomasseRapportering -> altinnSkjema.altinnSplittAvData
                    altinnSkjema.slaktRapportering -> altinnSkjema.altinnSplittAvData
                    altinnSkjema.settefiskRapportering -> altinnSkjema.altinnSplittAvData
                }
                sild = softwareSystem "SILD" {
                    // Diskutabelt om en stream skal modelleres som container eller component, men de blir mer synlige
                    // på høyere abstraksjonsnivå som container, og det føltes riktig.
                    lakselusRapporteringV1 = container "mattilsynet.lakselus.rapportering.v1" "" "Kafka topic" "Stream"
                    mattilsynetBiomasseRapporteringV2 = container "mattilsynet.biomasse.rapportering.v2" "" "Kafka topic" "Stream"
                    slaktRapportering4evaV1 = container "mattilsynet.slakt.rapportering.4eva.v1" "" "Kafka topic" "Stream"
                    lakselusRapportering4evaV1 = container "mattilsynet.lakselus.rapportering.4eva.v1" "" "Kafka topic" "Stream"
                    biomasseRapportering4evaV2 = container "mattilsynet.biomasse.rapportering.4eva.v2" "" "Kafka topic" "Stream"
                    settefiskRapportering4evaV1 = container "mattilsynet.settefisk.rapportering.4eva.v1" "" "Kafka topic" "Stream"
                    slaktRapporteringHistorikkV1 = container "mattilsynet.slakt.rapportering.historikk.v1" "" "Kafka topic" "Stream"
                    lakselusRapporteringHistorikkV1 = container "mattilsynet.lakselus.rapportering.historikk.v1" "" "Kafka topic" "Stream"
                    biomasseRapporteringHistorikkV1 = container "mattilsynet.biomasse.rapportering.historikk.v1" "" "Kafka topic" "Stream"
                    settefiskRapporteringHistorikkV1 = container "mattilsynet.settefisk.rapportering.historikk.v1" "" "Kafka topic" "Stream"
                    lokaliteterV1 = container "mattilsynet.lokaliteter.v1" "" "Kafka topic" "Stream"
                    avdelingerV1 = container "mattilsynet.avdelinger.v1" "" "Kafka topic" "Stream"
                    eventV1 = container "mattilsynet.event.v1" "" "Kafka topic" "Stream"
                }
            }
        }
    // Mats relasjoner
    minSide -> idPorten
    fagPortal -> azureAd
    inspektor -> mats "Saksbehandling"
    mats -> arkiv
    mats.matsServer -> mats.matsDb
    mats.matsServer -> mats.jens
    }

    views {
      systemLandscape "Mattilsynet" "Mattilsynets systemlandskap" {
            include *
            autoLayout
        }
 /* 
        systemContext "Arkiv" {
            include *
            autoLayout
        }

        // Mats view definisjoner
        container "Mats" {
            include *
            autoLayout
        }

        systemContext mats "Mats" {
            include *
            autoLayout
        }
        systemContext provetaking "Provetaking" {
            include *
            autoLayout
        }

        container "Provetaking" {
            include *
            include eksternLabSys
            autoLayout
        }
        systemContext sild "SILD" {
            include *
            autoLayout
        }

        container "sild" {
            include *
            autoLayout
        }
*/
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