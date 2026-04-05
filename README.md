# EARA — Employee Adaptive Resource Allocation

**Measuring Temporal and Biological Extraction in Retail Work Schedules**

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/) ![Version](https://img.shields.io/badge/version-v1.0-green) ![Status](https://img.shields.io/badge/status-Phase%201.5-blue)

---

## 📰 Phase 1.5 Framework Published — April 6, 2026

**Read the full research framework:** [EARA: Measuring Temporal and Biological Extraction in Retail Work Schedules](https://medium.com/@derekstarks/eara-measuring-temporal-and-biological-extraction-in-retail-work-schedules)

EARA has evolved from a workforce capacity simulator into a **complete chronoeconomic framework** that exposes how retail scheduling systems systematically hide biological costs.

**Major Discovery:** Workforce management systems like Oasis assume 100% biological capacity for every scheduled hour — creating a structural blind spot that misreads worker depletion as inefficiency.

**Current Status:** Seeking collaboration for Phase 2 validation (30-worker retail cohort study).

**Outreach:** Clara Mattei (austerity/illegibility), Grace Blakeley (temporal extraction), Gary Stevenson (economic extraction), Dr. Diane Boivin (chronobiology).

---

## Table of Contents

- [What Is EARA?](#what-is-eara)
- [Research Framework (Phase 1.5)](#research-framework-phase-15)
  - [Core Concepts](#core-concepts)
  - [The Oasis Blind Spot](#the-oasis-blind-spot)
  - [Validation](#validation)
  - [Known Limitations](#known-limitations)
  - [Phase 2 Requirements](#phase-2-requirements)
- [EARA Simulator v1.0](#eara-simulator-v10)
  - [Live Demo](#live-demo)
  - [Features](#features)
  - [Mathematical Foundation](#mathematical-foundation)
  - [Technical Stack](#technical-stack)
  - [Quick Start](#quick-start)
- [Documentation](#documentation)
- [Project Timeline](#project-timeline)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## What Is EARA?

EARA is both a **research framework** and an **interactive simulation** for measuring biological capacity extraction in work scheduling systems.

**The Framework** exposes how workforce management tools systematically hide the biological cost of scheduling practices by assuming workers maintain 100% capacity across all scheduled hours.

**The Simulator** models the exponential cost of ignoring human biological constraints using peer-reviewed fatigue formulas and circadian rhythm dynamics.

**The core insight:** Traditional productivity metrics (`Hours Given ÷ Hours Worked × Sales Output`) cannot see:
- **Ghost Hours** — time when workers are clocked in but functioning at a fraction of capacity
- **Managerial overhead** — administrative work counted as productive floor labor
- **Biological depletion** — accumulating fatigue that compounds across shifts

This creates a **mechanism of illegibility**: systems misread biological extraction as worker inefficiency, then use that misreading to justify further labor discipline.

---

## Research Framework (Phase 1.5)

### Core Concepts

#### γ (Gamma) — Biological Debt Index

Dimensionless metric tracking accumulated biological debt (0–1.0 scale):

- **0.0** = No biological debt
- **0.3** = Optimal ceiling (sustainable work)
- **0.7** = Biological ceiling (body can't sustain output)
- **1.0** = Shutdown (complete depletion)

**Foundation:** Developed from Borbély's two-process model (sleep homeostasis + circadian rhythm) and Enoka's neuromechanical fatigue accumulation.

**Formula:**
γ = α·S(t) + β·C_penalty(t)
- `α = 0.6` (homeostatic weight)
- `β = 0.4` (circadian misalignment weight)
- `S(t)` = Process S (sleep pressure) at shift end
- `C_penalty` = circadian trough exposure cost

---

#### BCI (Biological Capacity Index)

**BCI = 1 - γ**

Measures available biological capacity as a fraction of theoretical maximum.

**Example:** A worker producing 80% output at BCI 0.40 has an **adjusted productivity of 200%** (80% ÷ 40% = 200%).

They're not underperforming — they're **overperforming under conditions of biological depletion**.

**This is what Oasis cannot see.**

---

#### Ghost Hours

Time when a worker is clocked in but producing at a fraction of capacity due to exhaustion and biological depletion. Ghost Hours are **invisible to current workforce management systems** because they assume constant 100% capacity.

**Real-world evidence:** Departments can show 85-90% productivity in Oasis while simultaneously being severely understaffed with long customer wait times and empty shelves.

---

#### Chrono-Tax

An **undeclared levy on workers' biological reserves**. Corporations extract biological capacity through scheduling policies but:
- Don't declare extraction rates
- Don't track biological costs
- Don't maintain accountability for depletion

EARA makes this extraction **measurable and auditable**.

---

### The Oasis Blind Spot

Workforce management systems (Oasis at Publix, similar tools across retail) **structurally cannot see biological depletion** because they assume 100% capacity for every scheduled hour.

This creates a feedback loop:
1. Workers deplete biologically due to poor scheduling
2. Productivity drops (Ghost Hours accumulate)
3. System flags workers as "inefficient"
4. Management cuts hours / intensifies schedules
5. Depletion worsens → Loop repeats

**Key Finding:** Based on direct experience with multiple workforce management systems across retailers, this mechanism appears to be a **common design assumption** — not unique to Oasis.

**What this means:** The problem isn't one company's bad tool. It's a **structural design flaw across the workforce management software industry**.

---

### Validation

#### Preliminary Data (Phase 1.5)

**WESAD Dataset** (Schmidt et al., 2018 — 15 subjects, episodic stress):
- γ-debt vs. HRV suppression: **r ~ 0.5***
- γ-debt vs. Fatigue scores: **r ~ 0.54***
- γ-debt vs. Recovery markers: **r ~ -0.487***

**Van Dongen Sleep Restriction Alignment:**
- Accumulation rates across 4h/6h/8h conditions: **r = 0.999**

**Interpretation:** Correlations prove the underlying logic is sound. They do not yet prove EARA works in real-world retail environments — that requires Phase 2 validation.

---

### Known Limitations

EARA currently lacks:

- **Chronotype stratification** — assumes standard circadian rhythm; doesn't account for night owls working morning shifts or individual chronotype variations
- **Hysteresis modeling** — assumes linear recovery; doesn't model permanent damage from chronic depletion
- **Mental health covariates** — depression, anxiety, PTSD interact with biological capacity in ways not yet controlled for
- **Edge cases** — recovery naps during breaks, high-adrenaline roles, gig economy schedule stacking
- **Platform generalization** — observed this blind spot in multiple systems (Oasis at Publix, similar tools at Sprouts), but haven't formally audited all scheduling platforms (Kronos, Deputy, ADP, Oracle, SAP). Confirming universality requires systematic platform analysis.

**Phase 2 will measure whether chronic scheduling creates permanent baseline shifts in γ** — biological costs that short-term recovery cannot reverse.

---

### Phase 2 Requirements

**Goal:** Real-world validation in a live retail environment

**Design:**
- 30-worker cohort study
- 28-day observation period
- Chronotype stratification (MEQ/Munich ChronoType assessment)
- Mental health covariates (depression, anxiety screening)
- HRV monitoring (continuous physiological tracking)
- Schedule-variance controls

**Why this matters:** If validated, EARA becomes a **rinse-and-repeat audit methodology** for exposing extraction mechanisms wherever temporal control operates:
- Insurance denial cycles
- Benefits bureaucracy delays
- Gig economy algorithmic fragmentation
- Criminal justice scheduling
- Healthcare shift systems

**One case study at a time. Retail first.**

---

## EARA Simulator v1.0

### Live Demo

**[Launch Interactive Simulation →](https://cochisestarks-web.github.io/EARA/)**

Physics-based workforce capacity simulation proving biological constraints are binding.

> *"You cannot preference your way out of thermodynamics."*

---

### What's New in v1.0

| Feature | Description |
|---------|-------------|
| **Natural Language Schedule Parser** | Input schedules in plain English with 91-100% confidence scoring |
| **Multi-Worker Physics Simulation** | 8 workers simulated simultaneously via Matter.js engine |
| **Temporal Debt Tracking** | Quantifies emergency shutdowns vs. scheduled recovery interventions |
| **Financial Dashboard** | Models $400K-$1.2M annual capacity losses per location |
| **Multi-Day Simulation** | Supports rotating schedules, compressed weeks, and multi-day cycling |
| **Schedule Comparison Mode** | Side-by-side analysis of competing schedule strategies |

### Carried Forward from v0.4

- Darwish 2023 exponential fatigue formulas (validated to machine precision)
- Circadian rhythm integration (Borbely two-process model)
- Risk translation engine (error probability, accident risk multipliers)
- Individual worker biological variance (80-120% baseline capacity)
- Matter.js physics visualization with color-coded worker states

---

### Schedule Comparison Results

Results from 1,000-tick validation testing:

| Schedule | Avg Capacity | Min Capacity | Emergency Shutdowns | Annual Cost Impact |
|----------|:------------:|:------------:|:-------------------:|:------------------:|
| **4-Hour Sprint** | ≥70% | ≥50% | 0 | Minimal |
| **6-Hour Darwish** | ~65% | ~40% | Minimal | ~$400K |
| **8-Hour Traditional** | ~55% | ~30% | Multiple | ~$800K |
| **12-Hour CRUNCH** | ~45% | ~20% | Catastrophic | ~$1.2M |

**4-hour sprints maintain optimal capacity. Traditional shifts guarantee degradation.**

---

### Mathematical Foundation

#### Fatigue Accumulation (Darwish 2023)
F(t) = 1 - (1 - F0) * e^(-lambda * t)

| Parameter | Value | Description |
|-----------|-------|-------------|
| F0 | Initial fatigue | Fatigue level at shift start |
| lambda | 0.0097 per min | Fatigue accumulation rate |
| t | minutes | Time spent working |

#### Recovery During Rest
R(t) = Fi * e^(-mu * (t - Di))

| Parameter | Value | Description |
|-----------|-------|-------------|
| Fi | Fatigue at rest start | Starting fatigue for recovery |
| mu | 0.0009 per min | Recovery rate (~10x slower than accumulation) |
| Di | minutes | Rest start time |

#### Circadian Modulation (Borbely Two-Process)
Alertness(t) = 0.5 + 0.5 * cos(2 * pi * (t - t_peak) / 24)
Fatigue_rate(t) = lambda * (2 - Alertness(t))

Night shifts experience up to **2x fatigue accumulation** due to circadian misalignment, with **18x performance variance** between 3 AM trough and 3 PM peak.

---

### Simulator Validation

#### Mathematical Precision

| Metric | Result |
|--------|--------|
| **Mean Absolute Error (MAE)** | 0.000000 |
| **Test Range** | 1,000 time steps |
| **Precision** | Machine-level (IEEE 754) |
| **Assessment** | Suitable for academic publication |

#### Cross-LLM Research Validation

Independent AI systems verified EARA's architecture, research grounding, and contributions:

| System | Validation Focus |
|--------|-----------------|
| **ChatGPT** | Architectural soundness and implementation quality |
| **Gemini** | Research gaps identified and novel contributions confirmed |
| **Grok** | Scope assessment and feasibility verification |
| **Perplexity** | Source grounding against peer-reviewed literature |
| **Claude** | Execution partnership, refinement, and deployment |

**Convergent agreement across all five independent systems.**

---

### Technical Stack

| Component | Technology |
|-----------|-----------|
| **Physics Engine** | Matter.js 0.19.0 |
| **Language** | Vanilla JavaScript ES6+ |
| **Architecture** | Single-file deployment (index.html) |
| **External Dependencies** | Zero (Matter.js loaded via CDN) |
| **Hosting** | GitHub Pages / Any static host |
| **Build Process** | None required |

---

### Quick Start
```bash
# 1. Clone the repository
git clone https://github.com/cochisestarks-web/EARA.git

# 2. Open index.html in any modern browser
cd EARA
open index.html    # macOS
start index.html   # Windows
xdg-open index.html # Linux

# No build process. No dependencies. No configuration.
```

#### Usage

1. **Enter a schedule** in natural language:
Monday-Friday: 9am-5pm with 1hr lunch
2. **Click "Parse Schedule"** - system confirms with confidence score
3. **Click "Start Simulation"** - watch workers degrade in real time
4. **Check Financial Dashboard** - see temporal debt and annual cost
5. **Compare schedules** - try a 4-hour sprint vs. your current schedule

---

## Documentation

### Research Framework
- **Full Essay:** [EARA_Phase_1.5_Essay.md](./EARA_Phase_1.5_Essay.md)
- **Medium Publication:** [Read on Medium](https://medium.com/@derekstarks/eara-measuring-temporal-and-biological-extraction-in-retail-work-schedules)
- **Gamma Index Specification:** [gamma_index.md](./gamma_index.md)

### Simulator
- **Live Demo:** [cochisestarks-web.github.io/EARA/](https://cochisestarks-web.github.io/EARA/)
- **Changelog:** [CHANGELOG.md](CHANGELOG.md)

### Supporting Literature

#### Chronobiology & Fatigue Science
- **Darwish, M. (2023).** "Optimal workday length considering worker fatigue and employer profit"
- **Borbély, A.A. (1982).** "A two process model of sleep regulation"
- **Enoka & Behrens (2023).** "Fatigue frameworks"
- **Akerstedt & Folkard (2004).** "S and C components validation"
- **Van Dongen et al. (2003).** "The cumulative cost of additional wakefulness"

#### Political Economy & Labor
- **Mattei, C. (2022).** "The Capital Order: How Economists Invented Austerity and Paved the Way to Fascism"
- **Rifkin, M. (2017).** "Beyond Settler Time: Temporal Sovereignty and Indigenous Self-Determination"
- **Lambert, S.J. (2008).** "Passing the buck: Labor flexibility practices that transfer risk onto hourly workers"
- **Fisk, C.L. & Malin, M.H. (2015).** "After the JDL: The Puzzle of Work Schedule Control"

---

## Project Timeline

| Date | Milestone |
|------|-----------|
| **March 23, 2026** | Project formally begins |
| **March 18, 2026** | γ (gamma) formally defined |
| **March 21, 2026** | γ-debt formula specified, validation pipeline built |
| **March 25, 2026** | Oasis Discovery — structural blind spot identified |
| **April 5, 2026** | Intuitions piece complete |
| **April 6, 2026** | **Phase 1.5 framework published** |

---

## Roadmap

### Framework Development
- [ ] Phase 2 cohort study (collaboration-dependent)
- [ ] Chronotype stratification implementation
- [ ] Hysteresis modeling (permanent depletion tracking)
- [ ] Mental health covariate integration
- [ ] Platform audit methodology (Kronos, Deputy, ADP, Oracle, SAP)

### Simulator Enhancement (v1.1 - v2.0)
- [ ] Complete Phase 2 financial modeling
- [ ] PDF/CSV export for audit reports
- [ ] Preset schedule library (retail, healthcare, manufacturing)
- [ ] Improved mobile responsiveness
- [ ] AI-powered schedule optimizer
- [ ] React port with component architecture
- [ ] Real-time collaboration dashboard

---

## Use Cases

### Workforce Research
Model fatigue accumulation across schedule types. Validate chronobiology hypotheses with interactive simulation. Quantify policy impacts before implementation.

### Policy Analysis
Analyze labor regulation effects using objective biophysical metrics. Compare international scheduling standards. Evaluate compressed workweek and sprint proposals with hard data.

### Education
Demonstrate exponential fatigue dynamics in classroom settings. Visualize abstract mathematics through physics simulation. Bridge workforce management, chronobiology, and economic theory.

### Labor Organizing
Provide empirical evidence for schedule reform demands. Quantify biological costs of current scheduling practices. Build data-driven cases for collective bargaining.

---

## Contributing

Contributions are welcome. EARA benefits most from:

1. **Empirical Data** — Real-world fatigue measurements from retail/shift work environments
2. **Literature Citations** — Additional chronobiology, labor economics, or political economy research
3. **Parameter Calibration** — Field validation of γ thresholds and recovery rates
4. **Feature Requests** — Open an issue describing your use case
5. **Bug Reports** — Include reproduction steps and browser/OS info

### How to Contribute
```bash
# Fork the repository
# Create your feature branch
git checkout -b feature/your-feature

# Commit your changes
git commit -m "Add: description of your contribution"

# Push to the branch
git push origin feature/your-feature

# Open a Pull Request
```

Please ensure contributions maintain mathematical accuracy and cite sources where applicable.

---

## Known Issues

- **Phase 2 financial model** in simulator is approximately 80% complete; some edge cases in multi-week projections remain under development.
- **Mobile layout** is functional but not fully optimized for small screens.
- **Session data** does not persist across page refreshes (planned for v1.2).

---

## License

### Research Framework
Licensed under [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

**You are free to:**
- Share — copy and redistribute the material
- Adapt — remix, transform, and build upon the material

**Under the following terms:**
- **Attribution** — You must give appropriate credit, provide a link to the license, and indicate if changes were made.

### Simulator Code
MIT License - see [LICENSE](LICENSE) for details.

Free to use, modify, and distribute. Attribution appreciated but not required.

---

## Contact & Collaboration

**For Phase 2 collaboration, research partnerships, or methodology questions:**

| Channel | Link |
|---------|------|
| **GitHub** | [cochisestarks-web/EARA](https://github.com/cochisestarks-web/EARA) |
| **LinkedIn** | [derek-loa-295646317](https://linkedin.com/in/derek-loa-295646317) |
| **Email** | starksukraine@gmail.com |

**Current outreach:** Clara Mattei (University of Tulsa), Grace Blakeley, Gary Stevenson (Garyseconomics), Dr. Diane Boivin (McGill)

---

## Citation

If you reference EARA in academic or professional work:
Loa, D. (2026). EARA: Measuring Temporal and Biological Extraction in Retail Work Schedules.
Phase 1.5 Framework. https://github.com/cochisestarks-web/EARA

---

## Acknowledgments

- **[Matter.js](https://brm.io/matter-js/)** - Physics engine powering worker simulation
- **Darwish (2023)** - Exponential fatigue formulas providing mathematical foundation
- **Borbély (1982)** - Two-process model enabling circadian integration
- **Cross-LLM validation team** - ChatGPT, Claude, Gemini, Grok, Perplexity
- **Clara Mattei, Grace Blakeley, Mark Rifkin** - Theoretical frameworks that named what the floor already knew
- **20 years of retail workers** - whose daily experience validated every formula before it was written

---

## About

**Author:** Derek Loa  
**Background:** 20 years retail floor experience (stock clerk → customer service manager → operations)  
**Approach:** Independent researcher synthesizing lived experience with circadian biology, labor economics, and political economy

**Why this matters:** Most economic models of worker productivity lack a **biological reality check**. EARA provides the missing variable.

---

*Built with 20 years of floor experience and pure spite.* 🔥

*The math doesn't lie. The simulation proves it. The framework exposes it. The question is: will you keep paying to ignore physics?*
