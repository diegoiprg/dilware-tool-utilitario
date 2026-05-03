# Session Log — dilware-tool-macGestorEntorno

> Fuente de verdad de sesión compartida entre Claude Code, Gemini CLI y Kiro.
> Formato: session-log-spec v1.0 — no editar manualmente salvo emergencia.
---
<!-- CHECKPOINT id="20260502-230100-claude" -->
## Checkpoint — 2026-05-02 23:01 | claude | dil-macmini

### Trabajado
- `claude.lua`: soporte para 5 cuotas (five_hour, seven_day, seven_day_sonnet, seven_day_design, daily) — las 3 nuevas muestran "(pendiente)" hasta que Claude Code las emita
- `statusline.sh`: captura automática de campos nuevos cuando Claude Code los emita (seven_day_sonnet, seven_day_design, daily)
- `sysmon.lua`: módulo nuevo — fila base del overlay con CPU/RAM/GPU/Red/Batería
  - Semáforo por ítem (verde <60%, amarillo <85%, rojo ≥85%)
  - Detección de tipo de conexión (WIFI/CABLE) con íconos ≋/⌁
  - Detección de VPN via scutil + utun
  - Indicador de conectividad via ping a 1.1.1.1 (async, cada 10s)
  - Batería: solo en MacBook (has_battery()), con estado de carga
  - Expone `net_state()` y `fmt_net()` para uso desde network.lua
- `focus_overlay.lua`: integración de sysmon — fondo siempre neutro, styledtext con colores por ítem; fix para aceptar styledtext userdata directo
- `menu.lua`: nueva sección SISTEMA con ⬡ Monitor (CPU/RAM/GPU + batería) y 🔋 Batería
- `network.lua`: submenú RED enriquecido — tipo conexión (⌁ CABLE / ≋ WIFI), VPN on/off, velocidad ↑↓ desde sysmon
- Symlink creado: `~/.hammerspoon/macspaces/sysmon.lua`

### Decisiones
- Red quitada del banner (ruido), solo en menú RED: cambia poco y no justifica espacio permanente
- Batería en Mac Mini: no se muestra nada (has_battery() = false)
- Fondo de fila sysmon siempre neutro (pct=0): el semáforo está en el texto, no en el fondo
- `net_state()` y `fmt_net()` expuestos desde sysmon para evitar duplicar lógica en network.lua
- Íconos ≋/⌁ elegidos para WIFI/CABLE — pendiente validar render en el banner

### Pendientes
- [ ] Validar render de ≋ y ⌁ en el banner (usuario pendiente de reporte)
- [ ] Cuando Claude Code emita seven_day_sonnet/seven_day_design/daily: quitar marca "(pendiente)"
- [ ] Commitear cambios de esta sesión y hacer release

### Contexto
- Todos los archivos editados son symlinks a `github-dilware/tool-utilitario/macspaces/`
- sysmon.lua es archivo nuevo — requiere symlink manual (ya creado en esta sesión)
- La detección WIFI/CABLE usa networksetup + comparación de IP — puede dar "cable" en Mac Mini aunque sea correcto
<!-- END CHECKPOINT id="20260502-230100-claude" -->

<!-- CHECKPOINT id="20260423-231627-claude" -->
## Checkpoint — 2026-04-23 23:16 | claude | dil-macmini

### Trabajado
- Repo renombrado en GitHub de `dilware-tool-macGestorEntorno` a `dilware-tool-utilitario`
- Remote local actualizado: `git@github.com:diegoiprg/dilware-tool-utilitario.git`
- `CLAUDE.md` del workspace actualizado con nuevo nombre de repo y carpeta (`tool-utilitario/`)
<!-- END CHECKPOINT id="20260423-231627-claude" -->

<!-- SESSION id="20260419-104333-kiro" -->
## Sesión cerrada — 2026-04-19 11:17 | kiro | dil-macbook

### Resumen
- `gemini.lua`: auto-refresh cada 5min via `hs.task` + `hs.timer`; `gemini-usage.sh` integrado al repo
- Overlay: posición inferior izquierda, borde absoluto (`fullFrame()`)
- `config.lua`: soporte `config_local.lua` para overrides (merge shallow)
- `install.sh`: reescrito — detección local/remoto, symlinks, `--dry-run`, `config_local.lua` como plantilla
- Auditoría del instalador: corregido `set_browser.lua` fantasma, `rm -f` antes de symlink, `bt_devices.swift` en modo remoto
- Push directo a `main`, feature branch eliminada

### Versión
v2.14.0 — `f9499fd` en `main`

### Pendientes
- Verificar instalación limpia en Mac mini
- Modo remoto (`curl|bash`) no testeado en real
- Considerar persistir posición del overlay en disco
<!-- END SESSION id="20260419-104333-kiro" -->

<!-- CHECKPOINT id="20260419-005345-gemini" -->
## Checkpoint — 2026-04-19 00:53 | gemini | dil-macbook

### Contexto
Sesión interrumpida sin cierre explícito — recuperada al reiniciar.
<!-- END CHECKPOINT id="20260419-005345-gemini" -->
