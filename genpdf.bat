@echo off

set OUTPUT_DIR=out
for /f "tokens=2 delims==." %%I in ('wmic os get localdatetime /value') do set DATETIME=%%I
set DATETIME=%DATETIME:~6,2%.%DATETIME:~4,2%.%DATETIME:~0,4%-%DATETIME:~8,2%h%DATETIME:~10,2%m%

if not exist %OUTPUT_DIR% mkdir %OUTPUT_DIR%

where md2pdf >nul 2>nul || (
    echo md2pdf is not installed. Please install it and try again.
    exit /b 1
)

where weasyprint >nul 2>nul || (
    echo weasyprint is not installed. Please install it and try again.
    exit /b 1
)

md2pdf resume.md %OUTPUT_DIR%\resume-%DATETIME%.pdf --css style.css
