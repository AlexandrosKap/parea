let Category = < Line | Menu | Entry >

let DialogueLine =
    { category : Category
    , name : Text
    , text : Text
    }

let Dialogue = List DialogueLine

let dialogueLine =
    \(category : Category) -> \(name : Text) -> \(text : Text) ->
        { category, name, text } : DialogueLine

let dialogue =
    \(category : Category) -> \(name : Text) -> \(text : Text) ->
        [ dialogueLine category name text ] : List DialogueLine

let line = dialogue Category.Line
let menu = dialogue Category.Menu
let entry = dialogue Category.Entry
let say = line ""

in  { say
    , entry
    , menu
    , line
    , dialogue
    , dialogueLine
    , Dialogue
    , DialogueLine
    , Category
    }
