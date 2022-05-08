let pack = ../../package.dhall

let say = pack.newLine "${pack.scenes.level2}"
let green = say "${pack.names.green}"
let red = say "${pack.names.red}"

in  [ red "[rainbow]My name is Red Mominpappa.[/rainbow]"
    , green "[rainbow]And my name is Green Mominpappa[/rainbow]"
    , red "Have a nice day."
    ]
