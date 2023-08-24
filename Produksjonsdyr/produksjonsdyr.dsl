// Team Produksjonsdyr sin modell definisjon
// TL: Mari Wien
// OBS legg relasjoner i egen _relations-fil da de må defineres etter alle person/softwareSystem,
// container og component som refereres

group "Produksjonsdyr domenet" {
    dyrehold = softwareSystem "Dyrehold og Produksjonsplass" {
        dyreholdSkjema = container "Nytt dyreholdskjema" "Webside hvor bonden kan logge seg på, registrere opplysninger og se opplysninger relevant for bonden"
        dyreholdOversikt = container "Dyreholdoversikt" "Webside hvor Inspektøren kan se info om bonden"
        pdyrService = container "PDYR Service"
        pdyrDB = container "Produksjonsdyr Schema" "Database som inneholder alle produksjonsplasser" "Postgres/GIS" "DB"
        pdyrBerikelse = container "Berikelse Schema" "Data vi henter fra andre" "Postgres/GIS" "DB"
    }
}