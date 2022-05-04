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
- Play animation(s) to go with the line

## System

- One backend, many frontends
- Dhall as a scripting language

## Data
```dhall
{ code   : Text
, name   : Text
, number : Natural
, scene  : Text
, text   : Text
}
```
