let Line = ./Line.dhall

let newLine : Text -> Text -> Text -> Line =
    \(scene : Text) ->
    \(name  : Text) ->
    \(text  : Text) ->
        { code = ""
        , name
        , number = 0
        , scene
        , set = ""
        , text
        }

in  newLine
