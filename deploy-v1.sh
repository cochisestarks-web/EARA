#!/bin/bash
# ============================================================
# EARA v1.0 GitHub Deployment Script
# Author: Derek Loa
# Date: 2026-02-14
# Usage: bash deploy-v1.sh
# ============================================================

set -e  # Exit immediately if a command fails

echo ""
echo "========================================"
echo "  EARA v1.0 Deployment"
echo "  Entropy-Aware Resource Allocation"
echo "========================================"
echo ""

# ----------------------------------------------------------
# PRE-FLIGHT CHECKS
# ----------------------------------------------------------

# Verify we're in a git repository
if [ ! -d ".git" ]; then
    echo "ERROR: Not in a git repository."
    echo "  Please cd into your EARA repository first."
    echo "  Example: cd ~/EARA"
    exit 1
fi

# Verify remote matches expected repository
REMOTE=$(git remote get-url origin 2>/dev/null || echo "none")
if [[ "$REMOTE" == "none" ]]; then
    echo "ERROR: No git remote 'origin' configured."
    echo "  Run: git remote add origin https://github.com/cochisestarks-web/EARA.git"
    exit 1
fi

if [[ ! "$REMOTE" == *"cochisestarks-web/EARA"* ]]; then
    echo "WARNING: Remote doesn't match expected repository."
    echo "  Current remote: $REMOTE"
    echo "  Expected: github.com/cochisestarks-web/EARA"
    read -p "  Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Deployment cancelled."
        exit 1
    fi
fi

# Verify deployment files exist
DEPLOY_DIR="$HOME/EARA-deploy"
if [ ! -f "$DEPLOY_DIR/index.html" ]; then
    echo "ERROR: index.html not found in $DEPLOY_DIR"
    echo "  Ensure your v1.0 files are in ~/EARA-deploy/"
    exit 1
fi

echo "Pre-flight checks passed."
echo ""

# ----------------------------------------------------------
# STEP 1: ARCHIVE PREVIOUS VERSION
# ----------------------------------------------------------

echo "Step 1/6: Archiving previous version..."

if [ -f "index.html" ]; then
    mkdir -p archive
    if git ls-files --error-unmatch index.html &>/dev/null; then
        git mv index.html archive/index-v0.4-circadian.html
        echo "  v0.4 archived to archive/index-v0.4-circadian.html"
    else
        mv index.html archive/index-v0.4-circadian.html
        echo "  v0.4 archived (untracked file)"
    fi
else
    echo "  No existing index.html found (fresh deployment)"
fi

echo ""

# ----------------------------------------------------------
# STEP 2: COPY v1.0 FILES
# ----------------------------------------------------------

echo "Step 2/6: Adding v1.0 files..."

cp "$DEPLOY_DIR/index.html" .
echo "  Copied index.html"

cp "$DEPLOY_DIR/README.md" .
echo "  Copied README.md"

cp "$DEPLOY_DIR/CHANGELOG.md" .
echo "  Copied CHANGELOG.md"

if [ -f "$DEPLOY_DIR/_redirects" ]; then
    cp "$DEPLOY_DIR/_redirects" .
    echo "  Copied _redirects"
fi

echo ""

# ----------------------------------------------------------
# STEP 3: STAGE CHANGES
# ----------------------------------------------------------

echo "Step 3/6: Staging changes..."

git add index.html README.md CHANGELOG.md
[ -f _redirects ] && git add _redirects
[ -d archive ] && git add archive/

echo ""
echo "  Staged files:"
git status --short
echo ""

# ----------------------------------------------------------
# STEP 4: CREATE COMMIT
# ----------------------------------------------------------

echo "Step 4/6: Creating commit..."

git commit -m "Release: EARA v1.0 - Workforce Analytics Simulation

Major production release transitioning from research validation to deployment.

NEW FEATURES (v0.4 -> v1.0):
- Natural language schedule parser with 91-100% confidence scoring
- Multi-worker physics simulation (8 workers, Matter.js engine)
- Temporal debt tracking (emergency vs scheduled shutdowns)
- Financial dashboard modeling \$400K-\$1.2M annual capacity losses
- Multi-day simulation support for rotating schedules
- Schedule comparison mode (sprint vs traditional side-by-side)

IMPROVEMENTS:
- Renamed: Employee Activity Rhythm Analyzer -> Workforce Analytics Simulation
- Rebranded: HIGH-OCTANE research -> EARA production system
- Enhanced: Circadian rhythm visualization prominence
- Integrated: Financial modeling into main dashboard

VALIDATION:
- Darwish (2023) mathematical precision (MAE = 0.000000)
- Cross-LLM research validation (ChatGPT, Gemini, Grok, Perplexity)
- 20 years retail management domain expertise
- Peer-reviewed source grounding (Borbely, Enoka & Behrens)

TECHNICAL:
- Single-file architecture
- Zero build dependencies
- GitHub Pages ready
- Matter.js 0.19.0 physics engine
- Vanilla JavaScript ES6+

BREAKING CHANGES:
- v0.4 moved to /archive folder
- Version numbering: v0.5.x development -> v1.0 production

This release closes the research validation phase and opens the
deployment phase. EARA is now production-ready for workforce
analytics, policy research, and AI safety demonstrations."

echo "  Commit created."
echo ""

# ----------------------------------------------------------
# STEP 5: CREATE VERSION TAG
# ----------------------------------------------------------

echo "Step 5/6: Creating version tag..."

git tag -a v1.0.0 -m "EARA v1.0.0 - Production Release

First stable public release of Entropy-Aware Resource Allocation.

Key Features:
- Schedule parser, multi-worker simulation, temporal debt tracking
- Financial modeling, circadian integration, risk translation
- Research-validated, production-ready, zero dependencies

Target Audience:
- Workforce technology researchers
- Labor policy analysts
- AI safety researchers
- Retail/operations managers

Validated against: Darwish 2023, Borbely 1982, Enoka & Behrens 2023
Cross-verified by: ChatGPT, Claude, Gemini, Grok, Perplexity"

echo "  Tag v1.0.0 created."
echo ""

# ----------------------------------------------------------
# STEP 6: PUSH TO GITHUB
# ----------------------------------------------------------

echo "Step 6/6: Pushing to GitHub..."

echo "  Pushing main branch..."
git push origin main

echo "  Pushing tags..."
git push origin v1.0.0

echo ""

# ----------------------------------------------------------
# DEPLOYMENT COMPLETE
# ----------------------------------------------------------

echo "========================================"
echo "  DEPLOYMENT COMPLETE"
echo "========================================"
echo ""
echo "Next Steps:"
echo "  1. Wait ~30 seconds for GitHub Pages to rebuild"
echo "  2. Visit: https://cochisestarks-web.github.io/EARA/"
echo "  3. Test schedule parser and run simulation"
echo "  4. Take screenshots for social media"
echo "  5. Write Medium article using outline"
echo "  6. Share on LinkedIn"
echo ""
echo "Verify deployment:"
echo "  curl -s -o /dev/null -w '%{http_code}' https://cochisestarks-web.github.io/EARA/"
echo ""
echo "EARA v1.0 is now live."
