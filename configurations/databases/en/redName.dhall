let db = ../Database/package.dhall

let say = db.newLine "${db.scenes.level2}"
let red = say "${db.names.red}"

in  db.newLineSet
    [ red "[wave]My name is Red Mominpappa.[/wave]"
    ]
