# Script rápido para actualizar el sitio 2025
# Configura la ruta a tu proyecto fuente aquí:

$SourceProjectPath = "C:\Users\maria\Desktop\a\9_Semestre\newFrontProject"

# No edites debajo de esta línea
# ==========================================

if ($SourceProjectPath -eq "C:\Users\maria\Desktop\a\9_Semestre\newFrontProject") {
    Write-Host "⚠️  ERROR: Debes configurar la ruta de tu proyecto fuente" -ForegroundColor Red
    Write-Host ""
    Write-Host "Edita el archivo update.ps1 y cambia la línea:" -ForegroundColor Yellow
    Write-Host '  $SourceProjectPath = "C:\Users\maria\Desktop\a\9_Semestre\newFrontProject"' -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Por la ruta real de tu proyecto, ejemplo:" -ForegroundColor Yellow
    Write-Host '  $SourceProjectPath = "C:\Users\maria\Documents\colombia-data-summit-2025"' -ForegroundColor Cyan
    Write-Host ""
    exit 1
}

.\actualizar-2025.ps1 -SourcePath $SourceProjectPath
