# Compare Price
> Living document — อัพเดทล่าสุด: 2026-06-11

## จุดประสงค์
เครื่องคำนวณต้นทุนนำเข้าสินค้าจากจีน (landed cost) + ถอดราคาคู่แข่งย้อนกลับเป็นราคาจีน

## Stack
- Single-file PWA (HTML + React 18 + Babel standalone)
- Exchange rate: open.er-api.com (CNY→THB, refresh ทุก 10 นาที)
- Cloudflare Pages (static deploy)
- Service Worker สำหรับ offline support
- Font: IBM Plex Sans Thai + IBM Plex Mono

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

## Features ที่มี
- **Login screen** — password-protected, SHA-256 hash hardcoded ใน index.html, session เก็บใน sessionStorage
- **Mode: Forward** (ราคาจีน → ไทย) — คำนวณ landed cost จากราคา CNY + ค่าธรรมเนียม
- **Mode: Reverse** (ราคาไทย → จีน) — ถอดราคาคู่แข่งย้อนกลับเป็นราคาจีน โดยใช้ margin % + ค่าธรรมเนียม
- **Rate bar** — แสดงอัตราแลกเปลี่ยน CNY/THB แบบ real-time พร้อม live dot animation
- **Fee editor** — เพิ่ม/ลบค่าใช้จ่าย (fixed หรือ %) ได้อิสระ
- **Offline fallback** — localStorage เก็บ rate ล่าสุด, Service Worker cache

## หมายเหตุ
- ไม่มี build step — deploy ตรงจาก folder ได้เลย
- อัตราแลกเปลี่ยน fetch จาก open.er-api.com ฟรี ไม่ต้องมี API key
- localStorage เก็บ rate ล่าสุดสำหรับ offline fallback

## Changelog
| Date | Changes |
|------|---------|
| 2026-06-11 | เพิ่ม Features section, แก้ exchange rate interval (24h → 10min), เพิ่ม login/auth + mode forward/reverse |
| 2026-06-11 | (git) feat: Add password login screen before app access |
| 2026-06-10 | (git) Initial PWA — landed-cost calculator with real-time CNY/THB rate |
