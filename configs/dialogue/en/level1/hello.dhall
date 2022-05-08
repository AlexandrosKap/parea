let pack = ../../package.dhall

let say = pack.newLine "${pack.scenes.level1}"
let red = say "${pack.names.red}"

in  [ red "[rainbow]Hello world.[/rainbow]"
    , red ''
    [wave]This is a big Big BIG line and
    has many Many MANY characters.[/wave]''
    , red "Thanks for clicking me."
    , red "[shake]I love you.[/shake]"
    , red "Bye."
    ]
