let names = ./PareaData/names.dhall
let scenes = ./PareaData/scenes.dhall
let newLine = ./PareaPrelude/newLine.dhall
let newLineSet = ./PareaPrelude/newLineSet.dhall

let say = newLine "${scenes.lostWoods}"
let alex = say "${names.alexandros}"
let momo = say "${names.momo}"
in  newLineSet
    [ alex "Hello Momo."
    , momo "Hello Alex."
    , alex "Can you tell me something?"
    , momo "No."
    , alex "OK."
    , alex "Bye!"
    , momo "Bye!"
    ]
