#!/bin/bash
c() { gcc -o smallsh ./*.c; }
g() { ../../p3testscript 2>&1 | tee results | less; }
v() { vim -p ./*.c; }
