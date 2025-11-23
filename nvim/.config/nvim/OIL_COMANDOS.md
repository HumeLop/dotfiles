# 🗂️ Oil.nvim - Comandos y Atajos

## Atajos de Teclado (Keymaps)

### Keymaps Globales

- `-` → Abrir Oil en el directorio padre del archivo actual
- `<leader>-` → Abrir Oil en el directorio de trabajo actual (cwd)
- `<leader>fo` → Abrir Oil file explorer

## Comandos de Usuario

### Comandos Personalizados

- `:OilToggleHidden` → Mostrar/ocultar archivos ocultos
- `:OilFloat` → Abrir Oil en ventana flotante
- `:OilCurrentDir` → Abrir Oil en el directorio de trabajo actual

## Atajos Dentro de Oil

### Navegación

- `<CR>` (Enter) → Abrir archivo o entrar en directorio
- `-` → Ir al directorio padre
- `_` → Ir al directorio de trabajo actual (cwd)
- `` ` `` → Cambiar directorio de trabajo al directorio actual de Oil
- `~` → Cambiar directorio de trabajo en la pestaña actual

### Ventanas y Divisiones

- `<C-s>` → Abrir en split vertical
- `<C-h>` → Abrir en split horizontal
- `<C-t>` → Abrir en nueva pestaña
- `<C-p>` → Vista previa del archivo
- `<C-c>` → Cerrar Oil
- `<C-l>` → Refrescar vista

### Operaciones con Archivos

- `g?` → Mostrar ayuda con todos los comandos
- `gs` → Cambiar orden de clasificación
- `gx` → Abrir con aplicación externa
- `g.` → Mostrar/ocultar archivos ocultos
- `g\` → Mostrar/ocultar papelera

## Características Principales

### ✨ Ventajas de Oil

1. **Editor de archivos como buffer** → Edita el sistema de archivos como si fuera texto
2. **Iconos bonitos** → Gracias a nvim-web-devicons
3. **Vista previa rápida** → Con `<C-p>`
4. **Papelera de reciclaje** → Los archivos eliminados van a la papelera del sistema
5. **Confirmación de cambios** → No se aplican cambios hasta que guardes el buffer

### 🎯 Flujo de Trabajo

1. Abre Oil con `-`
2. Navega con `j`/`k`
3. Edita nombres de archivos directamente (modo insert)
4. Crea nuevos archivos/directorios escribiendo nuevas líneas
5. Elimina archivos con `dd` (como en vim)
6. Guarda cambios con `:w` o `<C-s>` (desde modo normal)

### ⚙️ Configuración Actual

- **Default file explorer**: Sí (reemplaza netrw)
- **Columnas visibles**: Solo iconos
- **Delete to trash**: Activado
- **Confirmación**: Desactivada para ediciones simples
- **LSP file methods**: Timeout de 1 segundo
- **Watch for changes**: Desactivado (mejor rendimiento)

## 💡 Tips

1. **Crear directorio**: Escribe el nombre terminado en `/`

   ```
   nuevo-directorio/
   ```

2. **Mover archivos**: Corta (`dd`) y pega (`p`) como en vim

3. **Copiar ruta completa**: Usa `y` en el archivo y pégalo donde quieras

4. **Búsqueda rápida**: Usa `/` para buscar archivos (como en vim)

5. **Ventana flotante**: Usa `:OilFloat` para una vista rápida sin cambiar el layout

---

**Última actualización:** 5 de noviembre de 2025
