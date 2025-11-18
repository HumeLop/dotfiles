# 📚 Guía de Comandos - Mejoras Implementadas

## 📋 Índice Rápido

- [Formateo](#-formateo)
- [Oil File Explorer](#-oil-file-explorer)
- [Copilot](#-copilot)
- [Utilidades](#-utilidades)
- [Performance](#-performance)

---

## 🎨 Formateo

### Comandos

| Comando         | Keymap       | Descripción                                   |
| --------------- | ------------ | --------------------------------------------- |
| `:Format`       | `<leader>cF` | Formatear buffer actual manualmente con info  |
| `:FormatInfo`   | `<leader>cf` | Mostrar formatters disponibles para el buffer |
| `:FormatToggle` | `<leader>uF` | Activar/desactivar autoformat al guardar      |

### Cómo funciona

El sistema de formateo ahora es **inteligente**:

1. **Primero intenta usar `conform.nvim`** con formatters como prettier, stylua, etc.
2. **Si no hay formatters de conform**, usa el LSP
3. **Si no hay ninguno disponible**, simplemente guarda sin error

### Formatters instalados vía Mason

Puedes instalar formatters desde Neovim:

```vim
:Mason
```

Formatters recomendados ya instalados:

- `prettier` - HTML, JS, TS, CSS, JSON, etc.
- `stylua` - Lua
- `shfmt` - Shell scripts
- `biome` - JS/TS alternativo

### Tips

**Ver qué formatter se usará:**

```vim
:FormatInfo
```

**Formatear manualmente (útil para debug):**

```vim
:Format
" o
<leader>cF
```

**Desactivar autoformat temporalmente:**

```vim
:FormatToggle
" o
<leader>uF
```

**Excluir tipos de archivo del autoformat:**

Edita `lua/config/autocmds.lua` y añade a la lista `excluded_filetypes`:

```lua
local excluded_filetypes = { "lazy", "oil", "TelescopePrompt", "markdown" }
```

---

## 📂 Oil File Explorer

### Keymaps Globales

| Keymap       | Descripción                              |
| ------------ | ---------------------------------------- |
| `-`          | Abrir Oil en directorio padre            |
| `<leader>-`  | Abrir Oil en directorio de trabajo (cwd) |
| `<leader>fo` | Abrir Oil file explorer                  |

### Comandos

| Comando            | Descripción                           |
| ------------------ | ------------------------------------- |
| `:OilToggleHidden` | Mostrar/ocultar archivos ocultos      |
| `:OilFloat`        | Abrir Oil en ventana flotante         |
| `:OilCurrentDir`   | Abrir Oil en el directorio de trabajo |

### Keymaps Dentro de Oil

| Keymap  | Descripción                    |
| ------- | ------------------------------ |
| `<CR>`  | Abrir archivo/directorio       |
| `-`     | Ir al directorio padre         |
| `_`     | Ir al cwd                      |
| `<C-s>` | Abrir en split vertical        |
| `<C-h>` | Abrir en split horizontal      |
| `<C-t>` | Abrir en nueva pestaña         |
| `<C-p>` | Vista previa                   |
| `<C-c>` | Cerrar Oil                     |
| `<C-l>` | Refrescar vista                |
| `g?`    | Mostrar ayuda completa         |
| `g.`    | Toggle archivos ocultos        |
| `gs`    | Cambiar orden de clasificación |
| `gx`    | Abrir con aplicación externa   |
| `g\`    | Toggle papelera                |

### Flujo de trabajo con Oil

1. Abre con `-`
2. Navega con `j`/`k`
3. **Edita nombres** directamente en modo insert
4. **Crea archivos/carpetas** escribiendo nuevas líneas
5. **Elimina con `dd`** (van a la papelera)
6. **Guarda cambios** con `:w`

Ver documentación completa en: [OIL_COMANDOS.md](./OIL_COMANDOS.md)

---

## 🤖 Copilot

### Configuración actualizada

| Keymap   | Descripción            |
| -------- | ---------------------- |
| `<M-l>`  | Aceptar sugerencia     |
| `<M-]>`  | Siguiente sugerencia   |
| `<M-[>`  | Sugerencia anterior    |
| `<C-]>`  | Descartar sugerencia   |
| `<M-CR>` | Abrir panel de Copilot |

### Archivos excluidos

Copilot está **desactivado** en:

- YAML
- Markdown
- Help
- Gitcommit/gitrebase
- Archivos de control de versiones

---

## 🛠️ Utilidades

### Guardado

| Keymap  | Modo   | Descripción               |
| ------- | ------ | ------------------------- |
| `<C-s>` | Normal | Guardar con notificación  |
| `<C-s>` | Insert | Salir de insert y guardar |

### Configuración

| Keymap       | Comando            | Descripción                 |
| ------------ | ------------------ | --------------------------- |
| `<leader>ur` | `:source $MYVIMRC` | Recargar configuración      |
| `<leader>uc` | -                  | Cambiar colorscheme (ciclo) |
| `<leader>uF` | `:FormatToggle`    | Toggle autoformat           |

### Quickfix

| Keymap       | Descripción          |
| ------------ | -------------------- |
| `<leader>xq` | Toggle quickfix list |

### Marks

| Keymap       | Descripción               |
| ------------ | ------------------------- |
| `<leader>md` | Eliminar todas las marcas |

### Búsqueda Visual

| Keymap       | Modo   | Descripción                              |
| ------------ | ------ | ---------------------------------------- |
| `<leader>sg` | Visual | Grep del texto seleccionado (dir actual) |
| `<leader>sG` | Visual | Grep del texto seleccionado (root dir)   |

---

## ⚡ Performance

### Optimizaciones automáticas

El sistema detecta **archivos grandes** (>100KB) y automáticamente:

- ❌ Desactiva spell checking
- ❌ Desactiva swap files
- ❌ Desactiva undo files
- ❌ Desactiva treesitter
- ❌ Desactiva columnas decorativas

Esto mejora significativamente el rendimiento con archivos grandes.

### Plugins deshabilitados

Para mejor startup:

- gzip, zip, tar plugins
- vimball
- 2html_plugin
- logipat
- rrhelper
- spellfile_plugin
- matchit

**Archivo:** `lua/config/performance.lua`

---

## 📝 Spell Checking

### Auto-compilación

Los archivos de spelling se **compilan automáticamente** al guardar:

- `spell/en_words.txt` → `spell/en.utf-8.spl`
- `spell/es_words.txt` → `spell/es.utf-8.spl`
- Cualquier archivo `*_custom.txt`

Recibirás una notificación cuando se compile.

### Configuración actual

```lua
vim.opt.spell = true
vim.opt.spelllang = { "es", "en" }
```

---

## 🎯 Resumen de Archivos de Configuración

### Archivos principales

```
lua/
├── config/
│   ├── autocmds.lua       → Autocomandos y comandos de usuario
│   ├── keymaps.lua        → Todos los keymaps personalizados
│   ├── options.lua        → Opciones de Neovim
│   ├── lazy.lua           → Configuración de lazy.nvim
│   ├── nodejs.lua         → Configuración de Node.js
│   ├── performance.lua    → Optimizaciones de rendimiento (NUEVO)
│   └── gentleman/
│       └── utils.lua      → Utilidades personalizadas
│
└── plugins/
    ├── blink.lua          → Configuración de blink.cmp (mejorada)
    ├── copilot.lua        → Configuración de Copilot (corregida)
    ├── oil.lua            → Configuración de Oil (restaurada)
    ├── devicons.lua       → Configuración de iconos (NUEVO)
    ├── overrides.lua      → Overrides de LSP (mejorado)
    └── ...                → Otros plugins
```

### Documentación

```
COMANDOS.md                  → Documentación completa de comandos
MEJORAS_IMPLEMENTADAS.md     → Este archivo
OIL_COMANDOS.md              → Guía específica de Oil
README.md                    → README del proyecto
```

---

## 🔄 Changelog de Hoy (5 nov 2025)

### ✅ Implementado

1. ✅ Blink.cmp configuración completa
2. ✅ Autoformat mejorado con detección inteligente
3. ✅ Copilot keymaps corregidos
4. ✅ Oil completamente restaurado con iconos
5. ✅ Sistema de formateo robusto sin errores
6. ✅ Comandos de debugging: `:FormatInfo`, `:Format`
7. ✅ Toggle de autoformat: `:FormatToggle`
8. ✅ Optimizaciones de performance para archivos grandes
9. ✅ Spell checking con auto-compilación
10. ✅ Mejores opciones por defecto
11. ✅ Keymaps adicionales para productividad
12. ✅ Documentación completa actualizada

### 🐛 Bugs Corregidos

- ❌ Error "no matching language servers" → **Resuelto**
- ❌ Oil sin configuración → **Restaurado completamente**
- ❌ Iconos no visibles en Oil → **Arreglado**
- ❌ Copilot con estructura incorrecta → **Corregido**
- ❌ Capabilities no aplicadas correctamente → **Arreglado**
- ❌ Formateo asíncrono causando conflictos → **Cambiado a síncrono**

---

## 📚 Recursos Adicionales

- **LazyVim Docs:** https://www.lazyvim.org/
- **Conform.nvim:** https://github.com/stevearc/conform.nvim
- **Oil.nvim:** https://github.com/stevearc/oil.nvim
- **Blink.cmp:** https://github.com/saghen/blink.cmp

---

**Última actualización:** 5 de noviembre de 2025 - 22:00h
**Estado:** ✅ Todas las funcionalidades probadas y funcionando
