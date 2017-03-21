#!/bin/sh

PROJECT_NAME="$1"

mkdir -p ./$PROJECT_NAME/{lib,lib_test,lwt}
cp ~/.vim/.merlin ./$PROJECT_NAME/
