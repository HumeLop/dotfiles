# Configuración de Zellij con sincronización de temas Omarchy

## 🎨 ¿Qué se ha configurado?

Tu configuración de Zellij ahora se sincroniza automáticamente con el tema de Omarchy. Cada vez que cambies el tema en Omarchy, Zellij usará la paleta de colores correspondiente.

## 📁 Archivos creados

### Configuración Principal

- **`config.kdl`**: Configuración principal de Zellij con todos los temas incluidos
- **`themes.kdl`**: Archivo de referencia con todos los temas (opcional)

### Scripts y Utilidades

- **`sync-theme.sh`**: Script que sincroniza el tema de Omarchy con Zellij
- **`show-layouts.sh`**: Script que muestra todos los layouts disponibles
- **`/home/humelop/.config/omarchy/hooks/post-theme-change.sh`**: Hook que se ejecuta automáticamente cuando cambias el tema en Omarchy

### Layouts

- **`layouts/default.kdl`**: Layout general con zjstatus
- **`layouts/work-nvim.kdl`**: Workspace completo para desarrollo
- **`layouts/dev.kdl`**: Desarrollo web/fullstack
- **`layouts/minimal.kdl`**: Minimalista sin distracciones
- **`layouts/debug.kdl`**: Debugging avanzado
- **`layouts/devops.kdl`**: DevOps y containers
- **`layouts/meeting.kdl`**: Presentaciones y colaboración

### Plugins

- **`plugins/zjstatus.wasm`**: Barra de estado personalizable
- **`plugins/harpoon.wasm`**: Navegación rápida de archivos
- **`plugins/room.wasm`**: Colaboración remota
- **`plugins/zellij_forgot.wasm`**: Ayuda con keybindings

## 🎯 Temas soportados

Los siguientes temas de Omarchy están mapeados en Zellij:

- ✨ **Catppuccin** (Mocha y Latte)
- 🌲 **Everforest**
- 🟤 **Gruvbox**
- 🌊 **Kanagawa**
- ❄️ **Nord**
- 🌃 **Tokyo Night**
- 🌹 **Rose Pine**
- 📝 **Flexoki Light**
- ⚫ **Matte Black**
- 💎 **Osaka Jade**
- ☕ **Ristretto**
- 🔵 **Arc Blueberry**

## 🚀 Uso

### Sincronización automática

Cuando cambies el tema en Omarchy, el tema de Zellij se actualizará automáticamente gracias al hook.

### Sincronización manual

Si necesitas sincronizar manualmente (por ejemplo, si el hook no se ejecutó), puedes usar:

```bash
zellij-sync-theme
```

O ejecutar directamente:

```bash
~/.config/zellij/sync-theme.sh
```

### Verificar el tema actual de Omarchy

```bash
basename "$(readlink ~/.config/omarchy/current/theme)"
```

### Verificar el tema actual de Zellij

```bash
grep '^theme ' ~/.config/zellij/config.kdl
```

## 🎨 Mejoras visuales aplicadas

- ✅ **Tema sincronizado**: Se sincroniza automáticamente con Omarchy
- ✅ **UI simplificada**: Desactivada para mostrar símbolos bonitos (nerd fonts)
- ✅ **Layout compacto**: Interfaz más limpia por defecto
- ✅ **Frames de paneles**: Habilitados para mejor separación visual
- ✅ **Tips de inicio**: Desactivados (ya los conoces)

## 🔧 Personalización adicional

Si quieres cambiar manualmente el tema de Zellij sin usar Omarchy, edita la línea en `config.kdl`:

```kdl
theme "nombre-del-tema"
```

Los temas disponibles están en la sección `themes { ... }` del archivo.

## � Layouts

Para ver información detallada sobre todos los layouts disponibles:

```bash
zj-help
# O directamente:
~/.config/zellij/show-layouts.sh
```

Ver documentación completa: [LAYOUTS.md](./LAYOUTS.md)

### Aliases rápidos para layouts:

- `zj-default` - Layout general
- `zj-work` - Workspace con Neovim
- `zj-dev` - Desarrollo web
- `zj-debug` - Debugging
- `zj-ops` - DevOps
- `zj-meet` - Presentaciones
- `zj-min` - Minimalista

## �🐛 Solución de problemas

### El tema no se sincroniza automáticamente

1. Verifica que el hook tenga permisos de ejecución:

   ```bash
   chmod +x ~/.config/omarchy/hooks/post-theme-change.sh
   ```

2. Verifica que Omarchy esté ejecutando los hooks (consulta la documentación de Omarchy)

3. Ejecuta manualmente el script de sincronización:
   ```bash
   zellij-sync-theme
   ```

### El tema se ve mal o no coincide

1. Asegúrate de estar usando una terminal con soporte para colores true color (24-bit)
2. Verifica que tengas instaladas las Nerd Fonts
3. Reinicia Zellij después de cambiar el tema:
   - Presiona `Ctrl+o` → `d` para desconectar
   - Vuelve a abrir Zellij

## 📝 Notas

- Los cambios de tema requieren que cierres y vuelvas a abrir Zellij (o te desconectes y reconectes)
- Si agregas nuevos temas a Omarchy, puedes añadirlos al script `sync-theme.sh` y a la sección `themes` de `config.kdl`
- La configuración de keybindings se mantiene intacta y separada del tema

## 🎉 ¡Disfruta!

Ahora tu Zellij se verá consistente con el resto de tu sistema usando Omarchy. Cambia de tema cuando quieras y todo se sincronizará automáticamente.
