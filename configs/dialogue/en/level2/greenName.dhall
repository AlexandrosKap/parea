let pack = ../../package.dhall

let say = pack.newLine "${pack.scenes.level2}"
let green = say "${pack.names.green}"
let red = say "${pack.names.red}"

in  [ green "[wave]My name is Green Mominpappa.[/wave]"
    , red "[wave]And my name is Red Mominpappa[/wave]"
    , green "Have a nice day."
    ]
