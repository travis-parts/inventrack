# Changelog

All notable changes to InvenTrack Pro will be documented in this file.

## [2.0.0] - 2026-02-12

### Added
- **Scan Count Feature** - OCR-based counting for random/unsorted inventory
  - Camera-based label scanning using Tesseract.js
  - On-screen keyboard with number pad
  - Smart SKU detection and matching
  - Autocomplete dropdown
  - Manual fallback for failed scans
  
- **Physical Count Feature** - Location/SKU-based counting for organized inventory
  - Sort by Location or SKU
  - Filter by location prefix
  - Large +/- buttons (no keyboard)
  - Auto-advance workflow
  - Session progress tracking
  
- **Count Reports** - View and export all count sessions
  - Timestamped sessions with variance reports
  - CSV export for QuickBooks integration
  - Historical session viewing

### Enhanced
- **On-screen Keyboard** - Custom keyboard locked to bottom of screen
  - No device keyboard pop-up
  - 25% smaller buttons for better layout
  - Fixed position (no jumping)
  - Quick-match autocomplete

- **SKU Autocomplete** - Enhanced dropdown in Add/Edit screen
  - Shows as you type (2+ characters)
  - Displays description, QOH, location
  - One-click to auto-fill form

- **Mass Delete** - Checkbox-based bulk delete in Inventory View
  - Select all checkbox
  - Delete selected button with count
  - Confirmation before deletion

### Improved
- Better error handling with detailed messages
- OCR progress indicators (0-100%)
- Loading states for all async operations
- Mobile-optimized layouts

## [1.0.0] - 2026-02-11

### Added
- **Supabase Integration** - Cloud database with multi-user sync
- **Dashboard** - Real-time stats (total items, low stock, out of stock)
- **Add/Edit Items** - Full CRUD operations
- **Inventory View** - Search, sort, filter
- **Import/Export** - CSV upload and download
- **Mobile-first Design** - Responsive layouts
- **PWA Support** - Install as mobile app

### Database Schema
- `inventory` table with SKU, description, quantities, location
- `purchase_orders` table for future PO management
- `po_items` table for PO line items
- `change_history` table for audit trail
- `receiving_history` table for receiving logs
- Row Level Security enabled
- Indexes for performance

### Technical
- Pure HTML/CSS/JavaScript (no frameworks)
- Supabase client for database
- Tesseract.js for OCR
- LocalStorage for count session caching
- Service Worker ready for PWA

---

## Version Numbering

- **Major (X.0.0)**: Breaking changes, major new features
- **Minor (1.X.0)**: New features, backward compatible
- **Patch (1.0.X)**: Bug fixes, minor improvements
