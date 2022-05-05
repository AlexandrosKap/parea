let db = ../Database/package.dhall

let say = db.newLine "${db.scenes.greenLevel2}"
let green = say "${db.names.green}"

in  [ green "[wave]Με λένε Green Mominpappa.[/wave]"
    ]
