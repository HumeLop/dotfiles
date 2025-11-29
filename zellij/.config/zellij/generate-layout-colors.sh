#!/usr/bin/env zsh

# Script para generar layouts de Zellij con colores dinámicos según el tema de Omarchy
# Los colores se extraen automáticamente del tema actual

# Obtener el tema actual de Omarchy
OMARCHY_THEME_PATH="$HOME/.config/omarchy/current/theme"

if [[ ! -L "$OMARCHY_THEME_PATH" ]]; then
    echo "❌ No se encontró el tema de Omarchy"
    exit 1
fi

THEME_NAME=$(basename "$(readlink "$OMARCHY_THEME_PATH")")

# Definir colores por tema
declare -A COLORS

# Catppuccin Mocha (oscuro)
COLORS[catppuccin_base]="#1e1e2e"
COLORS[catppuccin_mantle]="#181825"
COLORS[catppuccin_crust]="#11111b"
COLORS[catppuccin_surface0]="#313244"
COLORS[catppuccin_surface1]="#45475a"
COLORS[catppuccin_surface2]="#585b70"
COLORS[catppuccin_text]="#cdd6f4"
COLORS[catppuccin_blue]="#89b4fa"
COLORS[catppuccin_sapphire]="#74c7ec"
COLORS[catppuccin_sky]="#89dceb"
COLORS[catppuccin_teal]="#94e2d5"
COLORS[catppuccin_green]="#a6e3a1"
COLORS[catppuccin_yellow]="#f9e2af"
COLORS[catppuccin_peach]="#fab387"
COLORS[catppuccin_maroon]="#eba0ac"
COLORS[catppuccin_red]="#f38ba8"
COLORS[catppuccin_mauve]="#cba6f7"
COLORS[catppuccin_pink]="#f5c2e7"
COLORS[catppuccin_flamingo]="#f2cdcd"

# Everforest (oscuro)
COLORS[everforest_base]="#2d353b"
COLORS[everforest_mantle]="#272e33"
COLORS[everforest_crust]="#1e2326"
COLORS[everforest_surface0]="#3d484d"
COLORS[everforest_surface1]="#475258"
COLORS[everforest_surface2]="#5a6873"
COLORS[everforest_text]="#d3c6aa"
COLORS[everforest_blue]="#7fbbb3"
COLORS[everforest_sapphire]="#7fbbb3"
COLORS[everforest_sky]="#83c092"
COLORS[everforest_teal]="#83c092"
COLORS[everforest_green]="#a7c080"
COLORS[everforest_yellow]="#dbbc7f"
COLORS[everforest_peach]="#e69875"
COLORS[everforest_maroon]="#e67e80"
COLORS[everforest_red]="#e67e80"
COLORS[everforest_mauve]="#d699b6"
COLORS[everforest_pink]="#d699b6"
COLORS[everforest_flamingo]="#d699b6"

# Kanagawa (oscuro)
COLORS[kanagawa_base]="#1f1f28"
COLORS[kanagawa_mantle]="#16161d"
COLORS[kanagawa_crust]="#0d0d0f"
COLORS[kanagawa_surface0]="#2a2a37"
COLORS[kanagawa_surface1]="#363646"
COLORS[kanagawa_surface2]="#43436c"
COLORS[kanagawa_text]="#dcd7ba"
COLORS[kanagawa_blue]="#7e9cd8"
COLORS[kanagawa_sapphire]="#7fb4ca"
COLORS[kanagawa_sky]="#7fb4ca"
COLORS[kanagawa_teal]="#6a9589"
COLORS[kanagawa_green]="#76946a"
COLORS[kanagawa_yellow]="#c0a36e"
COLORS[kanagawa_peach]="#ffa066"
COLORS[kanagawa_maroon]="#e46876"
COLORS[kanagawa_red]="#c34043"
COLORS[kanagawa_mauve]="#957fb8"
COLORS[kanagawa_pink]="#d27e99"
COLORS[kanagawa_flamingo]="#d27e99"

# Gruvbox (oscuro)
COLORS[gruvbox_base]="#282828"
COLORS[gruvbox_mantle]="#1d2021"
COLORS[gruvbox_crust]="#1d2021"
COLORS[gruvbox_surface0]="#3c3836"
COLORS[gruvbox_surface1]="#504945"
COLORS[gruvbox_surface2]="#665c54"
COLORS[gruvbox_text]="#ebdbb2"
COLORS[gruvbox_blue]="#458588"
COLORS[gruvbox_sapphire]="#83a598"
COLORS[gruvbox_sky]="#83a598"
COLORS[gruvbox_teal]="#689d6a"
COLORS[gruvbox_green]="#98971a"
COLORS[gruvbox_yellow]="#d79921"
COLORS[gruvbox_peach]="#d65d0e"
COLORS[gruvbox_maroon]="#cc241d"
COLORS[gruvbox_red]="#cc241d"
COLORS[gruvbox_mauve]="#b16286"
COLORS[gruvbox_pink]="#d3869b"
COLORS[gruvbox_flamingo]="#d3869b"

# Seleccionar colores según el tema
case "$THEME_NAME" in
    "catppuccin")
        THEME_PREFIX="catppuccin"
        ;;
    "everforest")
        THEME_PREFIX="everforest"
        ;;
    "kanagawa")
        THEME_PREFIX="kanagawa"
        ;;
    "gruvbox")
        THEME_PREFIX="gruvbox"
        ;;
    *)
        # Fallback a Catppuccin
        THEME_PREFIX="catppuccin"
        echo "⚠️  Tema '$THEME_NAME' no configurado, usando Catppuccin por defecto"
        ;;
esac

# Obtener colores del tema seleccionado
BG="${COLORS[${THEME_PREFIX}_base]}"
MANTLE="${COLORS[${THEME_PREFIX}_mantle]}"
CRUST="${COLORS[${THEME_PREFIX}_crust]}"
SURFACE0="${COLORS[${THEME_PREFIX}_surface0]}"
SURFACE1="${COLORS[${THEME_PREFIX}_surface1]}"
SURFACE2="${COLORS[${THEME_PREFIX}_surface2]}"
TEXT="${COLORS[${THEME_PREFIX}_text]}"
BLUE="${COLORS[${THEME_PREFIX}_blue]}"
SAPPHIRE="${COLORS[${THEME_PREFIX}_sapphire]}"
SKY="${COLORS[${THEME_PREFIX}_sky]}"
TEAL="${COLORS[${THEME_PREFIX}_teal]}"
GREEN="${COLORS[${THEME_PREFIX}_green]}"
YELLOW="${COLORS[${THEME_PREFIX}_yellow]}"
PEACH="${COLORS[${THEME_PREFIX}_peach]}"
MAROON="${COLORS[${THEME_PREFIX}_maroon]}"
RED="${COLORS[${THEME_PREFIX}_red]}"
MAUVE="${COLORS[${THEME_PREFIX}_mauve]}"
PINK="${COLORS[${THEME_PREFIX}_pink]}"
FLAMINGO="${COLORS[${THEME_PREFIX}_flamingo]}"

echo "✨ Generando layout con tema: $THEME_NAME"
echo "🎨 Colores: $THEME_PREFIX"

# Generar layout work-pro con colores dinámicos
cat > "$HOME/.config/zellij/layouts/work-pro.kdl" << EOF
// Layout profesional - Colores dinámicos del tema: $THEME_NAME
// Generado automáticamente por sync-theme.sh

layout {
    default_tab_template {
        pane size=1 borderless=true {
            plugin location="file:$HOME/.config/zellij/plugins/zjstatus.wasm" {
               format_left  "#[fg=$GREEN,bold,fg=$SAPPHIRE]#[bg=$SAPPHIRE,fg=$CRUST,bold] {session} #[bg=$SURFACE0,fg=$SAPPHIRE] {mode}#[bg=$SURFACE0] {tabs}"
                format_right  "#[bg=$SURFACE0,fg=$FLAMINGO]#[fg=$CRUST,bg=$FLAMINGO] #[bg=$SURFACE1,fg=$FLAMINGO,bold] {command_user}@{command_host}#[bg=$SURFACE0,fg=$SURFACE1]#[bg=$SURFACE0,fg=$MAROON]#[bg=$MAROON,fg=$CRUST]󰃭 #[bg=$SURFACE1,fg=$MAROON,bold] {datetime}#[bg=$SURFACE0,fg=$SURFACE1]"
                format_center ""
                format_space  "#[bg=$SURFACE0]"
                format_hide_on_overlength "true"
                format_precedence "lrc"

                border_enabled  "false"
                border_char     "─"
                border_format   "#[fg=$SURFACE2]{char}"
                border_position "top"

                hide_frame_for_single_pane "true"

                mode_normal        "#[bg=$GREEN,fg=$CRUST,bold] NORMAL#[bg=$SURFACE0,fg=$GREEN]"
                mode_tmux          "#[bg=$MAUVE,fg=$CRUST,bold] TMUX#[bg=$SURFACE0,fg=$MAUVE]"
                mode_locked        "#[bg=$RED,fg=$CRUST,bold] LOCKED#[bg=$SURFACE0,fg=$RED]"
                mode_pane          "#[bg=$TEAL,fg=$CRUST,bold] PANE#[bg=$SURFACE0,fg=$TEAL]"
                mode_tab           "#[bg=$TEAL,fg=$CRUST,bold] TAB#[bg=$SURFACE0,fg=$TEAL]"
                mode_scroll        "#[bg=$FLAMINGO,fg=$CRUST,bold] SCROLL#[bg=$SURFACE0,fg=$FLAMINGO]"
                mode_enter_search  "#[bg=$FLAMINGO,fg=$CRUST,bold] ENT-SEARCH#[bg=$SURFACE0,fg=$FLAMINGO]"
                mode_search        "#[bg=$FLAMINGO,fg=$CRUST,bold] SEARCH#[bg=$SURFACE0,fg=$FLAMINGO]"
                mode_resize        "#[bg=$YELLOW,fg=$CRUST,bold] RESIZE#[bg=$SURFACE0,fg=$YELLOW]"
                mode_rename_tab    "#[bg=$YELLOW,fg=$CRUST,bold] RENAME-TAB#[bg=$SURFACE0,fg=$YELLOW]"
                mode_rename_pane   "#[bg=$YELLOW,fg=$CRUST,bold] RENAME-PANE#[bg=$SURFACE0,fg=$YELLOW]"
                mode_move          "#[bg=$YELLOW,fg=$CRUST,bold] MOVE#[bg=$SURFACE0,fg=$YELLOW]"
                mode_session       "#[bg=$PINK,fg=$CRUST,bold] SESSION#[bg=$SURFACE0,fg=$PINK]"
                mode_prompt        "#[bg=$PINK,fg=$CRUST,bold] PROMPT#[bg=$SURFACE0,fg=$PINK]"

                tab_normal              "#[bg=$SURFACE0,fg=$BLUE]#[bg=$BLUE,fg=$CRUST,bold]{index} #[bg=$SURFACE1,fg=$BLUE,bold] {name}{floating_indicator}#[bg=$SURFACE0,fg=$SURFACE1]"
                tab_normal_fullscreen   "#[bg=$SURFACE0,fg=$BLUE]#[bg=$BLUE,fg=$CRUST,bold]{index} #[bg=$SURFACE1,fg=$BLUE,bold] {name}{fullscreen_indicator}#[bg=$SURFACE0,fg=$SURFACE1]"
                tab_normal_sync         "#[bg=$SURFACE0,fg=$BLUE]#[bg=$BLUE,fg=$CRUST,bold]{index} #[bg=$SURFACE1,fg=$BLUE,bold] {name}{sync_indicator}#[bg=$SURFACE0,fg=$SURFACE1]"
                tab_active              "#[bg=$SURFACE0,fg=$PEACH]#[bg=$PEACH,fg=$CRUST,bold]{index} #[bg=$SURFACE1,fg=$PEACH,bold] {name}{floating_indicator}#[bg=$SURFACE0,fg=$SURFACE1]"
                tab_active_fullscreen   "#[bg=$SURFACE0,fg=$PEACH]#[bg=$PEACH,fg=$CRUST,bold]{index} #[bg=$SURFACE1,fg=$PEACH,bold] {name}{fullscreen_indicator}#[bg=$SURFACE0,fg=$SURFACE1]"
                tab_active_sync         "#[bg=$SURFACE0,fg=$PEACH]#[bg=$PEACH,fg=$CRUST,bold]{index} #[bg=$SURFACE1,fg=$PEACH,bold] {name}{sync_indicator}#[bg=$SURFACE0,fg=$SURFACE1]"
                tab_separator           "#[bg=$SURFACE0] "

                tab_sync_indicator       " "
                tab_fullscreen_indicator " 󰊓"
                tab_floating_indicator   " 󰹙"

                notification_format_unread "#[bg=$SURFACE0,fg=$YELLOW]#[bg=$YELLOW,fg=$CRUST] #[bg=$SURFACE1,fg=$YELLOW] {message}#[bg=$SURFACE0,fg=$YELLOW]"
                notification_format_no_notifications ""
                notification_show_interval "10"

                command_host_command    "uname -n"
                command_host_format     "{stdout}"
                command_host_interval   "0"
                command_host_rendermode "static"

                command_user_command    "whoami"
                command_user_format     "{stdout}"
                command_user_interval   "10"
                command_user_rendermode "static"

                command_git_branch_command     "git rev-parse --abbrev-ref HEAD"
                command_git_branch_format      "#[fg=$GREEN] {stdout} "
                command_git_branch_interval    "10"
                command_git_branch_rendermode  "static"

                datetime        "#[fg=$TEXT,bold] {format} "
                datetime_format "%Y-%m-%d 󰅐 %I:%M %p"
                datetime_timezone "America/Mexico_City"
            }
        }
        children
        pane size=1 borderless=true {
            plugin location="zellij:status-bar"
        }
    }

    tab name="Editor" focus=true {
        pane split_direction="vertical" {
            pane command="nvim" size="70%"
            pane size="30%" split_direction="horizontal" {
                pane
                pane
            }
        }
    }

    tab name="Terminal" {
        pane
    }

    tab name="Git" {
        pane split_direction="vertical" {
            pane command="lazygit" size="70%"
            pane split_direction="horizontal" size="30%" {
                pane
                pane
            }
        }
    }

    tab name="Monitor" {
        pane split_direction="vertical" {
            pane command="btop" size="60%"
            pane size="40%"
        }
    }
}
EOF

echo "✓ Layout work-pro.kdl generado con colores del tema $THEME_NAME"
