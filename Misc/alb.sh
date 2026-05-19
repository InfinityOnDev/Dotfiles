#!/bin/sh
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

export QT_QPA_PLATFORM_PLUGIN_PATH="$SCRIPTPATH/launcher/plugins/platforms"
export QT_PLUGIN_PATH="$SCRIPTPATH/launcher/plugins/"

# Wayland/Niri optimizations
export QT_QPA_PLATFORM="wayland"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export WAYLAND_DISPLAY=wayland-1

# Intel iGPU optimizations
export MESA_GL_VERSION_OVERRIDE=4.6
export MESA_GLSL_VERSION_OVERRIDE=460
export LIBGL_ALWAYS_INDIRECT=0
export GALLIUM_DRIVER=iris

# Better performance for Intel Arc/UHD
export __GL_THREADED_OPTIMIZATIONS=1
export __GL_MaxFramesAllowed=0

# Vulkan optimization (if the game supports it)
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json

# Disable VSync if stuttering occurs (comment out if you prefer VSync)
# export __GL_SYNC_TO_VBLANK=0

"$SCRIPTPATH/game_x64/Albion-Online" "--no-sandbox" "-loglevel 0" "$@" &
