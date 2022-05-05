let lib = ../../package.dhall

let say = lib.newLine "${lib.scenes.level2}"
let green = say "${lib.names.green}"

in  [ green "[wave]My name is Green Mominpappa.[/wave]"
    ]
