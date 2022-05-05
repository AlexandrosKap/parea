let db = ../Database/package.dhall

let say = db.newLine "${db.scenes.level1}"
let red = say "${db.names.red}"

in  db.newLineSet
    [ red "Γειά σου κόσμε."
    , red ''
    [wave]Αυτή είναι μια μεγάλη Μεγάλη
    ΜΕΓΆΛΗ γραμμή και έχει πολλούς
    Πολλούς ΠΟΛΛΟΎΣ χαρακτήρες.[/wave]''
    , red "Ευχαριστώ που έκανες κλίκ."
    , red "[shake]Σ'Αγαπώ.[/shake]"
    , red "Αντίο."
    ]
