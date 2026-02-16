# EARA Version Control Strategy

## Current Structure
```
C:\Users\derek\projects\EARA\
├── index.html              (current working version)
├── README.md
├── _redirects
├── VERSION_CONTROL.md      (this file)
└── versions\
    └── v0.5.4-stable.html  (backup of working release)
```

## Manual Version Control (Until Git is installed)

### Before Making Changes:
1. Copy `index.html` to `versions\v0.5.X-feature-name.html`
2. Work on `index.html`
3. If it breaks, copy back from versions folder

### Naming Convention:
- `v0.5.4-stable.html` - Last known working version
- `v0.6.0-temporal-debt.html` - Feature branch attempt
- `v0.6.0-temporal-debt-BACKUP.html` - Before risky changes

## Recommended Git Setup (Future)
When you install Git:
```bash
cd C:\Users\derek\projects\EARA
git init
git add .
git commit -m "Initial commit: EARA v0.5.4"
git branch develop
```

## Deployment Checklist
Before deploying to Netlify:
- [ ] Test all features work locally (open index.html in browser)
- [ ] Copy working version to versions folder
- [ ] Update version number in title tag
- [ ] Create deployment ZIP
