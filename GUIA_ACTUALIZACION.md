# Guía de Actualización del Sitio 2025

## 📁 Estructura de Carpetas

```
📂 Tu carpeta de desarrollo (donde trabajas)
   └── proyecto-2025-source/
       ├── app/                  ← Tu código React/TypeScript
       ├── public/               ← Imágenes y archivos estáticos
       ├── package.json
       ├── vite.config.ts
       └── react-router.config.ts

📂 wgarzon.github.io (repositorio GitHub Pages)
   ├── index.html               ← Redirige a /2025/
   ├── 2025/                    ← Build desplegado (generado automáticamente)
   └── actualizar-2025.ps1      ← Script de despliegue
```

## 🔄 Flujo de Trabajo

### Opción 1: Con el Script Automatizado (Recomendado) ⭐

1. **Hacer cambios en tu proyecto**
   - Edita archivos en tu carpeta de desarrollo
   - Prueba localmente: `pnpm run dev`

2. **Ejecutar el script de actualización**
   ```powershell
   cd "C:\Users\maria\Documents\Maestria\wgarzon.github.io"
   
   .\actualizar-2025.ps1 -SourcePath "C:\ruta\a\tu\proyecto-fuente"
   ```

3. **El script hace automáticamente:**
   - ✅ Instala dependencias (si es necesario)
   - ✅ Construye el proyecto (`pnpm run build`)
   - ✅ Crea un backup de la versión anterior
   - ✅ Copia los archivos al repositorio
   - ✅ Te pregunta si quieres hacer commit y push
   - ✅ Despliega a GitHub Pages

4. **Espera 1-2 minutos** y visita: https://wgarzon.github.io/2025/

### Opción 2: Manual (Paso a Paso)

Si prefieres hacerlo manualmente:

1. **Build del proyecto**
   ```powershell
   cd "=C:\Users\maria\Desktop\a\9_Semestre\newFrontProject\"
   pnpm run build
   ```

2. **Copiar archivos**
   ```powershell
   # Backup (opcional)
   cd "C:\Users\maria\Documents\Maestria\wgarzon.github.io"
   Copy-Item -Recurse "2025" "2025-backup-$(Get-Date -Format 'yyyyMMdd')"
   
   # Limpiar y copiar nuevo build
   Remove-Item "2025\*" -Recurse -Force -Exclude "node_modules"
   Copy-Item -Recurse "C:\Users\maria\Desktop\a\9_Semestre\newFrontProject\build\client\*" "2025\" -Force
   ```

3. **Commit y push**
   ```powershell
   git add 2025/
   git commit -m "Update: Colombia Data Summit 2025 - $(Get-Date -Format 'yyyy-MM-dd')"
   git push origin main
   ```

## 📝 Ejemplos de Uso

### Ejemplo 1: Actualización Simple
```powershell
.\actualizar-2025.ps1 -SourcePath "C:\Proyectos\colombia-data-summit-2025"
```

### Ejemplo 2: Con Mensaje Personalizado
```powershell
.\actualizar-2025.ps1 `
    -SourcePath "C:\Proyectos\colombia-data-summit-2025" `
    -CommitMessage "Fix: Corrección de errores en la sección de speakers"
```

### Ejemplo 3: Solo Build, Sin Deploy
```powershell
# Ejecuta el script y responde "N" cuando pregunte si deseas hacer push
.\actualizar-2025.ps1 -SourcePath "C:\Proyectos\colombia-data-summit-2025"
# Responde: N
```

## 🛠️ Configuración Inicial

### 1. Guardar la ruta de tu proyecto fuente

Para no escribir la ruta cada vez, crea un archivo `config-local.ps1`:

```powershell
# En: C:\Users\maria\Documents\Maestria\wgarzon.github.io\config-local.ps1
$SourceProjectPath = "C:\tu\ruta\al\proyecto-fuente"
```

Luego crea un script shortcut `update.ps1`:

```powershell
# En: C:\Users\maria\Documents\Maestria\wgarzon.github.io\update.ps1
. .\config-local.ps1
.\actualizar-2025.ps1 -SourcePath $SourceProjectPath
```

Ahora solo ejecuta:
```powershell
.\update.ps1
```

## ⚠️ Notas Importantes

1. **No edites archivos directamente en `2025/`**
   - Los cambios en `2025/` se sobrescriben en cada deploy
   - Siempre edita en tu carpeta de desarrollo

2. **Backups automáticos**
   - El script crea backups con timestamp
   - Están en carpetas como: `2025-backup-20251017-143022/`
   - Puedes eliminar backups antiguos manualmente

3. **Git status antes de push**
   - El script siempre muestra los cambios antes de hacer push
   - Revisa que todo esté correcto antes de confirmar

4. **Tiempo de propagación**
   - GitHub Pages tarda 1-2 minutos en actualizar
   - Refresca con Ctrl+F5 (hard refresh) en el navegador

## 🐛 Solución de Problemas

### Error: "No se encontró pnpm"
```powershell
npm install -g pnpm
```

### Error: "Build failed"
```powershell
# Ve a tu carpeta de desarrollo y verifica:
cd "C:\ruta\a\tu\proyecto"
pnpm install --force
pnpm run build
```

### Los cambios no se ven en el sitio
1. Espera 2-3 minutos
2. Haz hard refresh: `Ctrl + Shift + R` (o `Ctrl + F5`)
3. Verifica en GitHub: https://github.com/wgarzon/wgarzon.github.io/actions

## 📞 Comandos Útiles

```powershell
# Ver estado del repositorio
git status

# Ver últimos commits
git log --oneline -5

# Deshacer último commit (mantiene cambios)
git reset --soft HEAD~1

# Ver qué archivos cambiaron
git diff --stat 2025/
```

## ✨ Tips

- Usa VS Code para editar tu proyecto fuente
- Prueba siempre localmente antes de desplegar (`pnpm run dev`)
- Haz commits descriptivos para rastrear cambios
- Mantén tu proyecto fuente en un repositorio Git separado
