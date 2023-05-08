#!/bin/bash

echo 'compiling elm...'
echo ''

elm make ./src/Main.elm --output app.js
