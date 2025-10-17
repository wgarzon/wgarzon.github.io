# Script para actualizar el sitio 2025 en GitHub Pages
# Uso: .\actualizar-2025.ps1 -SourcePath "C:\ruta\a\tu\proyecto-fuente"

param(
    [Parameter(Mandatory=$true)]
    [string]$SourcePath,
    
    [Parameter(Mandatory=$false)]
    [string]$CommitMessage = "Update: Colombia Data Summit 2025 site"
)

$ErrorActionPreference = "Stop"

Write-Host "================================" -ForegroundColor Cyan
Write-Host "  Actualizador 2025 Site" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Validar que existe la carpeta fuente
if (-not (Test-Path $SourcePath)) {
    Write-Host "❌ Error: No existe la carpeta: $SourcePath" -ForegroundColor Red
    exit 1
}

# Validar que tiene package.json
if (-not (Test-Path "$SourcePath\package.json")) {
    Write-Host "❌ Error: No se encontró package.json en: $SourcePath" -ForegroundColor Red
    exit 1
}

Write-Host "📂 Carpeta fuente: $SourcePath" -ForegroundColor Green
Write-Host ""

# Paso 1: Ir a la carpeta fuente y construir
Write-Host "🔨 Paso 1: Construyendo el proyecto..." -ForegroundColor Yellow
Push-Location $SourcePath

try {
    # Verificar si existe node_modules, si no, instalar
    if (-not (Test-Path "node_modules")) {
        Write-Host "   📦 Instalando dependencias..." -ForegroundColor Cyan
        pnpm install
    }
    
    # Construir el proyecto
    Write-Host "   🏗️  Ejecutando build..." -ForegroundColor Cyan
    pnpm run build
    
    if (-not (Test-Path "build\client")) {
        Write-Host "❌ Error: No se generó la carpeta build\client" -ForegroundColor Red
        Pop-Location
        exit 1
    }
    
    Write-Host "   ✅ Build completado" -ForegroundColor Green
    Write-Host ""
    
} catch {
    Write-Host "❌ Error durante el build: $_" -ForegroundColor Red
    Pop-Location
    exit 1
}

Pop-Location

# Paso 2: Copiar archivos al repositorio GitHub Pages
Write-Host "📦 Paso 2: Copiando archivos al repositorio..." -ForegroundColor Yellow

$RepoPath = $PSScriptRoot
$DestPath = Join-Path $RepoPath "2025"

# Hacer backup si existe
if (Test-Path $DestPath) {
    $BackupPath = Join-Path $RepoPath "2025-backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Write-Host "   💾 Creando backup en: $BackupPath" -ForegroundColor Cyan
    Copy-Item -Recurse $DestPath $BackupPath -Force
}

# Limpiar carpeta destino (excepto node_modules si existe)
if (Test-Path $DestPath) {
    Write-Host "   🧹 Limpiando carpeta 2025/..." -ForegroundColor Cyan
    Get-ChildItem $DestPath -Exclude "node_modules" | Remove-Item -Recurse -Force
}

# Crear carpeta si no existe
if (-not (Test-Path $DestPath)) {
    New-Item -ItemType Directory -Path $DestPath -Force | Out-Null
}

# Copiar todos los archivos del build
Write-Host "   📋 Copiando archivos del build..." -ForegroundColor Cyan
$BuildPath = Join-Path $SourcePath "build\client"
Copy-Item -Recurse "$BuildPath\*" $DestPath -Force

Write-Host "   ✅ Archivos copiados correctamente" -ForegroundColor Green
Write-Host ""

# Listar archivos copiados
Write-Host "📄 Archivos en 2025/:" -ForegroundColor Cyan
Get-ChildItem $DestPath | Select-Object Name | Format-Table -HideTableHeaders

# Paso 3: Verificar y mostrar cambios en Git
Write-Host "📊 Paso 3: Verificando cambios en Git..." -ForegroundColor Yellow
Push-Location $RepoPath

$GitStatus = git status --short 2025/
if ($GitStatus) {
    Write-Host "   Cambios detectados:" -ForegroundColor Cyan
    Write-Host $GitStatus
    Write-Host ""
    
    # Preguntar si desea hacer commit
    $Response = Read-Host "¿Desea hacer commit y push de estos cambios? (S/N)"
    
    if ($Response -eq "S" -or $Response -eq "s" -or $Response -eq "Y" -or $Response -eq "y") {
        Write-Host ""
        Write-Host "🚀 Paso 4: Desplegando a GitHub Pages..." -ForegroundColor Yellow
        
        git add 2025/
        git commit -m $CommitMessage
        
        Write-Host "   📤 Haciendo push a GitHub..." -ForegroundColor Cyan
        git push origin main
        
        Write-Host ""
        Write-Host "================================" -ForegroundColor Green
        Write-Host "  ✅ ¡Despliegue Completado!" -ForegroundColor Green
        Write-Host "================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "🌐 Tu sitio estará disponible en:" -ForegroundColor Cyan
        Write-Host "   https://wgarzon.github.io/2025/" -ForegroundColor White
        Write-Host ""
        Write-Host "⏱️  Espera 1-2 minutos para que GitHub Pages actualice." -ForegroundColor Yellow
        Write-Host ""
        
    } else {
        Write-Host ""
        Write-Host "⏸️  Cambios listos pero NO desplegados." -ForegroundColor Yellow
        Write-Host "   Puedes hacer commit manualmente con:" -ForegroundColor Cyan
        Write-Host "   git add 2025/" -ForegroundColor White
        Write-Host "   git commit -m '$CommitMessage'" -ForegroundColor White
        Write-Host "   git push origin main" -ForegroundColor White
        Write-Host ""
    }
    
} else {
    Write-Host "   ℹ️  No hay cambios nuevos para desplegar." -ForegroundColor Yellow
    Write-Host ""
}

Pop-Location

Write-Host "✨ Script finalizado" -ForegroundColor Green
