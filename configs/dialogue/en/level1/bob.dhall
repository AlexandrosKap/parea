let lib = ../../package.dhall

let say = lib.newLine "${lib.scenes.level1}"
let green = say "${lib.names.green}"

in  [ green "[shake]The name of this node is...[/shake]"
    , green "[wave]Green Bob.[/wave]"
    , green "[rainbow]The end.[/rainbow]"
    ]
