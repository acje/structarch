pdyrService -> mats "Opprette/oppdatere/hente info om dyrehold"
pdyrService -> arkiv "Ny produksjonsplass dokument?"
pdyrService -> pdyrDB
pdyrService -> pdyrBerikelse
minSide -> dyreholdSkjema
dyreholdSkjema -> pdyrService
fagPortal -> dyreholdOversikt
dyreholdOversikt -> pdyrService
driftsansvarlig -> idPorten "Logger seg på"
driftsansvarlig -> minSide "Registrerer/oppdaterer dyrehold"
inspektor -> azureAd "Logger seg på"
inspektor -> fagPortal "Se dyrehold"