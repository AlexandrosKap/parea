let pack = ../../package.dhall

let say = pack.newLine "${pack.scenes.level1}"
let red = say "${pack.names.red}"

in  [ red "[wave]Hello world.[/wave]"
    , red ''
    This is a big Big BIG line and
    has many Many MANY characters.''
    , red "Thanks for clicking me."
    , red "[shake]I love you.[/shake]"
    , red "Bye."
    , red "[rainbow]The end.[/rainbow]"
    ]
