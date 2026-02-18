#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
BASE_DIR="$1"

# Identify Product/System_ext directories
if [ -d "$BASE_DIR/product" ] && [ ! -L "$BASE_DIR/product" ]; then
    product="$BASE_DIR/product"
elif [ -d "$BASE_DIR/system/product" ] && [ ! -L "$BASE_DIR/system/product" ]; then
    product="$BASE_DIR/system/product"
else
    product="$BASE_DIR/system/product"
fi

if [ -d "$BASE_DIR/system_ext" ] && [ ! -L "$BASE_DIR/system_ext" ]; then
    system_ext="$BASE_DIR/system_ext"
elif [ -d "$BASE_DIR/system/system_ext" ] && [ ! -L "$BASE_DIR/system/system_ext" ]; then
    system_ext="$BASE_DIR/system/system_ext"
else
    system_ext="$BASE_DIR/system/system_ext"
fi

echo "==> Starting Conservative Debloat..."

# ==========================================
# 1. HEAVY FILES (Safe to remove)
# ==========================================
# Carrier/region preloads - safe, not system-critical
rm -rf "$BASE_DIR/system/prism/"*
rm -rf "$BASE_DIR/system/optics/"*
rm -rf "$BASE_DIR/system/preload/"*
rm -rf "$BASE_DIR/system/hidden/"*
rm -rf "$BASE_DIR/system/saiv/"*

# Recovery blobs - not needed post-flash
rm -f "$BASE_DIR/system/recovery-from-boot.p"
rm -f "$BASE_DIR/system/etc/recovery-resource.dat"

# Wallpapers and video media
rm -rf "$BASE_DIR/system/wallpaper/"*
rm -rf "$BASE_DIR/system/media/video/"*
rm -rf "$BASE_DIR/system/media/wallpaper/"*

# TTS voice data (very large, user can reinstall language packs)
rm -rf "$BASE_DIR/system/tts/"*
rm -rf "$BASE_DIR/system/voicebwt/"*

# ==========================================
# 2. SYSTEM APPS (Low-risk bloat)
# ==========================================
# These are standalone apps with no system service dependencies
rm -rf "$BASE_DIR/system/app/EasterEgg"
rm -rf "$BASE_DIR/system/app/DictDiotekForSec"
rm -rf "$BASE_DIR/system/app/FBAppManager_NS"
rm -rf "$BASE_DIR/system/app/Facebook"*
rm -rf "$BASE_DIR/system/app/KidsHome"*
rm -rf "$BASE_DIR/system/app/LinkSharing"*
rm -rf "$BASE_DIR/system/app/MSSkype"*
rm -rf "$BASE_DIR/system/app/OneDrive"*
rm -rf "$BASE_DIR/system/app/SamsungBilling"
rm -rf "$BASE_DIR/system/app/SamsungCheckout"
rm -rf "$BASE_DIR/system/app/SamsungCloud"*
rm -rf "$BASE_DIR/system/app/SamsungFree"*
rm -rf "$BASE_DIR/system/app/SamsungDaily"*
rm -rf "$BASE_DIR/system/app/SamsungGlobalGoals"
rm -rf "$BASE_DIR/system/app/SamsungKids"*
rm -rf "$BASE_DIR/system/app/SamsungMembers"*
rm -rf "$BASE_DIR/system/app/SamsungMusic"*
rm -rf "$BASE_DIR/system/app/SamsungNews"*
rm -rf "$BASE_DIR/system/app/SamsungSocial"*
rm -rf "$BASE_DIR/system/app/SamsungVideo"*
rm -rf "$BASE_DIR/system/app/SamsungWeather"*
rm -rf "$BASE_DIR/system/app/SBrowser"*
rm -rf "$BASE_DIR/system/app/SmartReminder"
rm -rf "$BASE_DIR/system/app/SmartSwitch"*
rm -rf "$BASE_DIR/system/app/StoryService"
rm -rf "$BASE_DIR/system/app/Tips"*
rm -rf "$BASE_DIR/system/app/Upday"*
rm -rf "$BASE_DIR/system/app/VideoEditor"*
rm -rf "$BASE_DIR/system/app/VideoTrimmer"
rm -rf "$BASE_DIR/system/app/WebManual"
rm -rf "$BASE_DIR/system/app/Yahoo"*
rm -rf "$BASE_DIR/system/app/YourPhone"*
rm -rf "$BASE_DIR/system/priv-app/AppUpdateCenter"
rm -rf "$BASE_DIR/system/priv-app/AutoDoodle"
rm -rf "$BASE_DIR/system/priv-app/CallLogBackup"
rm -rf "$BASE_DIR/system/priv-app/FBInstaller_NS"
rm -rf "$BASE_DIR/system/priv-app/FBServices"
rm -rf "$BASE_DIR/system/priv-app/GalaxyApps"*
rm -rf "$BASE_DIR/system/priv-app/GalaxyCare"*
rm -rf "$BASE_DIR/system/priv-app/GoogleFeedback"
rm -rf "$BASE_DIR/system/priv-app/Honeyboard"
rm -rf "$BASE_DIR/system/priv-app/LedCoverService"
rm -rf "$BASE_DIR/system/priv-app/LiveDrawing"
rm -rf "$BASE_DIR/system/priv-app/LiveStickers"
rm -rf "$BASE_DIR/system/priv-app/MateAgent"
rm -rf "$BASE_DIR/system/priv-app/Netflix"*
rm -rf "$BASE_DIR/system/priv-app/OneDrive"*
rm -rf "$BASE_DIR/system/priv-app/OnlineHelp"
rm -rf "$BASE_DIR/system/priv-app/PeopleStripe"
rm -rf "$BASE_DIR/system/priv-app/PhotoEditor"*
rm -rf "$BASE_DIR/system/priv-app/Rubin"
rm -rf "$BASE_DIR/system/priv-app/SamsungBilling"
rm -rf "$BASE_DIR/system/priv-app/SamsungCloud"*
rm -rf "$BASE_DIR/system/priv-app/SamsungMagnifier"
rm -rf "$BASE_DIR/system/priv-app/SamsungSocial"*
rm -rf "$BASE_DIR/system/priv-app/SamsungVideo"*
rm -rf "$BASE_DIR/system/priv-app/ShareLive"
rm -rf "$BASE_DIR/system/priv-app/SingleTake"*
rm -rf "$BASE_DIR/system/priv-app/Sticker"*
rm -rf "$BASE_DIR/system/priv-app/Tips"*
rm -rf "$BASE_DIR/system/priv-app/Upday"
rm -rf "$BASE_DIR/system/priv-app/VRSetup"*
rm -rf "$BASE_DIR/system/priv-app/YourPhone"*
rm -rf "$product/app/Chrome"
rm -rf "$product/app/Gmail2"
rm -rf "$product/app/YouTube"
rm -rf "$product/app/Music2"
rm -rf "$product/app/Videos"
rm -rf "$product/app/Drive"
rm -rf "$product/app/Duo"
rm -rf "$product/app/Meet"
rm -rf "$product/app/NewsStand"
rm -rf "$product/app/PlayGames"
rm -rf "$product/app/Books"
rm -rf "$product/app/Talkback"
rm -rf "$product/priv-app/AndroidAutoStub"
rm -rf "$product/priv-app/Wellbeing"


# ==========================================
# 5. STRIP DEBUG SYMBOLS FROM NATIVE LIBS
# ==========================================
echo "==> Stripping debug symbols from native libs..."

find "$BASE_DIR" -name "lib*.so" -type f | while read -r lib; do
    # Only strip ELF files (sanity check)
    if file "$lib" 2>/dev/null | grep -q "ELF"; then
        strip --strip-unneeded "$lib" 2>/dev/null && echo "  Stripped: $lib"
    fi
done

echo "==> Strip complete."

# ==========================================
# 6. INJECT OPENCAMERA + CUSTOM BINARIES
# ==========================================
rsync -ra "$SCRIPT_DIR/OpenCamera" "$BASE_DIR/system/priv-app/"
rsync -ra "$SCRIPT_DIR/bin/" "$BASE_DIR/system/bin"
rsync -ra "$SCRIPT_DIR/lib64/" "$BASE_DIR/system/lib64"

echo "==> Conservative Debloat Complete."
