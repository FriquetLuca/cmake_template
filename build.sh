#!/usr/bin/env bash
set -e

# Default build type
BUILD_TYPE="Debug"

# Handle flags
if [[ "$1" == "--release" ]]; then
    BUILD_TYPE="Release"
elif [[ "$1" == "--debug" ]]; then
    BUILD_TYPE="Debug"
fi

# Detect platform
case "$OSTYPE" in
  linux*)   platform="linux" ;;
  darwin*)  platform="macos" ;;
  msys*|cygwin*|win32*) platform="windows" ;;
  *)        platform="unknown" ;;
esac

echo "🧠 Detected OS: $platform"
echo "🔧 Build type: $BUILD_TYPE"

# Remove old build directory
[ -d build ] && rm -rf build

# Choose a generator
CMAKE_GENERATOR=""
case "$platform" in
  linux|macos)
    if command -v ninja >/dev/null 2>&1; then
        CMAKE_GENERATOR="Ninja"
    else
        CMAKE_GENERATOR="Unix Makefiles"
    fi
    ;;
  windows)
    if command -v ninja >/dev/null 2>&1; then
        CMAKE_GENERATOR="Ninja"
    else
        CMAKE_GENERATOR="NMake Makefiles"
    fi
    ;;
  *)
    echo "❌ Unsupported platform: $platform"
    exit 1
    ;;
esac

echo "🛠️ Using generator: $CMAKE_GENERATOR"

# Configure with CMake
cmake -S . -B build \
    -G "$CMAKE_GENERATOR" \
    -DCMAKE_BUILD_TYPE="$BUILD_TYPE"

# Build
cmake --build build
