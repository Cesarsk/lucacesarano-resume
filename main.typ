// =============================================================
// Luca Cesarano — Resume
// Compile: typst compile main.typ
// Watch:   typst watch main.typ
// =============================================================

#set document(title: "Luca Cesarano — Resume", author: "Luca Cesarano")

#set page(
  paper: "a4",
  margin: (x: 1.2cm, y: 0.8cm),
)

#set text(
  font: ("Helvetica Neue", "Helvetica", "Arial", "Liberation Sans"),
  size: 9.5pt,
  hyphenate: false,
)

#set par(leading: 0.45em, justify: false)

// Underline all hyperlinks so they're visually distinguishable in the PDF
#show link: it => underline(it)

// -------- Section header band (bordered, bold, uppercase) -----
#let section(name) = block(
  width: 100%,
  inset: (x: 6pt, y: 3.5pt),
  stroke: 0.7pt + black,
  above: 11pt,
  below: 6pt,
  text(weight: "bold", size: 10pt, upper(name)),
)

// -------- Two-column row: left bold, right right-aligned -------
#let role(title, date) = block(above: 6pt, below: 2pt, grid(
  columns: (1fr, auto),
  align: (left, right),
  text(weight: "bold", size: 10pt, upper(title)),
  text(weight: "bold", size: 10pt, date),
))

#let company(name, location) = block(above: 2pt, below: 3pt, grid(
  columns: (1fr, auto),
  align: (left, right),
  text(style: "italic", name),
  text(style: "italic", location),
))

// -------- Bullets with tighter spacing --------
#set list(indent: 0.6em, body-indent: 0.5em, spacing: 0.4em, marker: ([▪], [○]))

// =============================================================
// HEADER
// =============================================================

// Photo toggle. Set to true once photo.jpg is committed to the repo.
// Keep false for US-direct applications (US norms discourage CV photos);
// true is fine/expected for Swiss + EMEA roles (incl. AWS/Meta/Google EMEA).
#let show-photo = true
#let photo-path = "photo.jpg"

#let name-block = {
  text(weight: "bold", size: 18pt, "LUCA CESARANO")
  v(-0.2em)
  text(size: 9.5pt)[
    #link("mailto:luca.cesarano1@gmail.com")[luca.cesarano1\@gmail.com] |
    #link("https://www.lucacesarano.com")[lucacesarano.com] |
    #link("https://github.com/cesarsk")[github.com/cesarsk] |
    #link("https://linkedin.com/in/luca-cesarano1")[linkedin.com/in/luca-cesarano1]
  ]
}

// -------- Skills content (rendered beside the photo when shown) --------
#let skills-block = {
  section[Skills]
  v(0.2em)
  grid(
    columns: (auto, 1fr),
    column-gutter: 1em,
    row-gutter: 0.45em,
    text(weight: "bold", "CLOUD & PLATFORM"),
    [AWS — 250+ account estate: Landing Zone & Organizations, networking, IAM & identity, security (SCPs, KMS), EKS. Kubernetes, Helm, ArgoCD, Istio, Kong, GitLab CI, Docker],

    text(weight: "bold", "OBSERVABILITY & SECURITY"),
    [Datadog, PagerDuty, Snyk],

    text(weight: "bold", "AI / AGENTIC"),
    [Claude Code (skills, hooks, plugins, marketplaces), AWS Bedrock + AgentCore; multi-agent workflows, agent memory systems, RAG & knowledge bases, MCP integrations],

    text(weight: "bold", "AUTOMATION & IAC"),
    [Python, Bash, Terraform, Atlantis],

    text(weight: "bold", "LANGUAGES"),
    [Italian (native), English (fluent), German (B1)],
  )
}

// Header: with photo, name + skills fill the left column beside a full-size
// photo (reclaims the dead space); without photo, centered name then skills.
#if show-photo {
  grid(
    columns: (1fr, auto),
    align: (left + top, right + top),
    column-gutter: 16pt,
    {
      name-block
      skills-block
    },
    box(clip: true, radius: 3pt, image(photo-path, width: 2.5cm)),
  )
} else {
  align(center, name-block)
  v(0.2em)
  skills-block
}

// =============================================================
// WORK EXPERIENCE
// =============================================================

#section[Work Experience] #v(0.2em)

#role("Head of Platform, Site Reliability Engineering", "JAN 2025 – PRESENT")
#company("Sygnum Bank AG", "Zürich, Switzerland")

#text(size: 9pt, style: "italic")[\$1B+ FINMA-regulated digital-asset bank. #linebreak() Hybrid IC-manager: \~50% engineering / \~50% management.]

- Reset the SRE Platform team's operating model from the ground up (priority framework #underline[now adopted by all Sygnum platform teams], redesigned PagerDuty / Slack / incident-communication standards) — external-team request backlog cut from #underline[40+ to \<10] with #underline[two consecutive PIs at 100% objective completion]; #underline[invited to present the turnaround company-wide].
- Authored Sygnum's first SLO/SLA + reliability/alerting framework on Datadog with multi-window burn-rate alerts (approved 2025); #underline[3 services LIVE, 10+ in pipeline].
- Hardened platform security to meet company audit standards: rolled out Datadog RBAC + Index Management, introduced #underline[Snyk vulnerability management with a CISO-approved SLA standard], and automated the GitLab token lifecycle — #underline[120+ access tokens rotated monthly as code, eliminating manual rotation].
- Led company-wide incident response — #underline[same-evening patching of a critical (9.8 CVSS) Kong CVE across all gateways]; hands-on restoration of a company-wide Kafka credential outage.
- Use AI to cut managerial overhead and stay hands-on: authored skills in Sygnum's internal Claude Code plugin marketplace (SRE triage, slide automation, infrastructure), #underline[manage Jira agentically] (AI-driven analytics and worklog automation), and #underline[halved PI-planning prep time] with an agentic planning skill adopted by both SRE teams. #underline[Consulted by leadership and asked to run a company workshop on applying AI to ways of working].
- Leading the platform build of Sygnum's AI Landing Zone from scratch — #underline[governed Amazon Bedrock across 4 dedicated AI accounts] for a regulated bank (EU-only inference, PrivateLink-isolated, SCP-enforced, org-wide guardrails & invocation logging), #underline[first RAG knowledge base live].
- Drive cost-optimisation programme: #underline[\~43% Spot adoption sustained] on EC2 compute plus Instance Scheduler shutting down non-prod off-hours — #underline[\~30% reduction in EC2 compute cost] versus the On-Demand baseline.
- Lead engineers across Zürich and Singapore; closed #underline[5 hires] across SRE, DevEx and IT Security; ad interim Manager for the DevEx Team since Oct 2025 and for the SRE Security Specialist role.

#v(0.6em)

#role("Tech Lead, Site Reliability Engineering", "JAN 2024 – JAN 2025")
#company("Sygnum Bank AG", "Zürich, Switzerland")

#text(size: 9pt, style: "italic")[Hybrid IC-manager: \~50% engineering / \~50% management.]

- Led Sygnum's AWS Landing Zone redesign in partnership with #underline[AWS ProServe (on-site engagement at AWS offices)]: designed the Sygnum-side infrastructure code, domain/workload account separation, IAM model, and EKS rollout. #underline[AWS estate scaled from 4 accounts (single-region) to 250+ across 3 regions] (CH, EU, APAC) during the programme.
- Automated the security controls underpinning Sygnum's regulatory (FINMA / ISAE) audits — #underline[\~30 AWS Config rules and 4 compliance benchmarks (AWS FSBP, CIS, NIST 800-53) across 7 org-wide security services, enforced by 12 SCPs]; hardened the AWS Organisation with a dedicated Restricted OU isolating its most sensitive accounts.
- Designed Datadog architecture from zero to org standard — #underline[now monitoring 100+ production services].
- Drove Kong Gateway adoption as the Sygnum-standard API gateway — #underline[now running 40 data planes across 8 business domains and 4 environments] (Konnect hybrid, delivered via ArgoCD GitOps).
- Led delivery of EKS Updater (#underline[eliminated weeks of manual upgrade toil twice a year across \~65 EKS clusters]) and ArgoCD-managed application updates across all domains.

#v(0.6em)

#role("Senior Associate, Site Reliability Engineering", "AUG 2022 – JAN 2024")
#company("Sygnum Bank AG", "Zürich, Switzerland")

#text(size: 9pt, style: "italic")[Individual contributor.]

- Contributed to the AWS Landing Zone foundation: infrastructure code, account-separation patterns, and EKS rollout.
- Designed access-control across Sygnum's stack: OpenSearch RBAC, Kubernetes RBAC, AWS Secrets Manager policies, and AWS IAM Identity Center (SSO) — aligned to least-privilege and audit-ready company standards.
- Built and maintained containerised microservices on EKS and their GitLab CI pipelines.

#v(0.6em)

#role("Site Reliability Engineer", "FEB 2021 – JUL 2022")
#company("Reply Group (Storm Reply) · Full-time consultant at Generali Investments", "Turin, Italy")

- Refactored pipelines and Terraform infrastructure (#underline[4× pipeline efficiency, 2× app performance, 30% toil reduction] via auto-remediation CLI).
- Contributed to the design and build of the client's AWS Landing Zone.
- Built the client's ELK monitoring/logging platform and operational dashboards.

#v(0.6em)

#block(breakable: false)[
  #role("Freelance System Engineer", "NOV 2017 – FEB 2021")
  #company("Drone Inspection Service", "Naples, Italy")

  - Sole technical contact for IT during the company's early-stage growth.
  - Built and ran the full on-premise stack: networking, servers and workstations, OS, directory services, databases, and remote/on-site connectivity.
  - Advised on infrastructure decisions and hardware procurement.
]

// =============================================================
// EDUCATION
// =============================================================

#block(breakable: false)[
  #section[Education] #v(0.2em)

  #role("Master of Computer Engineering", "SEP 2018 – MAR 2021")
  #company("Alma Mater Studiorum University of Bologna", "Bologna, Italy")

  - Research project at UOC Barcelona (2020-2021): A Real-Time Energy-Saving Mechanism in Internet of Vehicles Systems; published in IEEE Access.
    - #link("https://ieeexplore.ieee.org/document/9624984")[*"A Real-Time Energy-Saving Mechanism in Internet of Vehicles Systems"*] — #underline[first author], IEEE Access 2021 (peer-reviewed; #underline[20 citations]).

  #v(0.6em)

  #role("Bachelor of Computer Engineering", "OCT 2012 – JUL 2018")
  #company("Federico II University of Naples", "Naples, Italy")
]

// =============================================================
// CERTIFICATIONS
// =============================================================

#section[Certifications] #v(0.2em)

#grid(
  columns: (1fr, auto),
  align: (left, right),
  row-gutter: 0.4em,
  [AWS Solutions Architect — Professional], [FEB 2022],
  [AWS Solutions Architect — Associate], [NOV 2021],
)

// =============================================================
// PROJECTS, PUBLICATIONS & WRITING
// =============================================================

#section[Projects, Publications & Writing] #v(0.2em)

- Open-source contributions:
  - Multiple PRs merged to #link("https://github.com/runatlantis/atlantis/pulls?q=is%3Apr+author%3Acesarsk+is%3Amerged")[*runatlantis/atlantis*] — popular Terraform GitOps automation tool (#underline[9.2k★ / 1.3k forks]).
  - Merged PR to #link("https://gitlab.com/gitlab-org/terraform-provider-gitlab/-/merge_requests?scope=all&state=merged&author_username=lu.cesarano")[*gitlab-org/terraform-provider-gitlab*] — the official GitLab Terraform provider.
  - Merged PR to #link("https://github.com/unslothai/unsloth/pulls?q=is%3Apr+author%3Acesarsk+is%3Amerged")[*unslothai/unsloth*] — popular open-source LLM training & inference framework (#underline[67k★ / 6k forks]).
  - Merged PR to #link("https://github.com/aws-samples/assignment-automation-4-aws-sso/pulls?q=is%3Apr+author%3Acesarsk+is%3Amerged")[*aws-samples*] — AWS's official samples organisation, used globally for AWS reference implementations.
  - Multiple PRs merged to #link("https://gitlab.com/CalcProgrammer1/OpenRGB/-/merge_requests?scope=all&state=merged&author_username=lu.cesarano")[*CalcProgrammer1/OpenRGB*] — popular cross-platform hardware-RGB control tool (#underline[3k★ / 1.7k forks]). My personal project #link("https://github.com/Cesarsk/kraken-unleashed")[*kraken-unleashed*] is listed in OpenRGB's README under "Related Projects".
  - Multiple PRs merged to #link("https://github.com/zpix1/windisplay/pulls?q=is%3Apr+author%3Acesarsk+is%3Amerged")[*zpix1/windisplay*] — open-source Windows brightness control over HDMI.
- Built #link("https://github.com/Cesarsk/ike")[*ike*] — open-source k9s-style terminal UI for Datadog, released on Homebrew; #underline[developed end-to-end by directing agentic AI workflows] (Go).
- Tech writing on Medium, including articles featured in #link("https://betterprogramming.pub/")[Better Programming] (#link("https://lucacesarano.medium.com")[lucacesarano.medium.com]).
- Open-source Android language app (*Say It! Pronunciation App*, no longer on Store) — #underline[30,000 downloads, 4.9/5] (320 reviews).
- Occasional advisory work for early-stage startups on cloud architecture and platform setup.
