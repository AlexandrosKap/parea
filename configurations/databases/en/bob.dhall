let db = ../Database/package.dhall

let say = db.newLine "${db.scenes.greenLevel1}"
let green = say "${db.names.green}"

in  db.newLineSet
    [ green "[shake]The name of this node is...[/shake]"
    , green "[wave]Green Bob.[/wave]"
    , green "[rainbow]The end.[/rainbow]"
    ]
