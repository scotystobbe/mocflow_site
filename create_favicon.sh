#!/bin/bash

# Script to convert MOCFlow logo to favicon
# Creates multiple sizes and formats for best browser compatibility

LOGO="assets/favicons/favicon_logo.png"
OUTPUT_DIR="assets/favicons"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Function to create favicon with rounded corners
# Parameters: size, output_file, corner_radius
create_favicon() {
    local size=$1
    local output=$2
    local radius=$3
    
    # Resize the logo to the target size
    magick "$LOGO" -resize ${size}x${size} -background none -gravity center -extent ${size}x${size} temp_img.png
    
    # Create a rounded rectangle mask (white = visible, black = transparent)
    magick -size ${size}x${size} xc:black -fill white -draw "roundrectangle 0,0 $((size-1)),$((size-1)) $radius,$radius" temp_mask.png
    
    # Apply the mask using CopyOpacity
    magick temp_img.png temp_mask.png -alpha off -compose CopyOpacity -composite "$output"
    
    # Clean up temporary files
    rm -f temp_img.png temp_mask.png
}

# Create various favicon sizes with rounded corners
echo "Creating favicon sizes with rounded corners..."

# Calculate corner radius proportionally - using ~12% of size for more rounded corners
# (more rounded than the 6.67% used on the site logo)
# 16x16 (standard favicon) - radius 2px (~12.5%)
create_favicon 16 "$OUTPUT_DIR/favicon-16x16.png" 2

# 32x32 (standard favicon) - radius 4px (~12.5%)
create_favicon 32 "$OUTPUT_DIR/favicon-32x32.png" 4

# 96x96 (desktop) - radius 12px (~12.5%)
create_favicon 96 "$OUTPUT_DIR/favicon-96x96.png" 12

# 192x192 (Android) - radius 24px (~12.5%)
create_favicon 192 "$OUTPUT_DIR/android-chrome-192x192.png" 24

# 512x512 (Android) - radius 64px (~12.5%)
create_favicon 512 "$OUTPUT_DIR/android-chrome-512x512.png" 64

# Apple touch icon (180x180) - radius 22px (~12.2%)
create_favicon 180 "$OUTPUT_DIR/apple-touch-icon.png" 22

# Create .ico file (combines 16x16 and 32x32)
magick "$OUTPUT_DIR/favicon-16x16.png" "$OUTPUT_DIR/favicon-32x32.png" "$OUTPUT_DIR/favicon.ico"

# Copy the 32x32 as favicon.ico alternative (some systems prefer this)
cp "$OUTPUT_DIR/favicon-32x32.png" "$OUTPUT_DIR/favicon.png"

echo "Favicon creation complete!"
echo "Files created in $OUTPUT_DIR/"
