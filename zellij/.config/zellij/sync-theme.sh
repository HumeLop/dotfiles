#!/usr/bin/env zsh

# Script para sincronizar el tema de Omarchy con Zellij
# Este script lee el tema actual de Omarchy y actualiza la configuración de Zellij

# Obtener el tema actual de Omarchy
OMARCHY_THEME_PATH="$HOME/.config/omarchy/current/theme"

if [[ ! -L "$OMARCHY_THEME_PATH" ]]; then
    echo "No se encontró el tema de Omarchy en $OMARCHY_THEME_PATH"
    exit 1
fi

# Extraer el nombre del tema del symlink
THEME_NAME=$(basename "$(readlink "$OMARCHY_THEME_PATH")")

# Mapeo de nombres de temas Omarchy a Zellij
case "$THEME_NAME" in
    "catppuccin")
        ZELLIJ_THEME="catppuccin-mocha"
        ;;
    "catppuccin-latte")
        ZELLIJ_THEME="catppuccin-latte"
        ;;
    "everforest")
        ZELLIJ_THEME="everforest"
        ;;
    "gruvbox")
        ZELLIJ_THEME="gruvbox"
        ;;
    "kanagawa")
        ZELLIJ_THEME="kanagawa"
        ;;
    "nord")
        ZELLIJ_THEME="nord"
        ;;
    "tokyo-night")
        ZELLIJ_THEME="tokyo-night"
        ;;
    "rose-pine"|"rose-pine-dark")
        ZELLIJ_THEME="rose-pine"
        ;;
    "flexoki-light")
        ZELLIJ_THEME="flexoki-light"
        ;;
    "matte-black")
        ZELLIJ_THEME="matte-black"
        ;;
    "osaka-jade")
        ZELLIJ_THEME="osaka-jade"
        ;;
    "ristretto")
        ZELLIJ_THEME="ristretto"
        ;;
    "arc-blueberry")
        ZELLIJ_THEME="arc-blueberry"
        ;;
    *)
        echo "Tema '$THEME_NAME' no está mapeado en Zellij, usando catppuccin-mocha por defecto"
        ZELLIJ_THEME="catppuccin-mocha"
        ;;
esac

# Archivo de configuración de Zellij
ZELLIJ_CONFIG="$HOME/.config/zellij/config.kdl"

# Verificar si el archivo existe
if [[ ! -f "$ZELLIJ_CONFIG" ]]; then
    echo "No se encontró la configuración de Zellij en $ZELLIJ_CONFIG"
    exit 1
fi

# Actualizar la línea del tema en el archivo de configuración
# Buscar la línea que contiene 'theme' y reemplazarla
if grep -q '^theme ' "$ZELLIJ_CONFIG"; then
    # Si existe una línea de tema sin comentar, reemplazarla
    sed -i "s/^theme .*$/theme \"$ZELLIJ_THEME\"/" "$ZELLIJ_CONFIG"
elif grep -q '^// theme ' "$ZELLIJ_CONFIG"; then
    # Si la línea está comentada, descomentarla y actualizarla
    sed -i "s|^// theme .*$|theme \"$ZELLIJ_THEME\"|" "$ZELLIJ_CONFIG"
else
    # Si no existe, agregarla después de la sección web_client
    sed -i "/^web_client {/,/^}/a\\theme \"$ZELLIJ_THEME\"" "$ZELLIJ_CONFIG"
fi

echo "✓ Tema de Zellij actualizado a: $ZELLIJ_THEME (desde Omarchy: $THEME_NAME)"

# Actualizar colores en todos los layouts preservando separadores
UPDATE_LAYOUTS_SCRIPT="$HOME/.config/zellij/update-all-layouts.sh"
if [[ -x "$UPDATE_LAYOUTS_SCRIPT" ]]; then
    echo ""
    "$UPDATE_LAYOUTS_SCRIPT"
else
    echo "⚠️  Script de actualización de layouts no encontrado o sin permisos"
fi
