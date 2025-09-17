#!/usr/bin/env bash
set -e

# Optional: remove build directory if you want a clean build
[ -d build ] && rm -rf build

# Use -S to specify source dir and -B for build dir
cmake -S . -B build

# Build using the generator-agnostic command
cmake --build build
