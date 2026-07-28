# Aging Table — Power BI dataset

Alwood Aging Table pipeline chiqargan `PowerBI template.xlsx` faylini saqlash uchun private repo.
Power BI Desktop bu faylni **raw link** orqali oladi va yangilanishlar avtomatik chekiladi.

## Fayl
- `PowerBI template.xlsx` — star schema (Dim_* / Fact_*) sheetlari. `main.py` (Google Drive'dagi loyiha) chiqarib beradi.

## Yangilash tartibi
Google Drive'dagi loyihada (`G:\My Drive\Alwood\Financial statements\Aging table\`) pipeline'ni ishga tushirgach:

```powershell
& "C:\Users\user\projects\Aging_Table\push_to_github.bat"
```

Skript:
1. Google Drive'dan yangi `PowerBI template.xlsx` ni shu katalogga copy qiladi
2. `git add`, `git commit` (timestamp bilan), `git push` bajaradi

## Power BI ulash (raw link)
URL:
```
https://raw.githubusercontent.com/Furqatbek-Alisherovich/Aging_Table/main/PowerBI%20template.xlsx
```

**Private repo bo'lgani uchun autentifikatsiya kerak.**

Power BI Desktop → **Get Data → Web → Advanced**:
- URL parts: yuqoridagi manzil
- HTTP request header parameters:
  - Name: `Authorization`
  - Value: `token <PAT>` (Personal Access Token)

Yoki oddiy Basic Auth: username = GitHub username, password = PAT.

PAT yaratish: GitHub → Settings → Developer settings → Personal access tokens → **Fine-grained** → repo `Aging_Table` → ruxsat: `Contents: Read-only`.

## Xavfsizlik
- PAT'ni hech qachon repo ichiga, kodga, logga yozmang.
- Faqat Power BI Desktop / Windows Credential Manager ichida saqlang.
- Shubha bo'lsa — GitHub'da PAT'ni revoke qilib yangisini yarating.
