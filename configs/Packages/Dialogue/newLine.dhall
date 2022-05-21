let Line = ./Line.dhall

let newLine : Double -> Double -> Text -> Text -> Text -> Text -> Line =
    \(pauseStart : Double) ->
    \(pauseEnd : Double) ->
    \(sound : Text) ->
    \(name  : Text) ->
    \(emotion : Text) ->
    \(text  : Text) ->
        { code = ""
        , emotion
        , name
        , number = 0
        , pauseEnd
        , pauseStart
        , scene = ""
        , set = ""
        , sound
        , text
        }

in  newLine
