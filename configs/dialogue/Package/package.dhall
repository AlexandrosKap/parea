let pack = ../../Packages/Dialogue/package.dhall
let emotions = ./emotions.dhall
let names = ./names.dhall

let Line = pack.Line
let newLine = pack.newLine
let newLineSet = pack.newLineSet

-- Helper functions to prevent repetition.
let do = newLine 0.0 0.0
let say = newLine 0.0 0.0 ""
let print = newLine 0.0 0.0 "" ""

in  { Line
    , newLine
    , newLineSet
    , emotions
    , names
    , do
    , say
    , print
    }
