let lib = ../../package.dhall

let say = lib.newLine "${lib.scenes.level2}"
let green = say "${lib.names.green}"
let red = say "${lib.names.red}"

in  [ red "[rainbow]My name is Red Mominpappa.[/rainbow]"
    , green "[rainbow]And my name is Green Mominpappa[/rainbow]"
    , red "Have a nice day."
    ]
