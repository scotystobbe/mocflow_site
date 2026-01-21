#!/bin/bash

# Script to convert MOCFlow logo to favicon
# Creates multiple sizes and formats for best browser compatibility

LOGO="assets/favicons/favicon_logo_512x512.png"
OUTPUT_DIR="assets/favicons"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Function to create favicon by resizing (logo already has rounded corners)
# Parameters: size, output_file
create_favicon() {
    local size=$1
    local output=$2
    
    # Simply resize the logo to the target size (maintains aspect ratio and rounded corners)
    magick "$LOGO" -resize ${size}x${size} -background none -gravity center -extent ${size}x${size} "$output"
}

# Create various favicon sizes
echo "Creating favicon sizes from favicon_logo_512x512.png..."

# 16x16 (standard favicon)
create_favicon 16 "$OUTPUT_DIR/favicon-16x16.png"

# 32x32 (standard favicon)
create_favicon 32 "$OUTPUT_DIR/favicon-32x32.png"

# 96x96 (desktop)
create_favicon 96 "$OUTPUT_DIR/favicon-96x96.png"

# 192x192 (Android)
create_favicon 192 "$OUTPUT_DIR/android-chrome-192x192.png"

# 512x512 (Android) - using high-quality 512x512 source
create_favicon 512 "$OUTPUT_DIR/android-chrome-512x512.png"

# Apple touch icon (180x180)
create_favicon 180 "$OUTPUT_DIR/apple-touch-icon.png"

# Create .ico file (combines 16x16 and 32x32)
magick "$OUTPUT_DIR/favicon-16x16.png" "$OUTPUT_DIR/favicon-32x32.png" "$OUTPUT_DIR/favicon.ico"

# Copy the 32x32 as favicon.ico alternative (some systems prefer this)
cp "$OUTPUT_DIR/favicon-32x32.png" "$OUTPUT_DIR/favicon.png"

echo "Favicon creation complete!"
echo "Files created in $OUTPUT_DIR/"
