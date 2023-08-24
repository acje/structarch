// Team Akvakultur sin modell definisjon
// TL: Martin Gundersen Langvatn

group "Akvakultur domenet" {
    group "Altinn 2 plattform" {
        altinnSkjema = softwareSystem "Altinn skjema" {
            altinnSplittAvData = container "Splitt av data"
            lakselusRapportering = container "Lakselus rapportering"
            biomasseRapportering = container "Biomasse rapportering"
            slaktRapportering = container "Slakt rapportering"
            settefiskRapportering = container "Settefisk rapportering"
        }

        lakselusRapportering -> altinnSplittAvData
        biomasseRapportering -> altinnSplittAvData
        slaktRapportering -> altinnSplittAvData
        settefiskRapportering -> altinnSplittAvData
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