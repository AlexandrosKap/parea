# Parea

A simple dialogue system for the Godot Engine.
This project is part of another project called Volta.

Godot version: 3.4.4

![parea1](https://raw.githubusercontent.com/AlexandrosKap/volta-pictures/main/parea1.png)

## Basic Features

- [x] Representation of the line
- [x] Ability to indicate speaker
- [ ] Pause before a line
- [x] Pick one line or play all from a set
- [x] Play a line sequentially or randomly
- [ ] Play animation(s) to go with the line
- [x] One backend, many frontends
- [x] Dhall as a scripting language

## Line Data
```dhall
{ code    : Text
, emotion : Text
, name    : Text
, number  : Natural
, pause   : Double
, scene   : Text
, set     : Text
, sound   : Text
, text    : Text
}
```
