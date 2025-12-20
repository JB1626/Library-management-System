# PowerShell script to start the Library Management System
Write-Host "Starting the application..." -ForegroundColor Green
Set-Location -Path $PSScriptRoot
if (Test-Path "pom.xml") {
    Write-Host "Found pom.xml" -ForegroundColor Green
} else {
    Write-Host "ERROR: pom.xml not found in current directory!" -ForegroundColor Red
    exit 1
}
Write-Host "Running Maven clean install..." -ForegroundColor Yellow
mvn clean install
if ($LASTEXITCODE -eq 0) {
    Write-Host "Build successful! Starting Spring Boot application..." -ForegroundColor Green
    mvn spring-boot:run
} else {
    Write-Host "Build failed!" -ForegroundColor Red
    exit 1
}
Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Application started successfully!" -ForegroundColor Green
Write-Host "Access URL: http://localhost:9080" -ForegroundColor Yellow
Write-Host "Login Credentials:" -ForegroundColor Yellow
Write-Host "  Email: admin@admin.in" -ForegroundColor White
Write-Host "  Password: Temp123" -ForegroundColor White
Write-Host "========================================`n" -ForegroundColor Cyan
