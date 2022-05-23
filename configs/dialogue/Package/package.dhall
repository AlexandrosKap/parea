let pack = ../../Packages/Dialogue/package.dhall

in  { Line = pack.Line
    , newLine = pack.newLine
    , newLineSet = pack.newLineSet
    , do = pack.do
    , say = pack.say
    , print = pack.print
    , emotions = ./emotions.dhall
    , names = ./names.dhall
    }
