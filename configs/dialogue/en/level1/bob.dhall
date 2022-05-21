let pack = ../../Package/package.dhall
let names = pack.names
let emotions = pack.emotions

let none = pack.print names.none emotions.none
let green = pack.print names.green emotions.none
let red = pack.print names.red emotions.none

in  [ green "[shake]The name of this node is...[/shake]"
    , green "[wave]Green Bob.[/wave]"
    , red "Yes. His name is Bob."
    , red "Me?"
    , red "I'm just a rando called Red Bob."
    , red "[wave]...[/wave]"
    , red "Ok, bye."
    , none "[rainbow]The end.[/rainbow]"
    ]
