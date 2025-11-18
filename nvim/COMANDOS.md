# 📚 Documentación de Comandos - Neovim Config

Esta es la documentación completa de todos los comandos y keybindings configurados en tu setup de Neovim.

---

## 🎯 Índice

1. [Comandos Generales](#-comandos-generales)
2. [Formateo](#-formateo)
3. [Navegación Tmux](#-navegación-tmux)
4. [Obsidian](#-obsidian)
5. [Oil (Explorador de Archivos)](#-oil-explorador-de-archivos)
6. [Gestión de Buffers](#-gestión-de-buffers)
7. [Búsqueda (Grep)](#-búsqueda-grep)
8. [Marcas](#-marcas)
9. [AI Assistant - CodeCompanion](#-ai-assistant---codecompanion)
10. [AI Assistant - CopilotChat](#-ai-assistant---copilotchat)
11. [Preview (Goto Preview)](#-preview-goto-preview)
12. [Git](#-git)
13. [Misceláneos](#-misceláneos)

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

## 🎨 Formateo

Sistema inteligente de formateo con detección automática de formatters.

### Comandos

| Comando         | Keymap       | Descripción                                   |
| --------------- | ------------ | --------------------------------------------- |
| `:Format`       | `<leader>cF` | Formatear buffer actual manualmente con info  |
| `:FormatInfo`   | `<leader>cf` | Mostrar formatters disponibles para el buffer |
| `:FormatToggle` | `<leader>uF` | Activar/desactivar autoformat al guardar      |

### Cómo Funciona

1. Primero intenta usar **conform.nvim** (prettier, stylua, etc.)
2. Si no hay formatters, usa **LSP**
3. Si no hay ninguno, guarda sin error

### Formatters Disponibles

Instalados vía Mason:

- `prettier` - HTML, JS, TS, CSS, JSON
- `stylua` - Lua
- `shfmt` - Shell scripts
- `biome` - JS/TS alternativo

Para instalar más: `:Mason`

### Tips

**Ver qué se usará:**

```vim
:FormatInfo
" o
<leader>cf
```

**Formatear manualmente:**

```vim
:Format
" o
<leader>cF
```

**Desactivar autoformat:**

```vim
:FormatToggle
" o
<leader>uF
```

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

### Keymaps Globales

| Tecla        | Descripción                                  |
| ------------ | -------------------------------------------- |
| `-`          | Abrir directorio padre en Oil                |
| `<leader>-`  | Abrir Oil en el directorio de trabajo actual |
| `<leader>fo` | Abrir Oil file explorer                      |

### Comandos de Usuario

| Comando            | Descripción                           |
| ------------------ | ------------------------------------- |
| `:OilToggleHidden` | Mostrar/ocultar archivos ocultos      |
| `:OilFloat`        | Abrir Oil en ventana flotante         |
| `:OilCurrentDir`   | Abrir Oil en el directorio de trabajo |

### Comandos Dentro de Oil

| Tecla   | Descripción               |
| ------- | ------------------------- |
| `<CR>`  | Abrir archivo/directorio  |
| `-`     | Ir al directorio padre    |
| `_`     | Ir al cwd                 |
| `<C-s>` | Abrir en split vertical   |
| `<C-h>` | Abrir en split horizontal |
| `<C-t>` | Abrir en nueva pestaña    |
| `<C-p>` | Vista previa              |
| `<C-c>` | Cerrar Oil                |
| `<C-l>` | Refrescar vista           |
| `g?`    | Mostrar ayuda             |
| `g.`    | Toggle archivos ocultos   |
| `gs`    | Cambiar orden             |
| `gx`    | Abrir con app externa     |

Oil es un explorador de archivos que permite editar el sistema de archivos como si fuera un buffer de texto. Ver [OIL_COMANDOS.md](./OIL_COMANDOS.md) para más detalles.

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

## 🤖 AI Assistant - CodeCompanion

CodeCompanion es tu asistente de IA integrado con Copilot/Gemini/GPT.

### Comandos Principales

| Tecla        | Modo          | Descripción                      |
| ------------ | ------------- | -------------------------------- |
| `<leader>ac` | Normal/Visual | Toggle del chat de CodeCompanion |
| `<leader>an` | Normal/Visual | Abrir nuevo chat                 |
| `<leader>aa` | Normal/Visual | Abrir menú de acciones de IA     |
| `ga`         | Visual        | Añadir selección al chat         |
| `<leader>ae` | Visual        | Explicar código seleccionado     |

### Abreviación de Comando

| Comando | Equivale a       |
| ------- | ---------------- |
| `:cc`   | `:CodeCompanion` |

### Mapeos en el Chat

Cuando estés dentro de una ventana de chat de CodeCompanion:

| Tecla    | Modo          | Acción         |
| -------- | ------------- | -------------- |
| `Enter`  | Normal        | Enviar mensaje |
| `Ctrl+s` | Insert        | Enviar mensaje |
| `Ctrl+c` | Insert/Normal | Cerrar chat    |

### Inline (Edición en línea)

| Tecla | Descripción                 |
| ----- | --------------------------- |
| `ga`  | Aceptar el cambio sugerido  |
| `gr`  | Rechazar el cambio sugerido |

### Slash Commands Personalizados

Dentro del chat puedes usar:

- `/git_files` - Lista todos los archivos del repositorio Git

### Herramientas (Tools) Disponibles

CodeCompanion puede usar estas herramientas cuando se lo pidas:

- **cmd_runner**: Ejecutar comandos shell (requiere aprobación)
- **editor**: Actualizar buffers con respuestas de la IA
- **files**: Modificar el sistema de archivos (requiere aprobación)

### Grupos de Herramientas

- **full_stack_dev**: Full Stack Developer - puede ejecutar código, editar código y modificar archivos
- **gentleman**: Personalidad "The Gentleman" - asistente con estilo argentino especializado en arquitectura frontend

### Modelos Disponibles

- `copilot_4o` - GPT-4o
- `copilot_41` - GPT-4.1
- `copilot_gemini_25_pro` - Gemini 2.5 Pro

---

## 💬 AI Assistant - CopilotChat

CopilotChat es otra interfaz de chat con IA usando Claude 3.5 Sonnet.

### Comando Principal

| Comando        | Descripción       |
| -------------- | ----------------- |
| `:CopilotChat` | Abrir CopilotChat |

### Mapeos en CopilotChat

| Tecla    | Modo          | Acción           |
| -------- | ------------- | ---------------- |
| `Tab`    | Insert        | Completar        |
| `q`      | Normal        | Cerrar           |
| `Ctrl+c` | Insert        | Cerrar           |
| `Ctrl+l` | Normal/Insert | Reset            |
| `Enter`  | Normal        | Enviar prompt    |
| `Ctrl+s` | Insert        | Enviar prompt    |
| `grr`    | Normal        | Toggle sticky    |
| `grx`    | Normal        | Limpiar stickies |
| `Ctrl+y` | Normal/Insert | Aceptar diff     |
| `gj`     | Normal        | Saltar al diff   |
| `gqa`    | Normal        | Quickfix answers |
| `gqd`    | Normal        | Quickfix diffs   |
| `gy`     | Normal        | Yank diff        |
| `gd`     | Normal        | Mostrar diff     |
| `gi`     | Normal        | Mostrar info     |
| `gc`     | Normal        | Mostrar contexto |
| `gh`     | Normal        | Mostrar ayuda    |

### Prompts Disponibles

Puedes usar estos prompts predefinidos:

- **Explain**: Explicar cómo funciona el código
- **Review**: Revisar código y sugerir mejoras
- **Tests**: Explicar el código y generar unit tests
- **Refactor**: Refactorizar código para mejorar claridad
- **FixCode**: Arreglar código para que funcione correctamente
- **FixError**: Explicar error y proveer solución
- **BetterNamings**: Sugerir mejores nombres para variables/funciones
- **Documentation**: Generar documentación
- **JsDocs**: Generar JSDoc
- **DocumentationForGithub**: Documentación en Markdown para GitHub
- **CreateAPost**: Crear post para redes sociales (LinkedIn)
- **SwaggerApiDocs**: Documentación Swagger para APIs
- **SwaggerJsDocs**: JSDoc Swagger para APIs
- **Summarize**: Resumir texto
- **Spelling**: Corregir gramática y ortografía
- **Wording**: Mejorar gramática y redacción
- **Concise**: Hacer texto más conciso

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

- **LazyVim** - Framework base
- **which-key.nvim** - Ayuda con keybindings
- **fzf-lua** - Fuzzy finder
- **CodeCompanion** - Asistente IA
- **CopilotChat** - Chat con IA (Claude)
- **obsidian.nvim** - Integración con Obsidian
- **oil.nvim** - Explorador de archivos
- **goto-preview** - Preview de código
- **git.nvim** - Integración Git
- **mini.hipatterns** - Highlighting de patrones
- **nvim-tmux-navigation** - Navegación Tmux
- **screenkey** - Mostrar teclas en pantalla

---

## 💡 Tips

1. **Guardar archivos**: Usa `Ctrl+s` en cualquier modo para guardar con una notificación amigable
2. **Buscar texto seleccionado**: Selecciona texto en modo visual y usa `<leader>sg` para buscarlo
3. **Navegación con Tmux**: Los atajos `Ctrl+h/j/k/l` funcionan tanto en Neovim como en Tmux
4. **AI Assistants**: Tienes dos asistentes IA disponibles - CodeCompanion y CopilotChat, úsalos según prefieras
5. **Obsidian**: Si trabajas con notas, todos los comandos están bajo `<leader>o`
6. **Preview**: Usa los comandos `gp*` para ver definiciones sin perder tu posición actual
7. **Formateo**: Si algo no se formatea, usa `:FormatInfo` para ver qué formatters están disponibles
8. **Oil**: Usa `-` para abrir el explorador de archivos y edita el filesystem como si fuera texto
9. **Recargar config**: Usa `<leader>ur` para recargar la configuración sin reiniciar Neovim

---

## 📚 Documentación Adicional

- **[GUIA_COMANDOS.md](./GUIA_COMANDOS.md)** - Guía detallada de comandos nuevos y mejoras
- **[OIL_COMANDOS.md](./OIL_COMANDOS.md)** - Guía completa de Oil file explorer
- **[MEJORAS_IMPLEMENTADAS.md](./MEJORAS_IMPLEMENTADAS.md)** - Changelog de mejoras técnicas

---

**Fecha de creación**: 16 de octubre de 2025
**Última actualización**: 5 de noviembre de 2025
**Configuración**: LazyVim con plugins personalizados y optimizaciones
