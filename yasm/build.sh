#!/bin/bash


yasm -f elf64 "${1}.s"
ld -o $1 "${1}.o"
