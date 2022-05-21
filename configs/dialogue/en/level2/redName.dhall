let pack = ../../Package/package.dhall
let names = pack.names
let emotions = pack.emotions

let green = pack.print names.green emotions.none
let red = pack.print names.red emotions.none

in  [ red "[wave]My name is Red Mominpappa.[/wave]"
    , green "[shake]And my name is Green Mominpappa[/shake]"
    , red "Have a nice day."
    , red "[rainbow]The end.[/rainbow]"
    ]
