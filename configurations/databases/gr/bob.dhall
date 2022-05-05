let db = ../Database/package.dhall

let say = db.newLine "${db.scenes.level1}"
let green = say "${db.names.green}"

in  db.newLineSet
    [ green "[shake]Το όνομα αυτού του κόμβου είναι...[/shake]"
    , green "[wave]Πράσινος Μπόμπ.[/wave]"
    , green "[rainbow]Τέλος.[/rainbow]"
    ]
