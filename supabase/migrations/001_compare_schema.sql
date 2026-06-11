-- compare_products: saved import-cost calculations per product
-- Run in Supabase SQL Editor once before first use

CREATE TABLE IF NOT EXISTS compare_products (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name        TEXT NOT NULL,
  mode        TEXT DEFAULT 'fwd' CHECK (mode IN ('fwd','rev')),
  inputs      JSONB NOT NULL DEFAULT '{}',
  fees        JSONB NOT NULL DEFAULT '[]',
  preview     JSONB NOT NULL DEFAULT '{}',
  created_by  TEXT,
  created_at  TIMESTAMPTZ DEFAULT now(),
  updated_at  TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_compare_products_created_by ON compare_products(created_by);
CREATE INDEX IF NOT EXISTS idx_compare_products_updated_at ON compare_products(updated_at DESC);

CREATE TRIGGER trg_compare_products_updated_at
  BEFORE UPDATE ON compare_products
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

ALTER TABLE compare_products ENABLE ROW LEVEL SECURITY;

CREATE POLICY "compare_products_select" ON compare_products
  FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "compare_products_write" ON compare_products FOR ALL
  USING (auth.role() = 'authenticated')
  WITH CHECK (auth.role() = 'authenticated');
