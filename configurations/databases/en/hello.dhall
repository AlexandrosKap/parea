let db = ../Database/package.dhall

let say = db.newLine "${db.scenes.level1}"
let red = say "${db.names.red}"
in  db.newLineSet
    [ red "Hello world."
    , red ''
    [wave]This is a big Big BIG line and
    has many Many MANY characters.[/wave]''
    , red "Thanks for clicking me."
    , red "[shake]I love you.[/shake]"
    , red "Bye."
    ]
