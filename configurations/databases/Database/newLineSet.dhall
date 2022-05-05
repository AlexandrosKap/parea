------------------ Function is from: https://store.dhall-lang.org/Prelude-v21.1.0/List/map.dhall.html
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

let Line = ./Line.dhall

let IndexedLine =
    { index : Natural
    , value : Line
    }

let fromIndexedLineToLine
    : IndexedLine -> Line
    =
    \(indexedLine : IndexedLine) ->
        { code = "${indexedLine.value.name}-${Natural/show indexedLine.index}-${indexedLine.value.scene}"
        , number = indexedLine.index
        , scene = indexedLine.value.scene
        , name = indexedLine.value.name
        , text = indexedLine.value.text
        } : Line

let newLineSet
    : List Line -> List Line
    =
    \(lines : List Line) ->
        map
        IndexedLine
        Line
        fromIndexedLineToLine
        (List/indexed Line lines)

in  newLineSet
