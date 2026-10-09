# 5 Minute Download Bar Script
# Duration: 300 seconds (5 minutes)

$totalSeconds = 300
$updateInterval = 1  # Update every second

Write-Host "`n Starting Download...`n" -ForegroundColor Cyan

for ($elapsed = 0; $elapsed -le $totalSeconds; $elapsed++) {
    # Calculate percentage
    $percent = [math]::Round(($elapsed / $totalSeconds) * 100, 0)
    
    # Build the bar (40 characters wide)
    $barWidth = 40
    $filled = [math]::Floor(($percent / 100) * $barWidth)
    $empty = $barWidth - $filled
    
    $bar = ("#" * $filled) + ("-" * $empty)
    
    # Calculate remaining time
    $remaining = $totalSeconds - $elapsed
    $minLeft = [math]::Floor($remaining / 60)
    $secLeft = $remaining % 60
    
    # Display the bar
    Write-Host ("`r  [{0}] {1,3}%  |  Time left: {2:00}:{3:00} " -f $bar, $percent, $minLeft, $secLeft) -NoNewline -ForegroundColor Green
    
    # Wait before next update
    if ($elapsed -lt $totalSeconds) {
        Start-Sleep -Seconds $updateInterval
    }
}

Write-Host "`n`n Download Complete!`n" -ForegroundColor Yellow