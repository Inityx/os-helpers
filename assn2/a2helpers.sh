#!/bin/bash
b() { gcc ./*buildrooms.c -o buildrooms; gcc ./*adventure.c -o adventure -lpthread; }
g() { ./buildrooms && tree && cat ./*.rooms.*/* | head -n30; }
a() { ./adventure && echo $?; }
v() { vim -p ./*.c; }
