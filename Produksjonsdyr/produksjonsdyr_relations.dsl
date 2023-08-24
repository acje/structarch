dyrehold.pdyrService -> mats "Opprette/oppdatere/hente info om dyrehold"
dyrehold.pdyrService -> arkiv "Ny produksjonsplass dokument?"
dyrehold.pdyrService -> dyrehold.pdyrDB
dyrehold.pdyrService -> dyrehold.pdyrBerikelse
minSide -> dyrehold.dyreholdSkjema
dyrehold.dyreholdSkjema -> dyrehold.pdyrService
fagPortal -> dyrehold.dyreholdOversikt
dyrehold.dyreholdOversikt -> dyrehold.pdyrService
driftsansvarlig -> idPorten "Logger seg på"
driftsansvarlig -> minSide "Registrerer/oppdaterer dyrehold"
inspektor -> azureAd "Logger seg på"
inspektor -> fagPortal "Se dyrehold"