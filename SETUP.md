# Setup Instructions

## Step 1: Supabase Database Setup

### Create Supabase Project

1. Go to [supabase.com](https://supabase.com)
2. Sign up / Log in
3. Click "New Project"
4. Fill in:
   - Name: `inventtrack` (or your choice)
   - Database Password: (create a strong password)
   - Region: (closest to you)
5. Click "Create new project"
6. Wait 2-3 minutes for provisioning

### Run Database Schema

1. In Supabase dashboard, go to **SQL Editor** (left sidebar)
2. Click "New query"
3. Copy and paste this SQL:

```sql
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

-- Create purchase orders table (for future use)
CREATE TABLE purchase_orders (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    po_number TEXT UNIQUE NOT NULL,
    supplier TEXT,
    notes TEXT,
    status TEXT DEFAULT 'open',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create PO items table (for future use)
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

-- Create policies (allow all for MVP - customize later)
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
```

4. Click "Run" (or press Cmd/Ctrl + Enter)
5. Should see "Success. No rows returned"

### Get Your Credentials

1. Go to **Project Settings** (gear icon, bottom left)
2. Click **API** in sidebar
3. Copy these values:

**Project URL:**
```
https://xxxxxxxxxxx.supabase.co
```

**anon public key:**
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ey...
```

4. Keep these safe - you'll need them next!

---

## Step 2: Configure the App

### Update Credentials in index.html

1. Open `index.html` in a text editor
2. Find line ~285 (search for "SUPABASE_URL"):

```javascript
const SUPABASE_URL = 'https://hlabmpfycagxdhmpiqba.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
```

3. Replace with YOUR credentials from Supabase
4. Save the file

---

## Step 3: Deploy to GitHub Pages

### Create GitHub Repository

1. Go to [github.com](https://github.com)
2. Sign up / Log in
3. Click **"+" (top right)** → **"New repository"**
4. Fill in:
   - Repository name: `inventtrack-pro` (or your choice)
   - Description: "Cloud inventory management system"
   - Public (required for free GitHub Pages)
   - Don't check "Initialize with README" (we have our own)
5. Click **"Create repository"**

### Upload Files

**Option A: Upload via Website (Easiest)**

1. On your new repo page, click **"uploading an existing file"**
2. Drag ALL these files:
   - `index.html`
   - `schema.sql`
   - `README.md`
   - `SETUP.md`
   - `GITHUB.md`
   - `CHANGELOG.md`
   - `LICENSE`
   - `FILE_STRUCTURE.md`
3. Commit message: "Initial commit - InvenTrack Pro v2.0"
4. Click **"Commit changes"**

**Option B: Use Git Command Line**

```bash
# Navigate to your folder
cd /path/to/your/inventtrack/files

# Initialize git
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit - InvenTrack Pro v2.0"

# Connect to GitHub (replace YOUR_USERNAME and REPO_NAME)
git remote add origin https://github.com/YOUR_USERNAME/inventtrack-pro.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Enable GitHub Pages

1. In your GitHub repository, click **"Settings"** (top right)
2. Scroll down left sidebar, click **"Pages"**
3. Under **"Source"**, select:
   - Branch: `main`
   - Folder: `/ (root)`
4. Click **"Save"**
5. Wait 1-2 minutes
6. Refresh the page
7. You'll see: **"Your site is live at `https://YOUR_USERNAME.github.io/inventtrack-pro/`"**

**Copy this URL - that's your app!** 🎉

### Custom Domain (Optional)

If you own a domain:

1. In GitHub Pages settings, add your domain: `inventory.yourcompany.com`
2. In your domain DNS settings, add:
   - Type: `CNAME`
   - Name: `inventory`
   - Value: `YOUR_USERNAME.github.io`
3. Wait for DNS to propagate (5-60 minutes)
4. GitHub auto-generates SSL certificate (free)

---

## Step 4: Update Your App (Future Changes)

### When you make changes:

**Option A: Via GitHub Website**
1. Go to your repository
2. Click on `index.html`
3. Click the pencil icon (Edit)
4. Make changes
5. Scroll down, add commit message
6. Click "Commit changes"
7. Changes go live in 30-60 seconds!

**Option B: Via Git**
```bash
# Edit index.html locally
# Then:
git add index.html
git commit -m "Added new feature"
git push
```

Changes automatically deploy to GitHub Pages! No separate deployment step needed.

---

## Step 5: Install on Your Phone

### iPhone (Safari)

1. Open your Netlify URL in Safari
2. Tap the **Share** button (box with arrow)
3. Scroll down, tap **"Add to Home Screen"**
4. Name it "InvenTrack"
5. Tap "Add"
6. App icon appears on home screen!

### Android (Chrome)

1. Open your Netlify URL in Chrome
2. Tap menu (three dots)
3. Tap **"Install app"** or **"Add to Home Screen"**
4. Name it "InvenTrack"
5. Tap "Add"
6. App icon appears!

---

## Step 5: Test It Out

### First Time Camera Access (Scan Count)

1. Open app
2. Menu → Scan Count
3. Tap "Take Picture"
4. Phone asks: "Allow camera access?"
5. Tap "Allow"
6. Camera opens - you're ready!

### Import Your Inventory

**Option 1: CSV Upload**
1. Menu → Import/Export
2. Prepare CSV file:
```csv
SKU,Description,Qty on Hand,Min,Max,Location
P165789,Filter Element,50,10,100,A1-B2-C3
MW2018-7615-BSK,Widget Assembly,25,5,50,B2-C3-D4
```
3. Click "Import CSV"
4. Select your file
5. Done!

**Option 2: Paste Data**
1. Copy CSV data (from Excel/Google Sheets)
2. Menu → Import/Export
3. Paste in the text box
4. Click "Import Pasted Data"
5. Done!

---

## Troubleshooting

### "No SKUs detected" when scanning
- Get closer to the label (6-12 inches)
- Use better lighting
- Make sure label is clear and straight
- Use "Type SKU Manually" as fallback

### Database connection error
- Double-check your Supabase URL and key
- Make sure you copied the FULL key (very long)
- Check that RLS policies are created

### Camera not opening
- Must use HTTPS (Netlify provides this)
- Grant camera permission when asked
- iOS: Settings → Safari → Camera → Allow

### App not installing on phone
- Must be opened in Safari (iPhone) or Chrome (Android)
- Must be HTTPS URL
- Try refreshing the page first

---

## Security Notes

**Current setup is for internal use only.**

For production with external access:
1. Enable Supabase Authentication
2. Update RLS policies to require auth
3. Add user roles (admin, counter, viewer)
4. Use environment variables for keys

---

## What's Next?

✅ You're all set! Start counting inventory!

**Tips:**
- Use Physical Count for organized shelves
- Use Scan Count for random/unsorted items
- Export reports regularly for backups
- Check Count Reports for audit trails

**Need help?** Open an issue on GitHub!
