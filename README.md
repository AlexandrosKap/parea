# Parea

A simple dialogue system for the Godot Engine.
This project is part of another project called Volta.

Godot version: 3.4.4

## Basic Features

- Representation of the line
- Ability to indicate speaker
- Pause before a line
- Pick one line or play all from a set
- Play a line sequentially or randomly
- Play aniamtion(s) to go with the line

## System

- One backend, many frontends
- Dhall as a scripting language

## Data

```dhall
-- line.dhall

let Line =
    { scene     : Text      -- wod
    , actor     : Text      -- alx
    , pause     : Double    -- 0.0
    , number    : Natural   -- 22
    , text      : Text      -- "This is just very cool."
    , animation : Text      -- "intro"
    , code      : Text      -- "wod-number-alx"
    }

let line =
    \(scene : Text) ->
        \(actor : Text) ->
            \(pause : Double) ->
                \(number : Natural) ->
                    \(text : Text) ->
                        \(animation : Text) ->
                            { scene
                            , actor
                            , pause
                            , number
                            , text
                            , animation
                            , code = "${scene}${Natural/show number}${actor}"
                            } : Line

in  line
```
