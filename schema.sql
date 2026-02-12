-- InvenTrack Pro Database Schema
-- Run this in Supabase SQL Editor

-- Create inventory table
CREATE TABLE inventory (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sku TEXT UNIQUE NOT NULL,
    description TEXT,
    qty_on_hand INTEGER DEFAULT 0,
    stock_min INTEGER,
    stock_max INTEGER,
    location TEXT,
    order_qty INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create purchase orders table
CREATE TABLE purchase_orders (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    po_number TEXT UNIQUE NOT NULL,
    supplier TEXT,
    notes TEXT,
    status TEXT DEFAULT 'open',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create PO items table
CREATE TABLE po_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    po_id UUID REFERENCES purchase_orders(id) ON DELETE CASCADE,
    sku TEXT NOT NULL,
    description TEXT,
    location TEXT,
    ordered INTEGER DEFAULT 0,
    received INTEGER DEFAULT 0,
    backorder INTEGER DEFAULT 0
);

-- Create change history table
CREATE TABLE change_history (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sku TEXT NOT NULL,
    action TEXT,
    field TEXT,
    old_value TEXT,
    new_value TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create receiving history table
CREATE TABLE receiving_history (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sku TEXT NOT NULL,
    description TEXT,
    qty INTEGER,
    po_number TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE inventory ENABLE ROW LEVEL SECURITY;
ALTER TABLE purchase_orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE po_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE change_history ENABLE ROW LEVEL SECURITY;
ALTER TABLE receiving_history ENABLE ROW LEVEL SECURITY;

-- Create policies (allow all for MVP - customize for production)
CREATE POLICY "Allow all inventory access" ON inventory FOR ALL USING (true);
CREATE POLICY "Allow all PO access" ON purchase_orders FOR ALL USING (true);
CREATE POLICY "Allow all PO items access" ON po_items FOR ALL USING (true);
CREATE POLICY "Allow all history access" ON change_history FOR ALL USING (true);
CREATE POLICY "Allow all receiving access" ON receiving_history FOR ALL USING (true);

-- Create indexes for performance
CREATE INDEX idx_inventory_sku ON inventory(sku);
CREATE INDEX idx_inventory_location ON inventory(location);
CREATE INDEX idx_po_number ON purchase_orders(po_number);
CREATE INDEX idx_change_history_sku ON change_history(sku);
CREATE INDEX idx_receiving_history_sku ON receiving_history(sku);

-- Sample data (optional - remove in production)
-- INSERT INTO inventory (sku, description, qty_on_hand, stock_min, stock_max, location) VALUES
-- ('P165789', 'Filter Element', 50, 10, 100, 'A1-B2-C3'),
-- ('MW2018-7615-BSK', 'Widget Assembly', 25, 5, 50, 'B2-C3-D4'),
-- ('GH123A-456', 'Gasket Housing', 100, 20, 200, 'C3-D4-E5');
