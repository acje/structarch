workspace "Arch Landscape" "Description" {
    
    !identifiers hierarchical

    model {
        a = softwareSystem "A"
        b = softwareSystem "B"
        
        a -> b "Gets data X from"
    }

}
