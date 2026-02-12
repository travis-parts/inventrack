# InvenTrack Pro - Cloud Inventory Management System

A mobile-first, cloud-based inventory management system built for warehouse operations with real-time multi-user sync via Supabase.

## 🚀 Features

### Core Functionality
- ✅ **Dashboard** - Real-time statistics (total items, low stock, out of stock)
- ✅ **Add/Edit Items** - SKU autocomplete, location tracking, min/max levels
- ✅ **Inventory View** - Search, sort, mass delete with checkboxes
- ✅ **Import/Export** - CSV upload and download for bulk operations

### Physical Counting
- 📱 **Physical Count** - Location or SKU-based counting for organized inventory
  - Sort by Location or SKU
  - Auto-advance workflow
  - Large +/- buttons (no keyboard needed)
  - Progress tracking
  - Variance detection
  
- 📷 **Scan Count** - OCR-based counting for random/unsorted inventory
  - Camera-based label scanning (Tesseract.js OCR)
  - On-screen keyboard (no device keyboard pop-up)
  - Smart SKU detection and matching
  - Autocomplete dropdown
  - Manual fallback option

### Reporting
- 📊 **Count Reports** - View and export all count sessions
  - Timestamped sessions
  - Variance reports
  - CSV export for QuickBooks integration

## 🛠️ Tech Stack

- **Frontend:** Pure HTML/CSS/JavaScript (no frameworks)
- **Database:** Supabase (PostgreSQL)
- **OCR:** Tesseract.js
- **Hosting:** Netlify (or any static host)
- **PWA:** Install as mobile app

## 📋 Requirements

- **Supabase Account** (free tier works)
- **Netlify Account** (free tier works)
- **Modern Browser** (Chrome, Safari, Firefox)
- **HTTPS** (required for camera access)

## 🚀 Quick Start

### 1. Set Up Supabase

1. Create account at [supabase.com](https://supabase.com)
2. Create new project
3. Go to SQL Editor and run this schema:

```sql
-- Inventory table
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

-- Enable Row Level Security
ALTER TABLE inventory ENABLE ROW LEVEL SECURITY;

-- Create policy (allow all for MVP - tighten in production)
CREATE POLICY "Allow all access" ON inventory FOR ALL USING (true);

-- Create indexes
CREATE INDEX idx_inventory_sku ON inventory(sku);
CREATE INDEX idx_inventory_location ON inventory(location);
```

4. Get your project credentials:
   - Go to Project Settings → API
   - Copy `Project URL`
   - Copy `anon public` key

### 2. Configure the App

1. Open `index.html`
2. Find lines ~285-286:
```javascript
const SUPABASE_URL = 'YOUR_PROJECT_URL';
const SUPABASE_KEY = 'YOUR_ANON_KEY';
```
3. Replace with your credentials

### 3. Deploy

**Option A: Netlify (Recommended)**
1. Go to [app.netlify.com/drop](https://app.netlify.com/drop)
2. Drag and drop `index.html`
3. Done! You get a URL like `https://your-site.netlify.app`

**Option B: GitHub + Netlify Auto-Deploy**
1. Push this repo to GitHub
2. Connect Netlify to your GitHub repo
3. Auto-deploys on every push

**Option C: Any Static Host**
- Vercel, GitHub Pages, Cloudflare Pages, etc.
- Just upload `index.html`

### 4. Install as PWA (Mobile)

**iPhone:**
1. Open site in Safari
2. Tap Share button
3. "Add to Home Screen"

**Android:**
1. Open site in Chrome
2. Tap menu (⋮)
3. "Install app"

## 📱 Usage

### Physical Count (Organized Inventory)
1. Menu → Physical Count
2. Choose sort order (Location or SKU)
3. Optional: Filter by location prefix
4. Walk down aisle, count each item
5. Finish → Export to CSV

### Scan Count (Random Inventory)
1. Menu → Scan Count
2. Start session
3. Take photo of label OR type SKU manually
4. Count using +/- buttons
5. Repeat for each item
6. Finish → Export to CSV

### Import Items
1. Menu → Import/Export
2. Upload CSV or paste data
3. Format: `SKU, Description, Qty, Min, Max, Location`

## 🔒 Security Notes

**Current Setup (MVP):**
- Row Level Security enabled but permissive
- Anyone with the URL can access data
- Suitable for internal warehouse use

**For Production:**
- Enable Supabase Authentication
- Implement user roles
- Add API rate limiting
- Use environment variables for keys

## 📊 Data Export

All count sessions export to CSV with format:
```csv
SKU, Description, Location, System Qty, Actual Qty, Variance, Counted At
```

Perfect for importing into:
- QuickBooks
- Excel
- Google Sheets
- Any accounting software

## 🐛 Troubleshooting

**Camera not working:**
- Must be HTTPS (Netlify provides this)
- Grant camera permission in browser
- iOS: Settings → Safari → Camera access

**OCR not detecting SKUs:**
- Hold phone 6-12" from label
- Ensure good lighting
- Keep label straight (not angled)
- Use manual entry as fallback

**Database connection errors:**
- Check Supabase credentials
- Verify RLS policies are enabled
- Check browser console for errors

## 📝 License

MIT License - Free to use and modify

## 🤝 Contributing

This is a working warehouse solution. Feel free to:
- Fork and customize
- Report issues
- Submit pull requests
- Share improvements

## 💡 Future Enhancements

Potential features to add:
- Barcode scanner integration
- User authentication
- Purchase order management
- Label printing
- Low stock alerts
- Analytics dashboard
- Multi-warehouse support

## 📧 Support

For issues or questions, open a GitHub issue.

---

**Built for real warehouse operations. Battle-tested in production.** 📦
