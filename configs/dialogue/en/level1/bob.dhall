let lib = ../../package.dhall

let say = lib.newLine "${lib.scenes.level1}"
let none = say "${lib.names.none}"
let green = say "${lib.names.green}"
let red = say "${lib.names.red}"

in  [ green "[shake]The name of this node is...[/shake]"
    , green "[wave]Green Bob.[/wave]"
    , red "Yes. His name is Bob."
    , red "Me?"
    , red "I'm just a rando called red Bob."
    , red "..."
    , red "Ok, bye."
    , none "[rainbow]The end.[/rainbow]"
    ]
