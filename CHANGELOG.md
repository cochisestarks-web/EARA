# Changelog

All notable changes to EARA will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-02-14

### Added
- Natural language schedule parser with confidence scoring (91-100%)
- Multi-worker physics simulation with Matter.js integration (8 workers)
- Temporal debt tracking system (emergency vs. scheduled shutdowns)
- Financial dashboard showing capacity cost modeling ($400K-$1.2M annual)
- Multi-day simulation cycling for rotating schedules
- Schedule comparison mode with side-by-side analysis

### Changed
- Renamed from "Employee Activity Rhythm Analyzer" to "Workforce Analytics Simulation"
- Rebranded from HIGH-OCTANE research project to EARA production system
- Updated full name: "Exponential Accumulation Recovery Analysis" to "Entropy-Aware Resource Allocation"
- Transitioned version numbering from v0.5.x development track to v1.0 production

### Improved
- Circadian rhythm visualization given more prominent placement in UI
- Real-time capacity metrics display with per-worker detail cards
- Financial modeling integrated directly into main dashboard
- Worker state color coding refined (green/yellow/red/black)

### Fixed
- Comparison mode visibility issues carried over from v0.5.4

## [0.5.4] - 2026-02-07

### Fixed
- Comparison mode rendering bug causing hidden elements
- Schedule parser edge case with multi-line input

## [0.4.0] - 2025-12

### Added
- Darwish 2023 mathematical implementation (MAE = 0.000000)
- Circadian rhythm modulation via Borbely two-process model
- Risk translation engine (error probability, accident risk mapping)
- Matter.js physics visualization with particle-based workers
- Individual worker biological variance (80-120% baseline capacity)
- DarwishWorker class implementing pure biophysical fatigue model
- Color-coded worker states: Optimal (green), Degraded (yellow), Critical (red), Shutdown (black)
- 6-hour biological ceiling detection (entropy wall)
- Forensic audit report generation

### Validated
- Cross-LLM research validation (ChatGPT, Gemini, Grok, Perplexity, Claude)
- Academic peer-reviewed source grounding against Darwish 2023, Borbely 1982
- Machine-precision mathematical accuracy across 1,000 time steps
- Convergent agreement across five independent AI systems

[1.0.0]: https://github.com/cochisestarks-web/EARA/compare/v0.4.0...v1.0.0
[0.5.4]: https://github.com/cochisestarks-web/EARA/compare/v0.4.0...v0.5.4
[0.4.0]: https://github.com/cochisestarks-web/EARA/releases/tag/v0.4.0
