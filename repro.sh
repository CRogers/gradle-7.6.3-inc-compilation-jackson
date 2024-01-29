#!/bin/bash

echo 'compiling java for the first time'
./gradlew compileJava

echo 'changing a source file and grepping compile output for incremental'
sed -i.bak -E "s/MESSAGE = \".*\";/MESSAGE = \"$(uuidgen)\";/" src/main/java/app/Main.java && rm src/main/java/app/Main.java.bak
./gradlew compileJava --info | grep -i incremental
