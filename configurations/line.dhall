-- Function is from: https://store.dhall-lang.org/Prelude-v21.1.0/List/map.dhall.html
------------------
let map
    : ∀(a : Type) → ∀(b : Type) → (a → b) → List a → List b
    = λ(a : Type) →
      λ(b : Type) →
      λ(f : a → b) →
      λ(xs : List a) →
        List/build
          b
          ( λ(list : Type) →
            λ(cons : b → list → list) →
              List/fold a xs list (λ(x : a) → cons (f x))
          )
------------------

let Line =
    { code   : Text
    , number : Natural
    , scene  : Text
    , text   : Text
    , title  : Text
    }

let IndexedLine =
    { index : Natural
    , value : Line
    }

let newLine =
    \(scene : Text) ->
    \(title : Text) ->
    \(text  : Text) ->
        { code = "", number = 0, scene, title, text } : Line

let fromIndexedLineToLine =
    \(indexedLine : IndexedLine) ->
        { code = "${indexedLine.value.scene}-${Natural/show indexedLine.index}-${indexedLine.value.title}"
        , number = indexedLine.index
        , scene = indexedLine.value.scene
        , title = indexedLine.value.title
        , text = indexedLine.value.text
        } : Line
let newLineSet =
    \(lines : List Line) ->
        map
        IndexedLine
        Line
        fromIndexedLineToLine
        (List/indexed Line lines)

-- Simple Example
------------------
let say = newLine "Lost Woods"
let none = say "None"
let alex = say "Alexanros"
let momo = say "Momo"
let woods = newLineSet
    [ alex "Hello Momo."
    , momo "Hello Alex."
    , alex "Can you tell me something?"
    , momo "No."
    , alex "OK."
    , alex "Bye!"
    , momo "Bye!"
    , none "The end."
    ]

let say = newLine "Lava Star Planet"
let none = say "None"
let sys = say "System"
let cosmo = say "Cosmo"
let planet = newLineSet
    [ cosmo "Hello world!"
    , sys "Good morning mate."
    , cosmo "Good morning mate."
    , cosmo "I'm going back to sleep."
    , sys "Good night mate."
    , cosmo "Good night mate."
    , none "The end."
    ]

in  woods
    # planet
------------------
