let pack = ../../Package/package.dhall
let names = pack.names
let emotions = pack.emotions

let none = pack.print names.none emotions.none
let red = pack.print names.red emotions.none

in  [ red "[wave]Hello world.[/wave]"
    , red "This is a big Big BIG line and has many Many MANY characters."
    , red "Thanks for clicking me."
    , red "[shake]I love you.[/shake]"
    , red "Bye."
    , none "[rainbow]The end.[/rainbow]"
    ]
