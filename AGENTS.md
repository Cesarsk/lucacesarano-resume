# Agent Briefing — Luca Cesarano CV

## What this repo is

Single-page-style CV for **Luca Cesarano**, Head of Platform SRE at Sygnum Bank AG. Source is `main.typ` (Typst), output is `main.pdf`. Targeting senior infrastructure / SRE / EM roles at top-tech companies and regulated EU/CH employers.

## How to build

```
make build   # one-shot compile via typst
make watch   # live preview
make open    # build + open PDF
make clean   # remove PDF
```

Typst is installed via Homebrew. `typst --version` → 0.14.x.

## Current owner facts (verified during the editing session)

| Fact | Value |
|---|---|
| Current title | Head of Platform, Site Reliability Engineering |
| Current employer | Sygnum Bank AG (Zürich + Singapore) |
| Started at Sygnum | Aug 2022 (Senior Associate) |
| Promotion to Tech Lead | Jan 2024 |
| Promotion to Head of | Jan 2025 |
| Ad interim DevEx Manager | Since Oct 2025 |
| Direct reports | Variable; team is across Zürich and Singapore |
| Hires closed | 5 (across SRE, DevEx, partner teams) |
| Operating split (Head of) | ~70% management / ~30% engineering |
| Operating split (Tech Lead) | ~50/50 |
| German level | B1 |
| AWS certs | Pro (Feb 2022) + Associate (Nov 2021), both expired, "renewal pending" |
| Sygnum AWS estate | 248 accounts, 18 domain accounts, 65 EKS cluster envs (16 prod), 23 Helm charts, 63 Terraform modules |
| AWS spend (Apr 2025 – Mar 2026) | ~$2.5M/yr |
| EC2 Spot adoption | ~43% sustained, ~$300k/yr avoided vs On-Demand |
| Backlog reduction | 40+ → <10 external-team requests |
| PI completion | Two consecutive PIs at 100% (also applies to DevEx and Security teams) |
| SLO/SLA framework | Approved 2025; Bronze 98.5% / Silver 99.3% / Gold 99.6%; 3 services LIVE, 10+ in pipeline |

## Editorial decisions made

- **Selected Outcomes section removed** — content distributed across role bullets.
- **Drone Inspection Service kept** — user wants it for years-of-experience accounting.
- **"Operating split" sublines removed** from headers (clutter for a CV; better as interview talking points).
- **"First management role at Sygnum" subline removed** from Tech Lead.
- **"Inherited a team in a difficult state" → "Reset the SRE Platform team's operating model from the ground up"** — softens the implicit blame on predecessor.
- **Storm Reply rebrand** — *"Reply Group (Storm Reply)"* + explicit *"Full-time consultant at Generali Investments"* to leverage recognizable brand names.
- **Skills consolidation** — IAM moved to Cloud & Platform only (was duplicated). SonarQube dropped. Snyk moved to Observability. AWS Organizations moved to Cloud & Platform. FINMA/ISAE 3402 row removed (compliance is described in the Tech Lead bullet instead).
- **Underlines** — used sparingly on quantified outcomes only (40+ → <10, 4 → 248, ~43% Spot, ~$300k/yr, 7/7 Golden Signals, Storm Reply 4×/2×/30%, 30k Android downloads).
- **AWS certs marked "(renewal pending)"** rather than "(expired)" — same fact, more proactive framing.

## Design / layout

- A4, ~1.2cm margins, ~9.5pt body, 10pt headers.
- Custom `section()`, `role()`, `company()` helpers in `main.typ`.
- Section headers are bordered bands.
- Bullet markers: ▪ at top level, ○ for nested.
- `block(breakable: false)` wraps Drone Inspection and Education to prevent ugly orphans across page breaks.
- Currently 2 pages (page 1 holds all of Sygnum + Storm Reply + Drone; page 2 holds Education + Certs + Projects).

## Open / discretionary items

- 1-page vs 2-page is configurable via font size + margins. User accepted 2 pages with 9.5pt over 1 page with 8.5pt for readability.
- The Drone Inspection bullets are intentionally light — user prioritized years-of-experience over project specificity. Pushing for more detail would require new info from the user.
- "Senior Associate" section is the thinnest by design — older, less interesting at Head-of seniority.

## What NOT to change without asking

- The 4 → 248 accounts story (it's tied to Tech Lead role specifically, not Senior Associate).
- The "FINMA / ISAE" compliance bullet (regulated-bank credibility is a key differentiator).
- The argocd-helm-lookup OSS bullet — links to user's GitHub and Medium, this is the pinned credential.
- The "$1B+ valuation" mention in the Summary — user explicitly wants it kept.

## Things still in flight (per user)

- 3rd consecutive PI at 100% — likely true but not yet verified, so left out of the CV.
- Side consulting line — present in CV; user confirmed it's OK at Sygnum but would remove for top-tech submissions.

## CI / Repo

- Repository will be published to GitHub.
- GitHub Actions workflow at `.github/workflows/build.yml`:
  - **PRs**: validate that `main.typ` compiles (no artifact upload).
  - **Push to main**: compile and upload `main.pdf` as a workflow artifact.

## When picking up this repo

1. Read this file.
2. Read `main.typ`.
3. Build the PDF and visually inspect (`make open`).
4. Ask the user before any structural change. Surface-level edits (typo, wording) are fine without confirmation.
