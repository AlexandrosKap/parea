let Line = ./Line.dhall

let newLine : Double -> Text -> Text -> Text -> Text -> Line =
    \(pause : Double) ->
    \(sound : Text) ->
    \(name  : Text) ->
    \(emotion : Text) ->
    \(text  : Text) ->
        { code = ""
        , emotion
        , name
        , number = 0
        , pause
        , scene = ""
        , set = ""
        , sound
        , text
        }

in  newLine
