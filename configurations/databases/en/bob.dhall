let db = ../Database/package.dhall

let say = db.newLine "${db.scenes.level1}"
let green = say "${db.names.green}"

in  [ green "[shake]The name of this node is...[/shake]"
    , green "[wave]Green Bob.[/wave]"
    , green "[rainbow]The end.[/rainbow]"
    ]
