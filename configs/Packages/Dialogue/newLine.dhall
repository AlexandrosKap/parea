let Line = ./Line.dhall

let newLine : Text -> Text -> Line =
    \(name  : Text) ->
    \(text  : Text) ->
        { code = ""
        , emotion = ""
        , name
        , number = 0
        , pause = 0.0
        , scene = ""
        , set = ""
        , sound = ""
        , text
        }

in  newLine
