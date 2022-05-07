let lib = ../../package.dhall

let say = lib.newLine "${lib.scenes.level2}"
let green = say "${lib.names.green}"
let red = say "${lib.names.red}"

in  [ green "[wave]My name is Green Mominpappa.[/wave]"
    , red "[wave]And my name is Red Mominpappa[/wave]"
    , green "Have a nice day."
    ]
