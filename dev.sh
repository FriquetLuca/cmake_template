#!/usr/bin/env bash
set -e  # Exit on any error

# Path to the executable
EXECUTABLE="./build/hello"

# Handle --rebuild flag
if [[ "$1" == "--rebuild" ]]; then
    echo "🔁 Forcing rebuild..."
    ./build.sh || { echo "❌ Build failed. Exiting."; exit 1; }
else
    # Check if build folder or executable is missing
    if [[ ! -d "build" ]] || [[ ! -f "$EXECUTABLE" ]]; then
        echo "📦 Build missing artifacts. Building project..."
        ./build.sh || { echo "❌ Build failed. Exiting."; exit 1; }
    fi
fi

# Run the program once
echo "🚀 Running the program..."
exec "$EXECUTABLE"
