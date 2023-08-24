
    /*
    mattilsynet.biomasse.rapportering.v2[/mattilsynet.biomasse.rapportering.v2/]
    mattilsynet.slakt.rapportering.4eva.v1[/mattilsynet.slakt.rapportering.4eva.v1/]
    mattilsynet.lakselus.rapportering.4eva.v1[/mattilsynet.lakselus.rapportering.4eva.v1/]
    mattilsynet.biomasse.rapportering.4eva.v2[/mattilsynet.biomasse.rapportering.4eva.v2/]
    mattilsynet.settefisk.rapportering.4eva.v1[/mattilsynet.settefisk.rapportering.4eva.v1/]
    mattilsynet.slakt.rapportering.historikk.v1[/mattilsynet.slakt.rapportering.historikk.v1/]
    mattilsynet.lakselus.rapportering.historikk.v1[/mattilsynet.lakselus.rapportering.historikk.v1/]
    mattilsynet.biomasse.rapportering.historikk.v1[/mattilsynet.biomasse.rapportering.historikk.v1/]
    mattilsynet.settefisk.rapportering.historikk.v1[/mattilsynet.settefisk.rapportering.historikk.v1/]
    mattilsynet.lokaliteter.v1[/mattilsynet.lokaliteter.v1/]
    mattilsynet.avdelinger.v1[/mattilsynet.avdelinger.v1/]
    mattilsynet.event.v1[/mattilsynet.event.v1/]

    subgraph altinn [Altinn]
        altinn-splitt-av-data[Splitt av data]
        lakselus-rapporting[Lakselus rapporting] --> altinn-splitt-av-data
        biomasse-rapporting[Biomasse rapporting] --> altinn-splitt-av-data
        slakt-rapporting[Slakt rapporting] --> altinn-splitt-av-data
        settefisk-rapporting[Settefisk rapporting] --> altinn-splitt-av-data
    end

    subgraph altinn-mottak-service [ ]
        altinn-mottak-service-pods[altinn-mottak-service]
        altinn-mottak-service-pods --- altinn-mottak-service-db[(Postgres)]
        altinn-mottak-service-pods --- altinn-mottak-service-redis-session[(Redis)]
    end

   mattilsynet.lakselus.rapportering.v1[/mattilsynet.lakselus.rapportering.v1/]
   mattilsynet.biomasse.rapportering.v2[/mattilsynet.biomasse.rapportering.v2/]
   mattilsynet.slakt.rapportering.4eva.v1[/mattilsynet.slakt.rapportering.4eva.v1/]
   mattilsynet.lakselus.rapportering.4eva.v1[/mattilsynet.lakselus.rapportering.4eva.v1/]
   mattilsynet.biomasse.rapportering.4eva.v2[/mattilsynet.biomasse.rapportering.4eva.v2/]
   mattilsynet.settefisk.rapportering.4eva.v1[/mattilsynet.settefisk.rapportering.4eva.v1/]
   mattilsynet.slakt.rapportering.historikk.v1[/mattilsynet.slakt.rapportering.historikk.v1/]
   mattilsynet.lakselus.rapportering.historikk.v1[/mattilsynet.lakselus.rapportering.historikk.v1/]
   mattilsynet.biomasse.rapportering.historikk.v1[/mattilsynet.biomasse.rapportering.historikk.v1/]
   mattilsynet.settefisk.rapportering.historikk.v1[/mattilsynet.settefisk.rapportering.historikk.v1/]
   mattilsynet.lokaliteter.v1[/mattilsynet.lokaliteter.v1/]
   mattilsynet.avdelinger.v1[/mattilsynet.avdelinger.v1/]
   mattilsynet.event.v1[/mattilsynet.event.v1/]

    subgraph sild-frontend [ ]
        sild-frontend-pods[SILD]
        sild-frontend-pods --- sild-frontend-redis-session[(Redis)]
    end
    subgraph lokalitetsoversikt-service [ ]
        lokalitetsoversikt-service-pods[lokalitetsoversikt-service]
        lokalitetsoversikt-service-pods --- lokalitetsoversikt-service-db[(Postgres)]
    end
    subgraph organisasjon-eierforhold-service [ ]
        organisasjon-eierforhold-service-pods[organisasjon-eierforhold-service]
    end
    subgraph lakselus-rapportering-service [ ]
        lakselus-rapportering-service-pods[lakselus-rapportering-service] --- lakselus-rapportering-service-db[(Postgres)]
    end
    subgraph offentlig-lakselus-rapportering-service [ ]
        offentlig-lakselus-rapportering-service-pods[offentlig-lakselus-rapportering-service]
    end
    subgraph lokalitet-service [ ]
        lokalitet-service-pods[lokalitet-service] --- lokalitet-service-db[(Postgres)]
    end
    subgraph biomasse-service [ ]
        biomasse-service-pods[biomasse-service]
    end
    subgraph kodeverk-service [ ]
        kodeverk-service-pods[kodeverk-service]
    end
    subgraph lusetelling-service [ ]
        lusetelling-service-pods[lusetelling-service] --- lusetelling-service-db[(Postgres)]
    end
    subgraph settefisk-rapportering-service [ ]
        settefisk-rapportering-service-pods[settefisk-rapportering-service] --- settefisk-rapportering-service-db[(Postgres)]
    end
    subgraph slakt-rapportering-service [ ]
        slakt-rapportering-service-pods[slakt-rapportering-service] --- slakt-rapportering-service-db[(Postgres)]
    end
    subgraph avdeling-service [ ]
        avdeling-service-pods[avdeling-service] --- avdeling-service-db[(Postgres)]
    end
    subgraph profile-service [ ]
        profile-service-pods[profile-service] --- profile-service-db[(Postgres)]
    end
    subgraph event-service [ ]
        event-service-pods[event-service] --- event-service-db[(Postgres)]
    end
    subgraph settefisk-altinn-mottak-service [ ]
        settefisk-altinn-mottak-service-pods[settefisk-altinn-mottak-service] --- settefisk-altinn-mottak-service-db[(Postgres)]
    end
    subgraph publish-avdelinger-job [ ]
        publish-avdelinger-job-pods[publish-avdelinger-job]
    end
    subgraph update-avdelinger-job [ ]
        update-avdelinger-job-pods[update-avdelinger-job]
    end
    subgraph publish-lokaliteter-job [ ]
        publish-lokaliteter-job-pods[publish-lokaliteter-job]
    end
    subgraph avlusning-event [ ]
        avlusning-event-pods[avlusning-event]
    end
    subgraph brudd-paa-lusegrense-event [ ]
        brudd-paa-lusegrense-event-pods[brudd-paa-lusegrense-event]
    end
    subgraph slakt-event [ ]
        slakt-event-pods[slakt-event]
    end
    subgraph slakt-altinn-mottak-service [ ]
        slakt-altinn-mottak-service-pods[slakt-altinn-mottak-service]
    end

    altinn-splitt-av-data --XML Rapportering--> altinn-mottak-service
    altinn-3.0 --Cloud Event--> settefisk-altinn-mottak-service

    mattilsynet.lakselus.rapportering.v1 --> lakselus-rapportering-service
    mattilsynet.lakselus.rapportering.4eva.v1 --> lusetelling-service
    mattilsynet.lakselus.rapportering.4eva.v1 --> avlusning-event
    mattilsynet.lakselus.rapportering.4eva.v1 --> brudd-paa-lusegrense-event
    mattilsynet.lakselus.rapportering.4eva.v1 --> slakt-event
    mattilsynet.slakt.rapportering.4eva.v1 --> slakt-rapportering-service
    mattilsynet.slakt.rapportering.historikk.v1 --> slakt-rapportering-service
    mattilsynet.lokaliteter.v1 --> lokalitet-service
    mattilsynet.lokaliteter.v1 --> lokalitetsoversikt-service
    mattilsynet.lakselus.rapportering.historikk.v1 --> lusetelling-service
    mattilsynet.lakselus.rapportering.historikk.v1 --> lakselus-rapportering-service
    mattilsynet.lakselus.rapportering.historikk.v1 --> avlusning-event
    mattilsynet.lakselus.rapportering.historikk.v1 --> brudd-paa-lusegrense-event
    mattilsynet.lakselus.rapportering.historikk.v1 --> slakt-event
    mattilsynet.settefisk.rapportering.historikk.v1 --> settefisk-rapportering-service
    mattilsynet.settefisk.rapportering.4eva.v1 --> settefisk-rapportering-service
    mattilsynet.avdelinger.v1 --- avdeling-service
    mattilsynet.event.v1 --- event-service

    altinn-mottak-service --- mattilsynet.lakselus.rapportering.v1
    altinn-mottak-service --- mattilsynet.lakselus.rapportering.4eva.v1
    altinn-mottak-service --- mattilsynet.lakselus.rapportering.historikk.v1
    altinn-mottak-service --- mattilsynet.biomasse.rapportering.v2
    altinn-mottak-service --- mattilsynet.biomasse.rapportering.4eva.v2
    altinn-mottak-service --- mattilsynet.settefisk.rapportering.4eva.v1
    altinn-mottak-service --- mattilsynet.slakt.rapportering.4eva.v1
    altinn-mottak-service --- mattilsynet.slakt.rapportering.historikk.v1
    altinn-mottak-service --- mattilsynet.biomasse.rapportering.historikk.v1
    altinn-mottak-service --- mattilsynet.settefisk.rapportering.historikk.v1

    avlusning-event --- mattilsynet.event.v1
    brudd-paa-lusegrense-event --- mattilsynet.event.v1
    slakt-event --- mattilsynet.event.v1

    lokalitetsoversikt-service -->  organisasjon-eierforhold-service
    lokalitetsoversikt-service -->  BarentsWatch
    esa-service((esa-service))
    esa-service --> lokalitetsoversikt-service

    organisasjon-eierforhold-service --> Brønnøysundregistrene

    offentlig-lakselus-rapportering-service --> lakselus-rapportering-service

    lusetelling-service --> kodeverk-service
    lusetelling-service --> lokalitetsoversikt-service

    sild-frontend --> lakselus-rapportering-service
    sild-frontend --> lokalitet-service
    sild-frontend --> biomasse-service
    sild-frontend --> kodeverk-service
    sild-frontend --> lokalitetsoversikt-service
    sild-frontend --> lusetelling-service
    sild-frontend --> settefisk-rapportering-service
    sild-frontend --> avdeling-service
    sild-frontend --> profile-service
    sild-frontend --> organisasjon-eierforhold-service


    publish-avdelinger-job ---> mattilsynet.avdelinger.v1

    publish-lokaliteter-job ---> Akvakulturregisteret
    publish-lokaliteter-job --- mattilsynet.lokaliteter.v1

    update-avdelinger-job ---> lokalitet-service
    update-avdelinger-job ---> avdeling-service