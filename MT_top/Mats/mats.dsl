// Mats modell definisjon
group "Mats" {
    mats = softwareSystem "Mats" "Mattilsynets tilsynsystem" {
        matsServer = container "Mats Server"
        matsDb = container "Mats DB" "Data om virksomhetsmapper og tilsynsobjekter++" "Oracle" "DB"
        jens = container "Jens"
    }
}
