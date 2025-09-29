#!/bin/bash

# Catppuccin Ghostty Themes Downloader
# Downloads all 4 Catppuccin theme variants for Ghostty

# Set the themes directory
THEMES_DIR="$(dirname "$0")/themes"

# Create themes directory if it doesn't exist
mkdir -p "$THEMES_DIR"

# Base URL for raw GitHub content
BASE_URL="https://raw.githubusercontent.com/catppuccin/ghostty/main/themes"

# Array of theme files to download
THEMES=(
    "catppuccin-frappe.conf"
    "catppuccin-latte.conf"
    "catppuccin-macchiato.conf"
    "catppuccin-mocha.conf"
)

echo "🎨 Downloading Catppuccin themes for Ghostty..."
echo "Destination: $THEMES_DIR"
echo ""

# Download each theme file
for theme in "${THEMES[@]}"; do
    echo "📥 Downloading $theme..."
    if curl -sL "$BASE_URL/$theme" -o "$THEMES_DIR/$theme"; then
        echo "✅ Successfully downloaded $theme"
    else
        echo "❌ Failed to download $theme"
    fi
done

echo ""
echo "🎉 Download complete! Available themes:"
ls -la "$THEMES_DIR"/*.conf 2>/dev/null || echo "No .conf files found in themes directory"

echo ""
echo "To use a theme, add this line to your ghostty config file:"
echo 'theme = "catppuccin-mocha"  # or frappe, latte, macchiato'
