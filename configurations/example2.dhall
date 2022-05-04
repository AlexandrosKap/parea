let names = ./PareaData/names.dhall
let scenes = ./PareaData/scenes.dhall
let newLine = ./PareaPrelude/newLine.dhall
let newLineSet = ./PareaPrelude/newLineSet.dhall

let say = newLine "${scenes.starPlanet}"
let cosmo = say "${names.cosmonaut}"
let robot = say "${names.robot}"
in  newLineSet
    [ cosmo "Hello world!"
    , robot "Good morning mate."
    , cosmo "Good morning mate."
    , cosmo "I'm going back to sleep."
    , robot "Good night mate."
    , cosmo "Zzz..."
    ]
