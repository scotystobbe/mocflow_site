#!/bin/bash

# Script to convert MOCFlow logo to favicon
# Creates multiple sizes and formats for best browser compatibility

LOGO="assets/mocflow_logo.png"
OUTPUT_DIR="assets/favicons"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Create various favicon sizes
echo "Creating favicon sizes..."

# 16x16 (standard favicon)
magick "$LOGO" -resize 16x16 -background none -gravity center -extent 16x16 "$OUTPUT_DIR/favicon-16x16.png"

# 32x32 (standard favicon)
magick "$LOGO" -resize 32x32 -background none -gravity center -extent 32x32 "$OUTPUT_DIR/favicon-32x32.png"

# 96x96 (desktop)
magick "$LOGO" -resize 96x96 -background none -gravity center -extent 96x96 "$OUTPUT_DIR/favicon-96x96.png"

# 192x192 (Android)
magick "$LOGO" -resize 192x192 -background none -gravity center -extent 192x192 "$OUTPUT_DIR/android-chrome-192x192.png"

# 512x512 (Android)
magick "$LOGO" -resize 512x512 -background none -gravity center -extent 512x512 "$OUTPUT_DIR/android-chrome-512x512.png"

# Apple touch icon (180x180)
magick "$LOGO" -resize 180x180 -background none -gravity center -extent 180x180 "$OUTPUT_DIR/apple-touch-icon.png"

# Create .ico file (combines 16x16 and 32x32)
magick "$OUTPUT_DIR/favicon-16x16.png" "$OUTPUT_DIR/favicon-32x32.png" "$OUTPUT_DIR/favicon.ico"

# Copy the 32x32 as favicon.ico alternative (some systems prefer this)
cp "$OUTPUT_DIR/favicon-32x32.png" "$OUTPUT_DIR/favicon.png"

echo "Favicon creation complete!"
echo "Files created in $OUTPUT_DIR/"
