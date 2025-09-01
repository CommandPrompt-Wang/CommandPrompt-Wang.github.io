function Show-Tree {
    param(
        [string]$Path = ".",
        [string]$Indent = ""
    )

    $items = Get-ChildItem -Path $Path | Sort-Object Name

    for ($i = 0; $i -lt $items.Count; $i++) {
        $item = $items[$i]
        $isLast = $i -eq ($items.Count - 1)

        if ($isLast) {
            $prefix = "└─"
            $newIndent = $Indent + "   "
        } else {
            $prefix = "├─"
            $newIndent = $Indent + "│  "
        }

        Write-Host ($Indent + $prefix + $item.Name) -NoNewline

        if ($item.PSIsContainer) {
            Write-Host
            Show-Tree -Path $item.FullName -Indent $newIndent
        } else {
            Write-Host
            if ($item.Extension -eq ".md") {
                $content = Get-Content -Path $item.FullName -Raw -Encoding UTF8
                $preview = $content.Substring(0, [Math]::Min(100, $content.Length))
                $preview = $preview -replace "`n", "\n" -replace "`r", "\r" -replace "`t", "\t"
                Write-Host ($Indent + "   -> " + $preview) -ForegroundColor Yellow
            }
        }
    }
}

Write-Host "开始目录树遍历：" -ForegroundColor Green
Show-Tree