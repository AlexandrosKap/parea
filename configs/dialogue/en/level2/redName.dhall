let lib = ../../package.dhall

let say = lib.newLine "${lib.scenes.level2}"
let red = say "${lib.names.red}"

in  [ red "[wave]My name is Red Mominpappa.[/wave]"
    ]
