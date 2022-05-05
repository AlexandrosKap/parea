let Line = ./Line.dhall

let newLine : Text -> Text -> Text -> Line
    =
    \(scene : Text) ->
    \(name  : Text) ->
    \(text  : Text) ->
        { code = "", number = 0, scene, name, text } : Line

in  newLine
