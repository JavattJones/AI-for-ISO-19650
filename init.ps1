# init.ps1 -- Verificacion de entorno para auditoria ISO 19650
# Ejecutar antes de cualquier sesion de trabajo.
# Exit code 0 = todo correcto. Exit code 1 = hay problemas que resolver.

$errors_list = @()
$warnings_list = @()
$base = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AUDITOR ISO 19650 -- Verificacion de entorno" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# -- C1: Archivos base obligatorios --
Write-Host "C1 -- Archivos base..." -ForegroundColor Yellow

$required_files = @(
    "AGENTS.md",
    "CHECKPOINTS.md",
    "requirements.json",
    "progress\current.md",
    "progress\history.md",
    "docs\clauses_19650-2.md",
    "docs\artefact_checklist.md",
    "docs\gap_severity.md",
    ".claude\agents\leader.md",
    ".claude\agents\indexer.md",
    ".claude\agents\analyzer.md",
    ".claude\agents\gap_analyst.md",
    ".claude\agents\reporter.md"
)

foreach ($f in $required_files) {
    $full = Join-Path $base $f
    if (Test-Path $full) {
        Write-Host "  [OK]    $f" -ForegroundColor Green
    } else {
        Write-Host "  [FALTA] $f" -ForegroundColor Red
        $errors_list += "Archivo obligatorio no encontrado: $f"
    }
}

# -- C2: requirements.json es JSON valido --
Write-Host ""
Write-Host "C2 -- Validando requirements.json..." -ForegroundColor Yellow

$reqPath = Join-Path $base "requirements.json"
if (Test-Path $reqPath) {
    try {
        $req = Get-Content $reqPath -Raw -Encoding UTF8 | ConvertFrom-Json
        $total     = $req.requirements.Count
        $pending   = ($req.requirements | Where-Object { $_.status -eq "pending" }).Count
        $analyzing = ($req.requirements | Where-Object { $_.status -eq "analyzing" }).Count
        $complete  = ($req.requirements | Where-Object { $_.status -eq "complete" }).Count
        $blocked   = ($req.requirements | Where-Object { $_.status -eq "blocked" }).Count

        Write-Host "  [OK] JSON valido" -ForegroundColor Green
        Write-Host ("  Total requisitos : " + $total) -ForegroundColor Cyan
        Write-Host ("  Pending          : " + $pending) -ForegroundColor White
        Write-Host ("  Analyzing        : " + $analyzing) -ForegroundColor Yellow
        Write-Host ("  Complete         : " + $complete) -ForegroundColor Green
        Write-Host ("  Blocked          : " + $blocked) -ForegroundColor Red

        if ($analyzing -gt 0) {
            $warnings_list += "$analyzing requisito(s) en estado 'analyzing' -- sesion anterior puede haber quedado incompleta"
        }
        if ($req.audit_context.audited_role -eq $null) {
            $warnings_list += "audit_context.audited_role no definido -- confirmar rol antes de analizar"
        }
        if ($req.audit_context.norm_parts -eq $null) {
            $warnings_list += "audit_context.norm_parts no definido -- confirmar partes ISO aplicables"
        }
    } catch {
        Write-Host ("  [ERROR] requirements.json no es JSON valido: " + $_.Exception.Message) -ForegroundColor Red
        $errors_list += "requirements.json malformado"
    }
}

# -- C3: Estado de progress/current.md --
Write-Host ""
Write-Host "C3 -- Estado de sesion activa..." -ForegroundColor Yellow

$currentPath = Join-Path $base "progress\current.md"
if (Test-Path $currentPath) {
    $content = Get-Content $currentPath -Raw -Encoding UTF8
    if ($content -match "Feature en curso:.*ninguna" -or $content -match "Feature en curso:.*_") {
        Write-Host "  [OK] Sin sesion activa -- listo para nueva sesion" -ForegroundColor Green
    } else {
        Write-Host "  [AVISO] Hay una sesion en curso en progress/current.md" -ForegroundColor Yellow
        $warnings_list += "progress/current.md tiene sesion sin cerrar -- revisar antes de empezar"
    }
}

# -- C4: Outputs de sesiones anteriores --
Write-Host ""
Write-Host "C4 -- Outputs existentes..." -ForegroundColor Yellow

$outputs = @(
    "SALIDA_1_trazabilidad.md",
    "SALIDA_2_informe.md",
    "progress\index_artifacts.md",
    "progress\gaps_nc_pc.md"
)
foreach ($o in $outputs) {
    $full = Join-Path $base $o
    if (Test-Path $full) {
        Write-Host ("  [EXISTE]     " + $o) -ForegroundColor Cyan
    } else {
        Write-Host ("  [no existe]  " + $o) -ForegroundColor DarkGray
    }
}

# -- Resumen --
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan

if ($errors_list.Count -eq 0 -and $warnings_list.Count -eq 0) {
    Write-Host "  ENTORNO OK -- Puedes iniciar la auditoria" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Cyan
    exit 0
}

if ($warnings_list.Count -gt 0) {
    Write-Host ("  AVISOS (" + $warnings_list.Count + "):") -ForegroundColor Yellow
    foreach ($w in $warnings_list) {
        Write-Host ("  - " + $w) -ForegroundColor Yellow
    }
}

if ($errors_list.Count -gt 0) {
    Write-Host ("  ERRORES (" + $errors_list.Count + ") -- Resolver antes de continuar:") -ForegroundColor Red
    foreach ($e in $errors_list) {
        Write-Host ("  - " + $e) -ForegroundColor Red
    }
    Write-Host "========================================" -ForegroundColor Cyan
    exit 1
}

Write-Host "========================================" -ForegroundColor Cyan
exit 0
