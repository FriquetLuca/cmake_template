#!/usr/bin/env bash
set -e  # Exit on error

# Step 1: Create build directory if missing
if [ ! -d build ]; then
    echo "[INFO] Build folder not found. Building project..."
    ./build.sh || { echo "❌ Build failed. Exiting."; exit 1; }
fi

cd build

# Step 2: Build only what's needed (incremental)
echo "[INFO] Building (incremental)..."
cmake --build .

# Step 3: Run tests
echo "[INFO] Running tests..."
ctest --output-on-failure

cd ..
