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

let fromIndexedLineToLine : IndexedLine -> Line =
    \(indexedLine : IndexedLine) ->
        { code = "${Natural/show indexedLine.index}${indexedLine.value.code}"
        , number = indexedLine.index
        , scene = indexedLine.value.scene
        , name = indexedLine.value.name
        , text = indexedLine.value.text
        }

let addPathToLine : Text -> Line -> Line =
    \(path : Text) ->
    \(line : Line) ->
        { code = "${path}${line.code}"
        , name = line.name
        , number = line.number
        , scene = line.scene
        , text = line.text
        }

let newLineSet : Text -> List Line -> List Line =
    \(path : Text) ->
    \(lines : List Line) ->
        let addPathToLine = addPathToLine path

        let part1 =
            map
            IndexedLine
            Line
            fromIndexedLineToLine
            (List/indexed Line lines)

        let part2 =
            map
            Line
            Line
            addPathToLine
            part1

        in  part2

in  newLineSet
