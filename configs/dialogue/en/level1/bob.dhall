let pack = ../../package.dhall

let say = pack.newLine "${pack.scenes.level1}"
let none = say "${pack.names.none}"
let green = say "${pack.names.green}"
let red = say "${pack.names.red}"

in  [ green "[shake]The name of this node is...[/shake]"
    , green "[wave]Green Bob.[/wave]"
    , red "Yes. His name is Bob."
    , red "Me?"
    , red "I'm just a rando called Red Bob."
    , red "..."
    , red "Ok, bye."
    , none "[rainbow]The end.[/rainbow]"
    ]
