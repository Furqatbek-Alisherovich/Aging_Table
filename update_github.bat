@echo off
setlocal
chcp 65001 >nul

rem PowerBI template.xlsx ni Google Drive'dan olib GitHub private repoga yangilaydi.
rem Birinchi ishga tushirilganda GitHub username + PAT so'raladi (browser oynasi ochilishi mumkin).
rem Windows Credential Manager parolni saqlaydi.

set "REPO_DIR=%~dp0"
set "SOURCE=G:\My Drive\Alwood\Financial statements\Aging table\Output\PowerBI template.xlsx"
set "TARGET=%REPO_DIR%PowerBI template.xlsx"

echo === [1/4] Manba faylni tekshirish ===
if not exist "%SOURCE%" (
    echo XATO: Manba fayl topilmadi: %SOURCE%
    echo Avval pipeline ishga tushirilishi kerak.
    pause
    exit /b 1
)

echo === [2/4] Yangi faylni ko'chirish ===
copy /Y "%SOURCE%" "%TARGET%" >nul
if errorlevel 1 (
    echo XATO: Faylni ko'chirib bo'lmadi.
    pause
    exit /b 1
)

cd /d "%REPO_DIR%"

echo === [3/4] Git status ===
git status --short

echo === [4/4] Git add / commit / upload ===
git add "PowerBI template.xlsx"

for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set "DATE_STR=%%c-%%a-%%b"
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set "TIME_STR=%%a:%%b"
set "MSG=Update PowerBI template.xlsx %DATE_STR% %TIME_STR%"

git commit -m "%MSG%"
if errorlevel 1 (
    echo O'zgarish yo'q yoki commit muvaffaqiyatsiz.
    pause
    exit /b 0
)

git push
if errorlevel 1 (
    echo.
    echo Yuklash muvaffaqiyatsiz. Sabablar:
    echo  - Birinchi marta: GitHub login oynasini yopmagansizmi?
    echo  - Autentifikatsiya: username = Furqatbek-Alisherovich, parol o'rniga GitHub PAT.
    echo  - Internet ulanish yo'q.
    pause
    exit /b 1
)

echo.
echo Muvaffaqiyat! GitHub'da yangilandi:
echo https://github.com/Furqatbek-Alisherovich/Aging_Table
endlocal
