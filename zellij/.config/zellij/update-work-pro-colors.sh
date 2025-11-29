#!/usr/bin/env zsh

# Script para actualizar colores en work-pro.kdl sin tocar los separadores
# Este script parte del template (Catppuccin) y aplica los colores del tema actual

OMARCHY_THEME_PATH="$HOME/.config/omarchy/current/theme"

if [[ ! -L "$OMARCHY_THEME_PATH" ]]; then
    echo "❌ No se encontró el tema de Omarchy"
    exit 1
fi

THEME_NAME=$(basename "$(readlink "$OMARCHY_THEME_PATH")")
TEMPLATE_FILE="$HOME/.config/zellij/layouts/work-pro.template.kdl"
LAYOUT_FILE="$HOME/.config/zellij/layouts/work-pro.kdl"

echo "✨ Generando work-pro.kdl con tema: $THEME_NAME"

# Copiar template y aplicar colores
cp "$TEMPLATE_FILE" "$LAYOUT_FILE"

# Actualizar tabs (de nvim/shell a Editor/Terminal/Git/Monitor)
sed -i '2s/tab name="nvim"/tab name="Editor"/' "$LAYOUT_FILE"
sed -i '3s|pane command="/home/linuxbrew/.linuxbrew/bin/nvim"|pane command="nvim"|' "$LAYOUT_FILE"
sed -i '6s/tab name="shell"/tab name="Terminal"/' "$LAYOUT_FILE"

# Agregar tabs Git y Monitor si no existen
if ! grep -q 'tab name="Git"' "$LAYOUT_FILE"; then
    sed -i '8a\\n    tab name="Git" {\n        pane\n    }\n\n    tab name="Monitor" {\n        pane\n    }' "$LAYOUT_FILE"
fi

# Mapeo de colores según el tema
case "$THEME_NAME" in
    "catppuccin")
        # Catppuccin Mocha (colores originales de test.kdl)
        echo "🎨 Tema: Catppuccin Mocha (ya está configurado)"
        ;;

    "everforest")
        # Reemplazar colores de Catppuccin por Everforest
        sed -i \
            -e 's/#76946A/#a7c080/g' \
            -e 's/#74c7ec/#7fbbb3/g' \
            -e 's/#11111b/#1e2326/g' \
            -e 's/#313244/#3d484d/g' \
            -e 's/#45475a/#475258/g' \
            -e 's/#f2cdcd/#d699b6/g' \
            -e 's/#eba0ac/#e67e80/g' \
            -e 's/#a6e3a1/#a7c080/g' \
            -e 's/#cba6f7/#d699b6/g' \
            -e 's/#f38ba8/#e67e80/g' \
            -e 's/#94e2d5/#83c092/g' \
            -e 's/#f9e2af/#dbbc7f/g' \
            -e 's/#f5c2e7/#d699b6/g' \
            -e 's/#89b4fa/#7fbbb3/g' \
            -e 's/#fab387/#e69875/g' \
            -e 's/#C0A36E/#5a6873/g' \
            -e 's/#cdd6f4/#d3c6aa/g' \
            "$LAYOUT_FILE"
        echo "✓ Colores de Everforest aplicados"
        ;;

    "kanagawa")
        # Reemplazar colores de Catppuccin por Kanagawa
        sed -i \
            -e 's/#76946A/#76946a/g' \
            -e 's/#74c7ec/#7fb4ca/g' \
            -e 's/#11111b/#1f1f28/g' \
            -e 's/#313244/#2a2a37/g' \
            -e 's/#45475a/#363646/g' \
            -e 's/#f2cdcd/#d27e99/g' \
            -e 's/#eba0ac/#e46876/g' \
            -e 's/#a6e3a1/#76946a/g' \
            -e 's/#cba6f7/#957fb8/g' \
            -e 's/#f38ba8/#c34043/g' \
            -e 's/#94e2d5/#6a9589/g' \
            -e 's/#f9e2af/#c0a36e/g' \
            -e 's/#f5c2e7/#d27e99/g' \
            -e 's/#89b4fa/#7e9cd8/g' \
            -e 's/#fab387/#ffa066/g' \
            -e 's/#C0A36E/#c0a36e/g' \
            -e 's/#cdd6f4/#dcd7ba/g' \
            "$LAYOUT_FILE"
        echo "✓ Colores de Kanagawa aplicados"
        ;;

    "gruvbox")
        sed -i \
            -e 's/#76946A/#98971a/g' -e 's/#74c7ec/#83a598/g' -e 's/#11111b/#282828/g' \
            -e 's/#313244/#3c3836/g' -e 's/#45475a/#504945/g' -e 's/#f2cdcd/#d3869b/g' \
            -e 's/#eba0ac/#cc241d/g' -e 's/#a6e3a1/#98971a/g' -e 's/#cba6f7/#b16286/g' \
            -e 's/#f38ba8/#cc241d/g' -e 's/#94e2d5/#689d6a/g' -e 's/#f9e2af/#d79921/g' \
            -e 's/#f5c2e7/#d3869b/g' -e 's/#89b4fa/#458588/g' -e 's/#fab387/#d65d0e/g' \
            -e 's/#C0A36E/#d79921/g' -e 's/#cdd6f4/#ebdbb2/g' "$LAYOUT_FILE"
        echo "✓ Colores de Gruvbox aplicados"
        ;;

    "nord")
        sed -i \
            -e 's/#76946A/#8fbcbb/g' -e 's/#74c7ec/#88c0d0/g' -e 's/#11111b/#2e3440/g' \
            -e 's/#313244/#3b4252/g' -e 's/#45475a/#434c5e/g' -e 's/#f2cdcd/#d08770/g' \
            -e 's/#eba0ac/#bf616a/g' -e 's/#a6e3a1/#a3be8c/g' -e 's/#cba6f7/#b48ead/g' \
            -e 's/#f38ba8/#bf616a/g' -e 's/#94e2d5/#8fbcbb/g' -e 's/#f9e2af/#ebcb8b/g' \
            -e 's/#f5c2e7/#b48ead/g' -e 's/#89b4fa/#5e81ac/g' -e 's/#fab387/#d08770/g' \
            -e 's/#C0A36E/#ebcb8b/g' -e 's/#cdd6f4/#eceff4/g' "$LAYOUT_FILE"
        echo "✓ Colores de Nord aplicados"
        ;;

    "tokyo-night")
        sed -i \
            -e 's/#76946A/#9ece6a/g' -e 's/#74c7ec/#7aa2f7/g' -e 's/#11111b/#1a1b26/g' \
            -e 's/#313244/#24283b/g' -e 's/#45475a/#414868/g' -e 's/#f2cdcd/#bb9af7/g' \
            -e 's/#eba0ac/#f7768e/g' -e 's/#a6e3a1/#9ece6a/g' -e 's/#cba6f7/#bb9af7/g' \
            -e 's/#f38ba8/#f7768e/g' -e 's/#94e2d5/#2ac3de/g' -e 's/#f9e2af/#e0af68/g' \
            -e 's/#f5c2e7/#bb9af7/g' -e 's/#89b4fa/#7aa2f7/g' -e 's/#fab387/#ff9e64/g' \
            -e 's/#C0A36E/#e0af68/g' -e 's/#cdd6f4/#c0caf5/g' "$LAYOUT_FILE"
        echo "✓ Colores de Tokyo Night aplicados"
        ;;

    "rose-pine"|"rose-pine-dark")
        sed -i \
            -e 's/#76946A/#31748f/g' -e 's/#74c7ec/#9ccfd8/g' -e 's/#11111b/#191724/g' \
            -e 's/#313244/#1f1d2e/g' -e 's/#45475a/#26233a/g' -e 's/#f2cdcd/#ebbcba/g' \
            -e 's/#eba0ac/#eb6f92/g' -e 's/#a6e3a1/#31748f/g' -e 's/#cba6f7/#c4a7e7/g' \
            -e 's/#f38ba8/#eb6f92/g' -e 's/#94e2d5/#9ccfd8/g' -e 's/#f9e2af/#f6c177/g' \
            -e 's/#f5c2e7/#ebbcba/g' -e 's/#89b4fa/#31748f/g' -e 's/#fab387/#f6c177/g' \
            -e 's/#C0A36E/#f6c177/g' -e 's/#cdd6f4/#e0def4/g' "$LAYOUT_FILE"
        echo "✓ Colores de Rose Pine aplicados"
        ;;

    "catppuccin-latte")
        sed -i \
            -e 's/#76946A/#40a02b/g' -e 's/#74c7ec/#1e66f5/g' -e 's/#11111b/#eff1f5/g' \
            -e 's/#313244/#e6e9ef/g' -e 's/#45475a/#ccd0da/g' -e 's/#f2cdcd/#ea76cb/g' \
            -e 's/#eba0ac/#d20f39/g' -e 's/#a6e3a1/#40a02b/g' -e 's/#cba6f7/#8839ef/g' \
            -e 's/#f38ba8/#d20f39/g' -e 's/#94e2d5/#179299/g' -e 's/#f9e2af/#df8e1d/g' \
            -e 's/#f5c2e7/#ea76cb/g' -e 's/#89b4fa/#1e66f5/g' -e 's/#fab387/#fe640b/g' \
            -e 's/#C0A36E/#df8e1d/g' -e 's/#cdd6f4/#4c4f69/g' "$LAYOUT_FILE"
        echo "✓ Colores de Catppuccin Latte aplicados"
        ;;

    "flexoki-light")
        sed -i \
            -e 's/#76946A/#4385be/g' -e 's/#74c7ec/#205ea6/g' -e 's/#11111b/#fffcf0/g' \
            -e 's/#313244/#f2f0e5/g' -e 's/#45475a/#e6e4d9/g' -e 's/#f2cdcd/#ce5d97/g' \
            -e 's/#eba0ac/#d14d41/g' -e 's/#a6e3a1/#4385be/g' -e 's/#cba6f7/#8b7ec8/g' \
            -e 's/#f38ba8/#d14d41/g' -e 's/#94e2d5/#3aa99f/g' -e 's/#f9e2af/#ad8301/g' \
            -e 's/#f5c2e7/#ce5d97/g' -e 's/#89b4fa/#205ea6/g' -e 's/#fab387/#da702c/g' \
            -e 's/#C0A36E/#ad8301/g' -e 's/#cdd6f4/#100f0f/g' "$LAYOUT_FILE"
        echo "✓ Colores de Flexoki Light aplicados"
        ;;

    "matte-black")
        sed -i \
            -e 's/#76946A/#50fa7b/g' -e 's/#74c7ec/#8be9fd/g' -e 's/#11111b/#000000/g' \
            -e 's/#313244/#1a1a1a/g' -e 's/#45475a/#2e2e2e/g' -e 's/#f2cdcd/#ff79c6/g' \
            -e 's/#eba0ac/#ff5555/g' -e 's/#a6e3a1/#50fa7b/g' -e 's/#cba6f7/#bd93f9/g' \
            -e 's/#f38ba8/#ff5555/g' -e 's/#94e2d5/#8be9fd/g' -e 's/#f9e2af/#f1fa8c/g' \
            -e 's/#f5c2e7/#ff79c6/g' -e 's/#89b4fa/#6272a4/g' -e 's/#fab387/#ffb86c/g' \
            -e 's/#C0A36E/#f1fa8c/g' -e 's/#cdd6f4/#f8f8f2/g' "$LAYOUT_FILE"
        echo "✓ Colores de Matte Black aplicados"
        ;;

    "osaka-jade")
        sed -i \
            -e 's/#76946A/#9ece6a/g' -e 's/#74c7ec/#7dcfff/g' -e 's/#11111b/#16161d/g' \
            -e 's/#313244/#1a1b26/g' -e 's/#45475a/#2a2b3d/g' -e 's/#f2cdcd/#bb9af7/g' \
            -e 's/#eba0ac/#f7768e/g' -e 's/#a6e3a1/#9ece6a/g' -e 's/#cba6f7/#bb9af7/g' \
            -e 's/#f38ba8/#f7768e/g' -e 's/#94e2d5/#7dcfff/g' -e 's/#f9e2af/#e0af68/g' \
            -e 's/#f5c2e7/#bb9af7/g' -e 's/#89b4fa/#7aa2f7/g' -e 's/#fab387/#ff9e64/g' \
            -e 's/#C0A36E/#e0af68/g' -e 's/#cdd6f4/#a9b1d6/g' "$LAYOUT_FILE"
        echo "✓ Colores de Osaka Jade aplicados"
        ;;

    "ristretto")
        sed -i \
            -e 's/#76946A/#587d71/g' -e 's/#74c7ec/#8ba59b/g' -e 's/#11111b/#2c2421/g' \
            -e 's/#313244/#403a36/g' -e 's/#45475a/#524944/g' -e 's/#f2cdcd/#d3a99f/g' \
            -e 's/#eba0ac/#ab6e5b/g' -e 's/#a6e3a1/#587d71/g' -e 's/#cba6f7/#9e95c7/g' \
            -e 's/#f38ba8/#ab6e5b/g' -e 's/#94e2d5/#8ba59b/g' -e 's/#f9e2af/#d1a375/g' \
            -e 's/#f5c2e7/#d3a99f/g' -e 's/#89b4fa/#6e94b9/g' -e 's/#fab387/#d1a375/g' \
            -e 's/#C0A36E/#d1a375/g' -e 's/#cdd6f4/#dad5d1/g' "$LAYOUT_FILE"
        echo "✓ Colores de Ristretto aplicados"
        ;;

    "arc-blueberry")
        sed -i \
            -e 's/#76946A/#5294e2/g' -e 's/#74c7ec/#5294e2/g' -e 's/#11111b/#2f343f/g' \
            -e 's/#313244/#383c4a/g' -e 's/#45475a/#404552/g' -e 's/#f2cdcd/#ce8cd7/g' \
            -e 's/#eba0ac/#ec5f67/g' -e 's/#a6e3a1/#99c794/g' -e 's/#cba6f7/#ce8cd7/g' \
            -e 's/#f38ba8/#ec5f67/g' -e 's/#94e2d5/#5fb3b3/g' -e 's/#f9e2af/#fac863/g' \
            -e 's/#f5c2e7/#ce8cd7/g' -e 's/#89b4fa/#5294e2/g' -e 's/#fab387/#f99157/g' \
            -e 's/#C0A36E/#fac863/g' -e 's/#cdd6f4/#d3dae3/g' "$LAYOUT_FILE"
        echo "✓ Colores de Arc Blueberry aplicados"
        ;;

    *)
        echo "⚠️  Tema no soportado: $THEME_NAME"
        echo "Manteniendo colores de Catppuccin"
        ;;
esac

echo "✓ Layout work-pro.kdl actualizado con separadores preservados"
