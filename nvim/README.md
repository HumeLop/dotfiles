# Documentación de la Configuración de Neovim

Esta es una documentación autogenerada de la configuración de Neovim, basada en [LazyVim](https://www.lazyvim.org/).

## 📚 Documentación Disponible

- **[GUIA_COMANDOS.md](./GUIA_COMANDOS.md)** - 🆕 Guía completa de comandos y mejoras implementadas
- **[COMANDOS.md](./COMANDOS.md)** - Documentación completa de todos los keymaps y comandos
- **[OIL_COMANDOS.md](./OIL_COMANDOS.md)** - Guía específica del explorador de archivos Oil
- **[MEJORAS_IMPLEMENTADAS.md](./MEJORAS_IMPLEMENTADAS.md)** - Changelog técnico de mejoras

## 🚀 Inicio Rápido

```vim
" Ver formatters disponibles
:FormatInfo

" Formatear manualmente
:Format

" Explorar archivos con Oil
-

" Recargar configuración
<leader>ur

" Cambiar colorscheme
<leader>uc
```

## Resumen General

Tu configuración personaliza LazyVim con un fuerte enfoque en el desarrollo frontend (Angular, React), la integración con herramientas de IA, y una experiencia de usuario (UI) muy personalizada. Incluye múltiples temas de colores, gestores de notas como Obsidian, y varias utilidades para mejorar la productividad.

## 🆕 Últimas Actualizaciones (5 nov 2025)

- ✅ **Sistema de formateo inteligente** - Detección automática de formatters
- ✅ **Oil.nvim completamente restaurado** - Con iconos y comandos personalizados
- ✅ **Optimizaciones de performance** - Manejo automático de archivos grandes
- ✅ **Comandos de debugging** - `:FormatInfo`, `:Format`, `:FormatToggle`
- ✅ **Mejoras en blink.cmp** - Configuración completa con todas las fuentes
- ✅ **Documentación completa** - Guías actualizadas y detalladas

Ver [GUIA_COMANDOS.md](./GUIA_COMANDOS.md) para todos los comandos nuevos.

## Estructura de la Configuración

- `lua/config/`: Contiene la configuración base de Neovim (opciones, atajos de teclado, autocomandos).
- `lua/plugins/`: Contiene la configuración específica para cada plugin, organizados en archivos individuales.

---

## Configuración Principal (`lua/config/`)

### `options.lua`

No contiene configuraciones personalizadas. Se utilizan las opciones por defecto de LazyVim.

### `autocmds.lua`

No contiene autocomandos personalizados. Se utilizan los autocomandos por defecto de LazyVim.

### `lazy.lua`

Este archivo gestiona el plugin manager `lazy.nvim`.

- **Bootstrap**: Instala `lazy.nvim` automáticamente si no se encuentra.
- **Clipboard**: Incluye una configuración específica para que el portapapeles funcione correctamente en WSL (`win32yank`).
- **Especificación de Plugins (Spec)**:
  - Importa la base de plugins de `LazyVim`.
  - Añade una gran cantidad de extras de LazyVim para lenguajes (`typescript`, `angular`, `go`, `nix`, etc.), formato (`biome`, `prettier`), y utilidades (`mini-hipatterns`, `harpoon2`).
  - Importa todos los plugins personalizados definidos en `lua/plugins/`.
- **Rendimiento**: Desactiva plugins nativos de Vim como `gzip`, `tarPlugin`, `tohtml`, etc., para acelerar el arranque.

### `keymaps.lua`

Define una gran cantidad de atajos de teclado personalizados:

- **Generales**:
  - `<C-b>` en modo inserción para borrar hasta el final de la palabra.
  - `<C-c>` como un atajo para `Escape`.
  - `<leader>uk`: Activa `Screenkey`.
  - `<leader>bq`: Cierra todos los buffers excepto el actual.
  - `<C-s>`: Atajo para una función de guardado personalizada (`SaveFile`) que permite guardar archivos sin nombre.
- **Navegación con Tmux**:
  - Atajos con `Ctrl + h/j/k/l` para navegar entre paneles de Neovim y Tmux de forma integrada.
- **Obsidian**:
  - Atajos bajo el prefijo `<leader>o` para gestionar notas: crear, buscar, cambiar, etc.
- **Oil (Explorador de archivos)**:
  - `-`: Abre el explorador de archivos `oil` en el directorio actual.
- **Búsqueda (Grep)**:
  - `<leader>sg`: En modo visual, busca el texto seleccionado en el proyecto.
  - `<leader>sG`: En modo visual, busca el texto seleccionado desde el directorio raíz del proyecto.
- **Marcas**:
  - `<leader>md`: Borra todas las marcas del archivo.
- **Atajos Desactivados**:
  - Se desactivan `<A-j>`, `<A-k>`, `J` y `K` en varios modos para evitar conflictos.

### `nodejs.lua`

Módulo robusto y detallado para asegurar que Neovim utilice una versión de Node.js moderna (>=18) y a nivel de sistema, evitando conflictos con versiones de Node.js específicas de proyectos antiguos.

- Detecta el gestor de versiones (`nvm`, `volta`, `brew`) y proporciona advertencias y comandos de actualización si la versión es demasiado antigua.
- Expone comandos como `NodeInfo` y `NodeDebug` para facilitar la depuración.

### `gentleman/utils.lua`

Módulo de utilidades con funciones para la conversión de colores (HEX, RGB, HSL). Es utilizado por el plugin `mini.hipatterns` para colorear códigos de color `hsl()` en el editor.

---

## Plugins Personalizados (`lua/plugins/`)

Se agrupan por funcionalidad para mayor claridad.

### UI y Apariencia

- **`colorscheme.lua`**:
  - Gestiona múltiples temas: `catppuccin`, `kanagawa`, y dos temas personalizados (`gentleman-kanagawa-blur`, `oldworld.nvim`).
  - El tema por defecto es `gentleman-kanagawa-blur`.
  - Configura `kanagawa` y `catppuccin` para tener un fondo transparente.
- **`ui.lua`**:
  - **lualine.nvim**: Barra de estado personalizada con el tema `gentleman-kanagawa-blur` y componentes especiales para mostrar información de `oil` y `codecompanion`.
  - **incline.nvim**: Muestra el nombre del archivo actual en una ventana flotante en la parte superior.
  - **which-key.nvim**: Muestra los atajos de teclado disponibles al presionar `<leader>`.
  - **zen-mode.nvim**: Modo de escritura sin distracciones (`<leader>z`).
  - **snacks.nvim**: Dashboard de inicio personalizado con un header ASCII art y atajos útiles. También se usa como "picker" (selector) para `obsidian.nvim`.
- **`smear.lua`**: Activa `smear-cursor.nvim`, que deja un rastro o "estela" al mover el cursor.
- **`twilight.lua`**: Activa `twilight.nvim`, que atenúa el código inactivo para centrar el foco en la parte que estás editando.
- **`screenkey.lua`**: Activa `screenkey.nvim` para mostrar las teclas que se presionan en pantalla, útil para demos o streaming.

### Asistentes de IA y Programación

Tienes una colección muy extensa de plugins de IA, aunque varios están desactivados.

- **`avante.nvim` (Activado)**: Un potente asistente de IA.
  - **Proveedor**: `copilot`, utilizando el modelo `claude-sonnet-4`.
  - **Prompt de Sistema**: Un prompt muy detallado que instruye a la IA para que actúe como un clon tuyo (arquitecto frontend, experto en Angular/React, con estilo argentino).
  - **UI**: Configurado para aparecer a la izquierda, con un ancho de 30.
  - **Fixes**: Incluye autocomandos complejos para solucionar problemas de renderizado al redimensionar la ventana.
- **`claude-code.nvim` (Activado)**: Integración con Claude Code.
  - **UI**: Usa `snacks.nvim` para la terminal y se abre a la izquierda.
  - **Atajos**: Mapeos bajo `<leader>a` para interactuar con Claude (enviar código, aceptar/denegar diffs, etc.).
- **`gemini-cli.nvim` (Activado)**: Integración con Gemini.
- **`copilot.lua` (Activado)**: Configuración base para las autocompletaciones de GitHub Copilot, desactivado en ciertos tipos de archivo como `yaml` y `markdown`.
- **Plugins de IA Desactivados** (configurados pero deshabilitados en `disabled.lua`):
  - `code-companion.nvim`
  - `copilot-chat.nvim`
  - `opencode.nvim`
  - `precognition.nvim`

### Edición y Flujo de Trabajo

- **`obsidian.nvim`**: Integración profunda con Obsidian para la toma de notas.
  - **Vault**: Configurado para usar el vault en `~/.config/obsidian`.
  - **Picker**: Usa `snacks.pick` para la selección de notas.
  - **Callbacks**: Añade atajos de teclado específicos (`gf`, `<cr>`) cuando se está en un buffer de Obsidian.
- **`oil.nvim`**: Un explorador de archivos que se edita como un buffer normal.
  - **Default**: Configurado como el explorador de archivos por defecto.
  - **Atajos**: Mapeos personalizados para navegación (`<C-s>`, `<C-v>`) y acciones comunes.
- **`nvim-dap.lua`**: Configuración para el Debug Adapter Protocol (DAP).
  - **UI**: Incluye `nvim-dap-ui` para una interfaz gráfica del depurador.
  - **Go**: Contiene una función para cargar automáticamente variables de entorno desde archivos `.env` al depurar proyectos de Go.
- **`multi-line.lua`**: Activa `vim-multiple-cursors` para tener múltiples cursores y editar en varios lugares a la vez.
- **`rip.lua`**: Integra `ripgrep` para realizar búsquedas y reemplazos en todo el proyecto (`<leader>fs`).
- **`editor.lua`**:
  - **goto-preview**: Permite previsualizar definiciones y referencias en una ventana flotante (`gpd`, `gpr`, etc.).
  - **mini.hipatterns**: Resalta patrones de texto, configurado para colorear códigos de color `hsl(...)`.
- **`markdown.lua`**: Usa `render-markdown.nvim` para mejorar la visualización de archivos Markdown, renderizando headers y bullets con iconos.

### Utilidades

- **`vim-tmux-navigation.lua`**: Permite la navegación fluida entre paneles de Neovim y Tmux.
- **`vim-be-good.lua`**: Un plugin para practicar y mejorar tus habilidades en Vim.
- **`fzflua.lua`**: Integración con `fzf-lua` para búsquedas difusas (fuzzy finding).
- **`blink.lua`**: Plugin de completado, configurado para integrarse con `avante.nvim`.

---

## Overrides y Plugins Desactivados

### `overrides.lua`

Este archivo modifica la configuración por defecto de algunos plugins de LazyVim:

- **trouble.nvim**: Se activan los signos de diagnóstico.
- **nvim-lspconfig**:
  - Se desactivan los "inlay hints" globalmente.
  - Se añade el LSP para `nil` (lenguaje Nix).
- **symbols-outline.nvim**: Se añade este plugin para tener una vista de árbol de los símbolos del código (`<leader>cs`).

### `disabled.lua`

Este archivo desactiva explícitamente varios plugins:

- `akinsho/bufferline.nvim`: La barra de buffers/pestañas está desactivada.
- Varios de los plugins de IA mencionados anteriormente, lo que indica un proceso de prueba y selección entre diferentes asistentes.

---

# 📚 Guía de Comandos y Keybindings

Esta sección contiene todos los comandos y atajos de teclado configurados en tu setup de Neovim.

## 🎯 Índice de Comandos

1. [Comandos Generales](#comandos-generales)
2. [Navegación Tmux](#navegación-tmux)
3. [Obsidian](#obsidian)
4. [Oil (Explorador de Archivos)](#oil-explorador-de-archivos)
5. [Gestión de Buffers](#gestión-de-buffers)
6. [Búsqueda (Grep)](#búsqueda-grep)
7. [Marcas](#marcas)
8. [AI Assistant - Avante](#ai-assistant---avante)
9. [AI Assistant - Claude Code](#ai-assistant---claude-code)
10. [Preview (Goto Preview)](#preview-goto-preview)
11. [Git](#git)
12. [Misceláneos](#misceláneos-1)

---

## 🔧 Comandos Generales

### Modo Insert

| Tecla    | Descripción                                                    |
| -------- | -------------------------------------------------------------- |
| `Ctrl+b` | Elimina hasta el final de la palabra sin salir del modo insert |
| `Ctrl+c` | Salir al modo normal (equivalente a ESC)                       |
| `Ctrl+s` | Guardar archivo con notificación personalizada                 |

### Modo Normal

| Tecla        | Descripción                                    |
| ------------ | ---------------------------------------------- |
| `Ctrl+c`     | Salir al modo normal desde cualquier modo      |
| `Ctrl+s`     | Guardar archivo con notificación personalizada |
| `<leader>uk` | Toggle Screenkey (mostrar teclas en pantalla)  |

### Modo Visual

| Tecla    | Descripción          |
| -------- | -------------------- |
| `Ctrl+c` | Salir al modo normal |

### Comandos Deshabilitados

Los siguientes atajos han sido deshabilitados:

- `Alt+j` y `Alt+k` en todos los modos (insert, normal, visual)
- `J` y `K` en modo visual

---

## 🚀 Navegación Tmux

Navegación integrada entre paneles de Neovim y Tmux:

| Tecla        | Descripción                    |
| ------------ | ------------------------------ |
| `Ctrl+h`     | Navegar al panel izquierdo     |
| `Ctrl+j`     | Navegar al panel inferior      |
| `Ctrl+k`     | Navegar al panel superior      |
| `Ctrl+l`     | Navegar al panel derecho       |
| `Ctrl+\`     | Navegar al último panel activo |
| `Ctrl+Space` | Navegar al siguiente panel     |

---

## 📝 Obsidian

Comandos para gestionar notas de Obsidian:

| Tecla        | Comando                | Descripción                           |
| ------------ | ---------------------- | ------------------------------------- |
| `<leader>oc` | `:ObsidianCheck`       | Marcar/desmarcar checkbox             |
| `<leader>ot` | `:ObsidianTemplate`    | Insertar template de Obsidian         |
| `<leader>oo` | `:ObsidianOpen`        | Abrir nota en la app de Obsidian      |
| `<leader>ob` | `:ObsidianBacklinks`   | Mostrar backlinks (enlaces entrantes) |
| `<leader>ol` | `:ObsidianLinks`       | Mostrar links (enlaces salientes)     |
| `<leader>on` | `:ObsidianNew`         | Crear nueva nota                      |
| `<leader>os` | `:ObsidianSearch`      | Buscar en notas de Obsidian           |
| `<leader>oq` | `:ObsidianQuickSwitch` | Cambio rápido entre notas             |

---

## 📂 Oil (Explorador de Archivos)

| Tecla | Descripción                   |
| ----- | ----------------------------- |
| `-`   | Abrir directorio padre en Oil |

Oil es un explorador de archivos que permite editar el sistema de archivos como si fuera un buffer de texto.

---

## 📑 Gestión de Buffers

| Tecla        | Descripción                                  |
| ------------ | -------------------------------------------- |
| `<leader>bq` | Eliminar todos los buffers excepto el actual |

---

## 🔍 Búsqueda (Grep)

### Modo Visual

| Tecla        | Descripción                                                            |
| ------------ | ---------------------------------------------------------------------- |
| `<leader>sg` | Buscar el texto seleccionado en el directorio actual                   |
| `<leader>sG` | Buscar el texto seleccionado en el directorio raíz del repositorio Git |

Estas búsquedas funcionan con el texto que tengas seleccionado en modo visual. Se integran automáticamente con Snacks picker o fzf-lua.

---

## 🎯 Marcas

| Tecla        | Descripción                       |
| ------------ | --------------------------------- |
| `<leader>md` | Eliminar todas las marcas (marks) |

---

## 🤖 AI Assistant - Avante

Avante es tu asistente de IA principal y **motor de autocompletado**, integrado con GitHub Copilot usando el modelo Claude Sonnet 4.

### Características Principales

- **Proveedor**: Copilot con modelo `claude-sonnet-4`
- **Autocompletado**: Copilot (`auto_suggestions_provider`)
- **Cursor Provider**: Copilot (`cursor_applying_provider`)
- **Posición**: Panel lateral izquierdo
- **Ancho**: 30% de la pantalla
- **File Selector**: Usa Snacks para selección de archivos
- **Cursor Planning Mode**: Habilitado

### Configuración UI

- Panel lateral con wrap activado
- Header centrado y redondeado
- Integración completa con el flujo de trabajo
- Input window con altura de 8 líneas
- Auto-insert mode habilitado

### Funcionalidades Principales

1. **Autocompletado Inteligente**: Sugerencias de código en tiempo real usando Copilot
2. **Chat con IA**: Interactúa con Claude Sonnet 4 directamente desde Neovim
3. **Cursor Planning Mode**: Modo de planificación avanzada con el cursor
4. **Aplicación de Cambios**: Aplica cambios directamente con Copilot
5. **Selección de archivos**: Selector integrado con Snacks
6. **Soporte de Imágenes**: Integrado con img-clip para pegar imágenes (base64)

### Personalidad "The Gentleman"

Avante está configurado con un system prompt personalizado que lo hace actuar como:

- Arquitecto líder frontend especializado en Angular y React
- Experto en Clean Architecture, Hexagonal Architecture y Scream Architecture
- Estilo de comunicación argentino, directo y técnico pero accesible
- Enfocado en modularización, atomic design y patrón contenedor-presentacional

> **Nota Técnica**: Avante tiene correcciones especiales para el redimensionado de ventanas que previenen duplicados y problemas de renderizado.

---

## �️ AI Assistant - Claude Code

Claude Code es tu segundo asistente de IA con capacidades avanzadas de edición.

### Comandos Principales

| Tecla        | Comando                  | Descripción                        |
| ------------ | ------------------------ | ---------------------------------- |
| `<leader>ac` | `:ClaudeCode`            | Toggle Claude Code                 |
| `<leader>af` | `:ClaudeCodeFocus`       | Enfocar panel de Claude            |
| `<leader>ar` | `:ClaudeCode --resume`   | Reanudar conversación              |
| `<leader>aC` | `:ClaudeCode --continue` | Continuar con Claude               |
| `<leader>am` | `:ClaudeCodeSelectModel` | Seleccionar modelo de Claude       |
| `<leader>ab` | `:ClaudeCodeAdd %`       | Añadir buffer actual a la sesión   |
| `<leader>as` | `:ClaudeCodeSend`        | Enviar selección a Claude (Visual) |
| `<leader>as` | `:ClaudeCodeTreeAdd`     | Añadir archivo desde explorador    |
| `<leader>at` | `:ClaudeCodeContinue`    | Continuar conversación reciente    |
| `<leader>av` | `:ClaudeCodeVerbose`     | Activar logging detallado          |

### Gestión de Diffs

| Tecla        | Comando                 | Descripción   |
| ------------ | ----------------------- | ------------- |
| `<leader>aa` | `:ClaudeCodeDiffAccept` | Aceptar diff  |
| `<leader>ad` | `:ClaudeCodeDiffDeny`   | Rechazar diff |

### Configuración del Terminal

- **Posición**: Panel lateral izquierdo
- **Ancho**: 30% de la pantalla
- **Provider**: Snacks (terminal integrado)

### Contexto de Archivos

Claude Code puede trabajar con archivos desde diferentes exploradores:

- NvimTree
- Neo-tree
- Oil
- Minifiles

Usa `<leader>as` dentro de cualquiera de estos exploradores para añadir archivos al contexto de Claude.

---

## 👁️ Preview (Goto Preview)

Preview permite ver definiciones, declaraciones, implementaciones, etc., en una ventana flotante sin abandonar el archivo actual.

| Tecla | Descripción                          |
| ----- | ------------------------------------ |
| `gpd` | Preview de definición                |
| `gpD` | Preview de declaración               |
| `gpi` | Preview de implementación            |
| `gpy` | Preview de tipo de definición        |
| `gpr` | Preview de referencias               |
| `gP`  | Cerrar todas las ventanas de preview |

---

## 🔀 Git

Integración con Git para blame y navegación al repositorio:

| Tecla        | Descripción                                             |
| ------------ | ------------------------------------------------------- |
| `<leader>gb` | Abrir ventana de Git blame                              |
| `<leader>go` | Abrir archivo/carpeta en el repositorio Git (navegador) |

---

## 🎨 Misceláneos

### Which-Key

Which-Key muestra un popup con los posibles keybindings cuando empiezas a escribir un comando.

| Tecla       | Descripción                             |
| ----------- | --------------------------------------- |
| `<leader>?` | Mostrar keybindings locales disponibles |

### Configuración de Timeouts

- **Timeout general**: 1000ms (1 segundo)
- **Timeout para which-key**: 300ms
- **TTY timeout**: 0ms

### Mini Hipatterns

Highlighter automático de colores:

- Detecta y colorea patrones HSL: `hsl(120, 50, 50)`

---

## 🔑 Notas sobre `<leader>`

El `<leader>` en LazyVim por defecto es la **tecla Espacio** (Space).

Entonces cuando veas `<leader>ac`, significa: **Espacio + a + c**

---

## 📦 Plugins Configurados

Tu configuración incluye los siguientes plugins principales:

### 🎨 Framework y UI

- **LazyVim** - Framework base de Neovim
- **which-key.nvim** - Ayuda visual con keybindings
- **lualine** - Barra de estado personalizada
- **incline** - Nombre de archivo flotante
- **zen-mode** - Modo de escritura sin distracciones
- **twilight** - Atenuar código inactivo
- **smear-cursor** - Efecto de estela en el cursor
- **screenkey** - Mostrar teclas en pantalla

### 🤖 Asistentes de IA

- **Avante** - Asistente IA principal y motor de autocompletado
  - Usa GitHub Copilot como proveedor
  - Modelo: Claude Sonnet 4
  - Maneja: autocompletado, sugerencias, cursor planning
- **Claude Code** - Asistente IA con capacidades de edición avanzada
- **Gemini CLI** - Integración con Gemini
- **Blink.cmp** - Motor de completado integrado con Avante

### 🛠️ Desarrollo y Edición

- **obsidian.nvim** - Integración con Obsidian para notas
- **oil.nvim** - Explorador de archivos editable
- **goto-preview** - Preview de código en ventana flotante
- **nvim-dap** - Debug Adapter Protocol
- **mini.hipatterns** - Highlighting de patrones (colores HSL)
- **render-markdown** - Renderizado mejorado de Markdown

### 🔍 Búsqueda y Navegación

- **fzf-lua** - Fuzzy finder
- **harpoon2** - Navegación rápida entre archivos
- **nvim-tmux-navigation** - Navegación integrada Neovim/Tmux

### 🔀 Git

- **git.nvim** - Integración Git (blame, browse)
- **mini-diff** - Visualización de diffs

### 📝 Lenguajes Soportados

- TypeScript/JavaScript
- Angular
- Astro
- Go
- Nix
- JSON/TOML
- Markdown

---

## 💡 Tips Útiles

1. **Guardar archivos**: Usa `Ctrl+s` en cualquier modo para guardar con una notificación amigable
2. **Buscar texto seleccionado**: Selecciona texto en modo visual y usa `<leader>sg` para buscarlo
3. **Navegación con Tmux**: Los atajos `Ctrl+h/j/k/l` funcionan tanto en Neovim como en Tmux
4. **Autocompletado IA**: Avante maneja todo el autocompletado usando Copilot (Claude Sonnet 4)
   - Las sugerencias aparecen automáticamente mientras escribes
   - Cursor planning mode para cambios inteligentes
5. **Asistentes IA Especializados**:
   - **Avante** - Para autocompletado, chat y sugerencias generales
   - **Claude Code** (`<leader>a`) - Para edición avanzada con gestión de diffs
6. **Obsidian**: Si trabajas con notas, todos los comandos están bajo `<leader>o`
7. **Preview**: Usa los comandos `gp*` para ver definiciones sin perder tu posición actual
8. **Explorador de archivos**: Usa `-` para abrir Oil y editar el sistema de archivos como un buffer
9. **Modo Zen**: `<leader>z` para activar el modo de escritura sin distracciones
10. **Git Blame**: `<leader>gb` para ver quién modificó cada línea de código

---

## Créditos

- Basado en [LazyVim](https://www.lazyvim.org/)
- Gentleman Dots [Gentleman Dots GitHub](https://github.com/Gentleman-Programming/Gentleman.Dots)

**Última actualización**: 10 de noviembre de 2025
