# 🚀 Guía Rápida - Neovim Config

## 📖 Documentación

| Archivo                                                | Descripción                                               |
| ------------------------------------------------------ | --------------------------------------------------------- |
| [GUIA_COMANDOS.md](./GUIA_COMANDOS.md)                 | **Guía completa de comandos nuevos** (¡Lee esto primero!) |
| [COMANDOS.md](./COMANDOS.md)                           | Documentación detallada de todos los comandos             |
| [OIL_COMANDOS.md](./OIL_COMANDOS.md)                   | Guía del explorador de archivos Oil                       |
| [MEJORAS_IMPLEMENTADAS.md](./MEJORAS_IMPLEMENTADAS.md) | Changelog técnico de mejoras                              |
| [README.md](./README.md)                               | Documentación técnica completa                            |

---

## ⚡ Comandos Más Usados

### 🎨 Formateo

```vim
:FormatInfo       " Ver qué formatters están disponibles
:Format          " Formatear manualmente
:FormatToggle    " Toggle autoformat on/off
<leader>cf       " Ver info de formateo (keymap)
<leader>cF       " Formatear manualmente (keymap)
<leader>uF       " Toggle autoformat (keymap)
```

### 📂 Oil (Explorador de Archivos)

```vim
-                " Abrir Oil en directorio padre
<leader>-        " Abrir Oil en directorio actual
<leader>fo       " Abrir Oil
:OilFloat        " Oil en ventana flotante
:OilToggleHidden " Toggle archivos ocultos
```

### 💾 Guardar

```vim
<C-s>            " Guardar (funciona en normal e insert)
```

### 🔄 Utilidades

```vim
<leader>ur       " Recargar configuración
<leader>uc       " Cambiar colorscheme (ciclo)
<leader>xq       " Toggle quickfix list
<leader>md       " Eliminar todas las marcas
```

### 🔍 Búsqueda

```vim
<leader>sg       " (Visual) Buscar texto seleccionado
<leader>sG       " (Visual) Buscar en root dir
```

### 🤖 Copilot

```vim
<M-l>            " Aceptar sugerencia
<M-]>            " Siguiente sugerencia
<M-[>            " Anterior sugerencia
<C-]>            " Descartar sugerencia
```

---

## 🎯 Flujos de Trabajo Comunes

### Formatear código que no se formatea

```vim
:FormatInfo      " 1. Ver qué formatters hay
:Format          " 2. Intentar formatear manualmente
:Mason           " 3. Si falla, instalar formatter necesario
```

### Explorar y editar archivos con Oil

```vim
-                " 1. Abrir Oil
j/k              " 2. Navegar
i                " 3. Entrar en modo insert para editar nombres
dd               " 4. Eliminar archivos (van a papelera)
:w               " 5. Guardar cambios
```

### Buscar texto específico

```vim
                 " 1. Seleccionar texto en modo visual (v)
<leader>sg       " 2. Buscar en directorio actual
<leader>sG       " 3. O buscar en root del proyecto
```

---

## 🐛 Solución de Problemas

### "Format request failed, no matching language servers"

✅ **Resuelto** - Ahora verifica formatters antes de intentar formatear

```vim
:FormatInfo      " Ver qué está disponible
```

### Oil no muestra iconos

✅ **Resuelto** - nvim-web-devicons configurado correctamente

### Prettier no formatea

```vim
:Mason           " Verifica que prettier esté instalado
:FormatInfo      " Confirma que lo detecta
```

---

## 📦 Plugins Principales

- **lazy.nvim** - Plugin manager
- **blink.cmp** - Autocompletado inteligente
- **conform.nvim** - Formateo con prettier, stylua, etc.
- **oil.nvim** - Explorador de archivos como buffer
- **copilot.lua** - IA coding assistant
- **nvim-lspconfig** - Language servers
- **obsidian.nvim** - Gestión de notas
- **nvim-tmux-navigation** - Navegación con Tmux

---

## 💡 Tips Pro

1. **Usa Oil para renombrar múltiples archivos**: Abre con `-`, edita en batch, guarda con `:w`
2. **Toggle autoformat antes de commits**: `<leader>uF` si no quieres formatear
3. **Preview sin perder posición**: Usa `<C-p>` en Oil para preview rápido
4. **Busca visualmente**: Selecciona y `<leader>sg` es más rápido que escribir
5. **Recargar sin reiniciar**: `<leader>ur` después de cambiar config

---

## 🔗 Links Útiles

- **LazyVim:** https://www.lazyvim.org/
- **Oil.nvim:** https://github.com/stevearc/oil.nvim
- **Conform.nvim:** https://github.com/stevearc/conform.nvim
- **Mason:** https://github.com/williamboman/mason.nvim

---

**Última actualización:** 5 de noviembre de 2025
**Versión:** LazyVim + Optimizaciones personalizadas
**Estado:** ✅ Todas las funcionalidades probadas y funcionando
