let pack = ../../Packages/Dialogue/package.dhall
let emotions = ./emotions.dhall
let names = ./names.dhall

let Line = pack.Line
let newLine = pack.newLine
let newLineSet = pack.newLineSet

let say = newLine 0.0 "none"
let none = say names.none emotions.none

in  { Line
    , newLine
    , newLineSet
    , emotions
    , names
    , say
    , none
    }
