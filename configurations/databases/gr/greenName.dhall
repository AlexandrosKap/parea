let db = ../Database/package.dhall

let say = db.newLine "${db.scenes.level2}"
let green = say "${db.names.green}"
in  db.newLineSet
    [ green "[wave]Με λένε Green Mominpappa.[/wave]"
    ]