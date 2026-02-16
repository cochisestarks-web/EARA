# EARA v1.0

**Exponential Accumulation Recovery Analysis**

A workforce physiological capacity modeling system that simulates real-time worker fatigue and recovery using the Darwish gamma framework. Single-file web app — no build step, no backend.

## Features

- **Gamma fatigue model** — continuous 0-1 index with base rate 0.00233/min, permanent burnout damage, and emergency shutdown mechanics (Darwish 2023)
- **Circadian rhythm modulation** — 24hr sine wave (peak 10 AM, trough 10 PM) based on the Borbely two-process model
- **Natural language schedule parser** — paste schedules like "Mon-Fri: 9am-5pm with 1hr lunch" and get structured shift configs with confidence scoring
- **Financial loss tracking** — productivity degradation, zombie labor hours, temporal debt from emergency shutdowns, error cost modeling, and annual projections
- **Comparison mode** — side-by-side Sprint vs Traditional schedule analysis with live metrics
- **Shareable links** — encode any custom schedule into a URL and share it
- **Physics visualization** — Matter.js canvas with color-coded worker circles reflecting real-time fatigue state
- **Interactive glossary** — collapsible reference panel defining all simulation terms

## How to Use

1. Open `index.html` in a browser (or visit the hosted version)
2. Paste a work schedule in natural language (e.g., "Mon: 9am-5pm with 1hr lunch")
3. Click **Parse Schedule** to analyze
4. Press **Start** to run the simulation and watch gamma unfold in real time
5. View financial impact, temporal debt, and worker state transitions
6. Use **Comparison Mode** to evaluate Sprint vs Traditional schedules
7. Click **Share** to generate a link to your custom schedule

## Tech Stack

- Vanilla HTML/CSS/JS (single file, ~3,500 lines)
- [Matter.js](https://brm.io/matter-js/) v0.19.0 via CDN (physics visualization)
- Netlify-ready (`_redirects` included)

## Version History

- **v1.0**: Intro section, interactive glossary, all simulation features stable
- v0.5.5: Shareable schedule links
- v0.5.4: Fixed comparison mode visibility issue
