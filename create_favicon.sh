#!/bin/bash

# Script to convert MOCFlow logo to favicon
# Creates multiple sizes and formats for best browser compatibility

LOGO="assets/mocflow_logo.png"
OUTPUT_DIR="assets/favicons"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Function to create favicon with rounded corners
# Parameters: size, output_file, corner_radius
create_favicon() {
    local size=$1
    local output=$2
    local radius=$3
    
    # Create the resized image
    magick "$LOGO" -resize ${size}x${size} -background none -gravity center -extent ${size}x${size} \
        \( +clone -alpha extract -draw "fill black polygon 0,0 0,${radius} ${radius},0 fill white circle ${radius},${radius} ${radius},0" \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \) \
        -alpha off -compose CopyOpacity -composite "$output"
}

# Function to create favicon with rounded corners
# Parameters: size, output_file, corner_radius
create_favicon() {
    local size=$1
    local output=$2
    local radius=$3
    
    # Create rounded rectangle mask
    magick -size ${size}x${size} xc:none -draw "roundrectangle 0,0 $((size-1)),$((size-1)) $radius,$radius" \
        \( "$LOGO" -resize ${size}x${size} -background none -gravity center -extent ${size}x${size} \) \
        -compose DstIn -composite "$output"
}

# Create various favicon sizes with rounded corners
echo "Creating favicon sizes with rounded corners..."

# Calculate corner radius proportionally (20px on ~300px logo = ~6.67% of size)
# 16x16 (standard favicon) - radius 1px
create_favicon 16 "$OUTPUT_DIR/favicon-16x16.png" 1

# 32x32 (standard favicon) - radius 2px
create_favicon 32 "$OUTPUT_DIR/favicon-32x32.png" 2

# 96x96 (desktop) - radius 6px
create_favicon 96 "$OUTPUT_DIR/favicon-96x96.png" 6

# 192x192 (Android) - radius 13px
create_favicon 192 "$OUTPUT_DIR/android-chrome-192x192.png" 13

# 512x512 (Android) - radius 34px
create_favicon 512 "$OUTPUT_DIR/android-chrome-512x512.png" 34

# Apple touch icon (180x180) - radius 12px
create_favicon 180 "$OUTPUT_DIR/apple-touch-icon.png" 12

# Create .ico file (combines 16x16 and 32x32)
magick "$OUTPUT_DIR/favicon-16x16.png" "$OUTPUT_DIR/favicon-32x32.png" "$OUTPUT_DIR/favicon.ico"

# Copy the 32x32 as favicon.ico alternative (some systems prefer this)
cp "$OUTPUT_DIR/favicon-32x32.png" "$OUTPUT_DIR/favicon.png"

echo "Favicon creation complete!"
echo "Files created in $OUTPUT_DIR/"
