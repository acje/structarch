// Team prøvetaking sin modell definisjon
group "Provetaking domenet" {
    provetaking = softwareSystem "Prøvetaking" "System for å støtte programeiere, inspektører og andre i jobben med å planlegge og utføre prøvetaking. Inkluderer både OK-programmer og 'ad-hoc' prøver" {
        provePlan = container "PrøvePlan" "Planlegging av prøver. Typisk OK-programmer"
        proveTa = container "PrøveTa" "Ta og registrere prøver"
        proveSvar = container "PrøveSvar" "Status på innsendte prøver"
        proveApi = container "Prøve ta/svar API" "Backend støtte for ta og svar på prøver"
        planleggingsApi = container "Planleggings API" "Backend støtte for planlegginsapp"
        provetakingDb = container "Prøvetaking DB" "Lagrer alle data ifm planlegging og sporing av prøver" "Postgres/GIS" "DB"
        eksternAktor = container "Eksterne aktører" "Backend støtte for kommunikasjon med eksterne aktører"
    }
    provetaker -> proveTa "Bruker App/webapp på, typisk, telefon"
    provetaker -> provePlan "Sjekker planer, planlegger i web-leser"
    programeier -> provetaking "Legger planer i web-leser"
    eksternLabSys -> eksternAktor "Gjør API spørringer" "REST, JSON"
    proveTa -> proveApi "Gjør API spørringer" "REST/Graphql, JSON"
    proveSvar -> proveTa "Gjør API spørringer" "REST/Graphql, JSON"
    proveApi -> provetakingDb "Leser fra og skriver til" "JDBC/SQL"
    eksternAktor -> provetakingDb "Leser fra og skriver til" "JDBC/SQL"
    planleggingsApi -> provetakingDb "Leser fra og skriver til" "JDBC/SQL"

}