-- ROLLBACK: ลบ compare tables ทั้งหมด
-- รันเฉพาะเมื่อต้องการ rollback การ integrate Compare module

DROP TABLE IF EXISTS compare_products CASCADE;
