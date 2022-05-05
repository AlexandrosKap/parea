let db = ../Database/package.dhall

let say = db.newLine "${db.scenes.redLevel2}"
let red = say "${db.names.red}"

in  [ red "[wave]Με λένε Red Snoofkin.[/wave]"
    ]
