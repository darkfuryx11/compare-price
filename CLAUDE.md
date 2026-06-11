# Compare Price

## จุดประสงค์
เครื่องคำนวณต้นทุนนำเข้าสินค้าจากจีน (landed cost) + ถอดราคาคู่แข่งย้อนกลับเป็นราคาจีน

## Stack
- Single-file PWA (HTML + React 18 + Babel standalone)
- Exchange rate: open.er-api.com (CNY→THB, อัปเดตทุก 24 ชม.)
- Cloudflare Pages (static deploy)
- Service Worker สำหรับ offline support

## ไฟล์หลัก
- `index.html` — ทั้งแอป (CSS + JSX inline)
- `manifest.json` — PWA manifest
- `sw.js` — Service Worker
- `icon.svg`, `icon-maskable.svg` — App icons
- `_headers` — Cloudflare cache headers

## Deploy
- Cloudflare Pages: https://compare-price.pages.dev
- GitHub: https://github.com/darkfuryx11/compare-price
- Deploy command: `npm run deploy`

## Repo
- GitHub: darkfuryx11/compare-price

## หมายเหตุ
- ไม่มี build step — deploy ตรงจาก folder ได้เลย
- อัตราแลกเปลี่ยน fetch จาก open.er-api.com ฟรี ไม่ต้องมี API key
- localStorage เก็บ rate ล่าสุดสำหรับ offline fallback
