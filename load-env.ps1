
# Load variables from .env into current PowerShell session

Get-Content ".env" | ForEach-Object {
    $line = $_.Trim()

    if ($line -and -not $line.StartsWith("#")) {
        $name, $value = $line -split "=", 2

        if ($name -and $value) {
            Set-Item -Path "Env:$name" -Value $value.Trim()
        }
    }
}

Write-Host "Environment variables loaded." -ForegroundColor Green


if ($env:GROQ_API_KEY) {
    Write-Host "Groq API key loaded successfully" -ForegroundColor Green
} else {
    Write-Host "Groq API key missing" -ForegroundColor Red
}

if ($env:OPENAICOMPATIBLE_API_KEY) {
    Write-Host "Local Garak key loaded"
}