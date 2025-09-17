#!/usr/bin/env bash
set -e  # Exit on error

# Default build type
BUILD_TYPE="Debug"

# Parse arguments
for arg in "$@"; do
    case $arg in
        --release) BUILD_TYPE="Release" ;;
        --debug) BUILD_TYPE="Debug" ;;
    esac
done

BUILD_DIR="build"

# Optionally: use separate folders for debug and release
# BUILD_DIR="build-$BUILD_TYPE"

# Step 1: Ensure build directory exists
if [ ! -d "$BUILD_DIR" ]; then
    echo "[INFO] Build folder '$BUILD_DIR' not found. Building project..."
    ./build.sh "--${BUILD_TYPE,,}" || { echo "❌ Build failed. Exiting."; exit 1; }
fi

# Step 2: Incremental build
echo "[INFO] Building (incremental) in $BUILD_DIR..."
cmake --build "$BUILD_DIR"

# Step 3: Run tests
echo "[INFO] Running tests in $BUILD_DIR..."
cd "$BUILD_DIR"
ctest --output-on-failure
cd ..
