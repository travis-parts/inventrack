# Quick GitHub Setup

## First Time Setup

### 1. Create GitHub Repository

1. Go to [github.com](https://github.com)
2. Click "+" → "New repository"
3. Name: `inventtrack-pro` (or your choice)
4. Description: "Cloud-based inventory management system"
5. Public or Private (your choice)
6. Don't initialize with README (we have our own)
7. Click "Create repository"

### 2. Upload Files to GitHub

**Option A: Using GitHub Website (Easiest)**

1. On your new repo page, click "uploading an existing file"
2. Drag ALL these files:
   - `index.html`
   - `README.md`
   - `SETUP.md`
   - `CHANGELOG.md`
   - `LICENSE`
   - `schema.sql`
   - `.gitignore`
3. Commit message: "Initial commit - InvenTrack Pro v2.0"
4. Click "Commit changes"
5. Done!

**Option B: Using Git Command Line**

```bash
# Navigate to your folder
cd /path/to/your/inventtrack/files

# Initialize git
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

## Connect GitHub to Netlify (Auto-Deploy)

### Benefits:
- Edit `index.html` → Push to GitHub → Auto-deploys to Netlify
- No more manual uploads
- Version control for all changes
- Easy rollback if something breaks

### Setup:

1. Go to [app.netlify.com](https://app.netlify.com)
2. Click "Add new site" → "Import an existing project"
3. Choose "Deploy with GitHub"
4. Authorize Netlify to access GitHub
5. Select your `inventtrack-pro` repository
6. Build settings:
   - Base directory: (leave blank)
   - Build command: (leave blank)
   - Publish directory: (leave blank or `/`)
7. Click "Deploy site"
8. Wait 30 seconds
9. Done! You get a URL

### Custom Domain (Optional):

1. In Netlify, go to "Domain settings"
2. Click "Add custom domain"
3. Enter your domain: `inventory.yourcompany.com`
4. Follow DNS instructions
5. SSL certificate auto-generates (free)

---

## Future Updates Workflow

### After GitHub + Netlify are connected:

**To update your app:**

1. Edit `index.html` locally
2. Commit changes:
   ```bash
   git add index.html
   git commit -m "Added new feature"
   git push
   ```
3. Netlify auto-deploys (30 seconds)
4. Changes live!

**No more manual uploads!** 🎉

---

## Updating Your Supabase Credentials

**IMPORTANT:** Never commit real credentials to public GitHub!

### Best Practice:

**For Public Repos:**
1. Keep credentials in `index.html`
2. Add a note in README: "Update SUPABASE_URL and SUPABASE_KEY before deploying"
3. Users configure their own database

**For Private Repos (Your Own Use):**
- You can commit your credentials safely
- Only you can see them

**Production Setup (Advanced):**
1. Use Netlify Environment Variables
2. Store credentials in Netlify dashboard
3. Reference via build process
4. Requires build step (more complex)

---

## Need Help?

- GitHub Help: https://docs.github.com
- Netlify Docs: https://docs.netlify.com
- Issues? Open an issue on your repo!

---

## Quick Commands Reference

```bash
# Check status
git status

# Add files
git add .

# Commit
git commit -m "Your message"

# Push to GitHub
git push

# Pull latest changes
git pull

# See commit history
git log

# Create new branch
git checkout -b feature-name

# Switch branches
git checkout main
```

That's it! You're ready to go! 🚀
