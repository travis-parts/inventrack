# GitHub Pages Setup & Workflow

## Why GitHub Pages?

✅ **Free hosting** - No cost, ever  
✅ **No separate deployment** - Push to GitHub = instant deploy  
✅ **HTTPS included** - Free SSL certificate  
✅ **No build process** - Just HTML/CSS/JS  
✅ **Version control** - All changes tracked  
✅ **Easy updates** - Edit and push  

---

## First Time Setup

### 1. Create GitHub Repository

1. Go to [github.com](https://github.com)
2. Click **"+"** → **"New repository"**
3. Settings:
   - **Name:** `inventtrack-pro` (or your choice)
   - **Description:** "Cloud-based inventory management system"
   - **Visibility:** Public (required for free GitHub Pages)
   - **Don't check** "Initialize with README"
4. Click **"Create repository"**

---

### 2. Upload Your Files

**Method A: Via Website (Easiest - No Git Knowledge Needed)**

1. On your new empty repo page, click **"uploading an existing file"**
2. Drag these files from your computer:
   ```
   ✅ index.html
   ✅ schema.sql
   ✅ README.md
   ✅ SETUP.md
   ✅ GITHUB.md
   ✅ CHANGELOG.md
   ✅ LICENSE
   ✅ FILE_STRUCTURE.md
   ```
3. Commit message: `Initial commit - InvenTrack Pro v2.0`
4. Click **"Commit changes"**

**Method B: Via Git Command Line**

```bash
# Navigate to folder with your files
cd /path/to/inventtrack/files

# Initialize git repository
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit - InvenTrack Pro v2.0"

# Connect to GitHub (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/inventtrack-pro.git

# Push to GitHub
git branch -M main
git push -u origin main
```

---

### 3. Enable GitHub Pages

1. In your repository, click **"Settings"** (top menu)
2. Left sidebar → scroll to **"Pages"**
3. Under **"Build and deployment"**:
   - **Source:** Deploy from a branch
   - **Branch:** `main`
   - **Folder:** `/ (root)`
4. Click **"Save"**
5. **Wait 1-2 minutes** (GitHub is building your site)
6. **Refresh the page**
7. You'll see: 
   ```
   ✅ Your site is live at https://YOUR_USERNAME.github.io/inventtrack-pro/
   ```

**Copy this URL! This is your live app!** 🎉

---

### 4. Configure Your App

**IMPORTANT:** Update Supabase credentials before using:

1. In your GitHub repo, click `index.html`
2. Click the **pencil icon** (Edit)
3. Find line ~285:
   ```javascript
   const SUPABASE_URL = 'YOUR_PROJECT_URL';
   const SUPABASE_KEY = 'YOUR_ANON_KEY';
   ```
4. Replace with your Supabase credentials
5. Scroll down, commit message: `Updated Supabase credentials`
6. Click **"Commit changes"**
7. **Wait 30-60 seconds** for changes to deploy
8. Refresh your GitHub Pages URL - app is live!

---

## Daily Workflow (Making Updates)

### Scenario: You want to add a new feature

**Option 1: Edit on GitHub Website**

1. Go to your repository on GitHub
2. Click the file you want to edit (usually `index.html`)
3. Click the **pencil icon** (Edit this file)
4. Make your changes
5. Scroll to bottom:
   - Commit message: `Added feature X`
   - Click **"Commit changes"**
6. **Changes go live automatically in 30-60 seconds!**

**Option 2: Edit Locally with Git**

```bash
# Pull latest changes
git pull

# Edit files locally (use your favorite editor)
# ...make changes to index.html...

# Check what changed
git status

# Add changes
git add index.html

# Commit with message
git commit -m "Added feature X"

# Push to GitHub
git push

# Changes automatically deploy to GitHub Pages!
```

---

## Git Commands Reference

```bash
# Check current status
git status

# See what changed
git diff

# Add specific file
git add index.html

# Add all changed files
git add .

# Commit with message
git commit -m "Your descriptive message"

# Push to GitHub (deploys automatically)
git push

# Pull latest changes from GitHub
git pull

# View commit history
git log

# View commit history (one line per commit)
git log --oneline

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Discard all local changes
git reset --hard HEAD
```

---

## Branching (For Bigger Features)

When working on a big feature, use branches:

```bash
# Create new branch
git checkout -b feature-barcode-scanner

# Work on your feature, commit as you go
git add .
git commit -m "Work in progress"

# Push branch to GitHub
git push -u origin feature-barcode-scanner

# When done, merge back to main
git checkout main
git merge feature-barcode-scanner
git push

# Delete branch (cleanup)
git branch -d feature-barcode-scanner
git push origin --delete feature-barcode-scanner
```

---

## Custom Domain Setup (Optional)

### If you own a domain:

**In GitHub:**
1. Settings → Pages → Custom domain
2. Enter: `inventory.yourcompany.com`
3. Click **"Save"**

**In your Domain DNS:**
1. Go to your domain registrar (GoDaddy, Namecheap, etc.)
2. Add DNS record:
   - **Type:** `CNAME`
   - **Name:** `inventory`
   - **Value:** `YOUR_USERNAME.github.io`
   - **TTL:** 3600 (or default)
3. **Save**
4. **Wait 5-60 minutes** for DNS propagation
5. GitHub auto-generates free SSL certificate
6. Your app is now at: `https://inventory.yourcompany.com`

---

## Troubleshooting

### "404 - Site not found"
- Wait 2-3 minutes after enabling Pages
- Check Settings → Pages to verify it's enabled
- Make sure `index.html` is in root (not in a folder)
- Repository must be Public

### "Changes not showing"
- GitHub Pages can take 30-60 seconds to update
- Hard refresh: `Ctrl+Shift+R` (Windows) or `Cmd+Shift+R` (Mac)
- Check your commit actually pushed: `git log`
- Try incognito/private window to avoid cache

### "Camera not working"
- GitHub Pages uses HTTPS automatically ✅
- Make sure you granted camera permission
- Try a different browser

### "Database connection error"
- Check your Supabase credentials in `index.html`
- Make sure you updated from `YOUR_PROJECT_URL` to actual URL
- Verify Supabase project is running

---

## GitHub Pages Limits

✅ **Bandwidth:** 100GB/month (plenty for your use)  
✅ **Storage:** 1GB (your app is 119KB, so no problem)  
✅ **Build time:** 10 minutes (you don't use builds)  
✅ **Files:** No limit on number  

**You're well within limits!**

---

## Best Practices

### Commit Messages

**Good:**
- `Fixed keyboard layout in scan count`
- `Added OCR progress indicator`
- `Updated documentation`

**Bad:**
- `fix`
- `update`
- `changes`

### Commit Often

Instead of one huge commit:
```bash
git commit -m "Added scan feature"
git commit -m "Fixed OCR timeout"
git commit -m "Improved error messages"
```

### Use .gitignore

Already included! Prevents committing:
- `node_modules/`
- `.env` files
- Editor configs
- OS junk files

---

## Backup Strategy

GitHub IS your backup! But also:

1. **Clone to multiple machines:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/inventtrack-pro.git
   ```

2. **Export releases:**
   - GitHub → Releases → Create new release
   - Tag version: `v2.0.0`
   - Upload `index.html` as attachment

3. **Download repo as ZIP:**
   - GitHub repo → Code → Download ZIP
   - Store somewhere safe

---

## You're All Set! 🎉

**Your workflow is now:**

1. Edit `index.html` (on GitHub or locally)
2. Commit changes
3. Push to GitHub (if local)
4. **Changes go live automatically!**

**No Netlify, no builds, no complexity!**

Just GitHub + GitHub Pages = Simple and Free! ✨
