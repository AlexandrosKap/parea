let pack = ../../package.dhall

let say = pack.newLine
let green = say "${pack.names.green}"
let red = say "${pack.names.red}"

in  [ red "[wave]My name is Red Mominpappa.[/wave]"
    , green "[shake]And my name is Green Mominpappa[/shake]"
    , red "Have a nice day."
    , red "[rainbow]The end.[/rainbow]"
    ]
