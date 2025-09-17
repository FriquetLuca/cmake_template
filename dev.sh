#!/usr/bin/env bash
set -e

# Determine OS to set executable extension
EXT=""
[[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]] && EXT=".exe"

EXECUTABLE="./build/bin/hello$EXT"

# Parse flags
REBUILD=false
BUILD_TYPE="--debug"  # Default

for arg in "$@"; do
    case $arg in
        --rebuild) REBUILD=true ;;
        --release) BUILD_TYPE="--release" ;;
        --debug)   BUILD_TYPE="--debug" ;;
    esac
done

# Handle rebuild or missing build
if [[ "$REBUILD" == true ]]; then
    echo "🔁 Forcing rebuild..."
    ./build.sh "$BUILD_TYPE" || { echo "❌ Build failed. Exiting."; exit 1; }
else
    if [[ ! -d "build" ]] || [[ ! -f "$EXECUTABLE" ]]; then
        echo "📦 Build missing artifacts. Building project..."
        ./build.sh "$BUILD_TYPE" || { echo "❌ Build failed. Exiting."; exit 1; }
    fi
fi

# Run the program
echo "🚀 Running the program..."
exec "$EXECUTABLE"
