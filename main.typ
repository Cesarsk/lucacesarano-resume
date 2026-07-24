// =============================================================
// Luca Cesarano — Resume
// Compile: typst compile main.typ
// Watch:   typst watch main.typ
// =============================================================

#set document(title: "Luca Cesarano — Resume", author: "Luca Cesarano")

#set page(
  paper: "a4",
  margin: (x: 1.2cm, y: 1.0cm),
)

#set text(
  font: ("Helvetica Neue", "Helvetica", "Arial", "Liberation Sans"),
  size: 9.5pt,
  hyphenate: false,
)

#set par(leading: 0.58em, justify: false)

// Underline all hyperlinks so they're visually distinguishable in the PDF
#show link: it => underline(it)

// Delicate underlines: thin, slightly grey, dropped below the descenders
// so the line stops visually colliding with the text it underlines.
#set underline(stroke: 0.5pt + luma(120), offset: 1.6pt)

// -------- Section header: bold uppercase over a thin rule --------
#let section(name) = block(
  width: 100%,
  above: 14pt,
  below: 7pt,
  {
    text(weight: "bold", size: 10.5pt, tracking: 0.4pt, upper(name))
    v(2.5pt, weak: true)
    line(length: 100%, stroke: 0.5pt + black)
  },
)

// -------- Two-column row: left bold, right right-aligned -------
#let role(title, date) = block(above: 6pt, below: 2pt, grid(
  columns: (1fr, auto),
  align: (left, right),
  text(weight: "bold", size: 10pt, upper(title)),
  text(weight: "bold", size: 10pt, fill: luma(95), date),
))

#let company(name, location) = block(above: 2pt, below: 3pt, grid(
  columns: (1fr, auto),
  align: (left, right),
  text(style: "italic", fill: luma(95), name),
  text(style: "italic", fill: luma(95), location),
))

// -------- Bullets with tighter spacing --------
#set list(indent: 0.6em, body-indent: 0.5em, spacing: 0.55em, marker: ([•], [◦]))

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
  v(0.15em)
  text(size: 9pt, style: "italic", fill: luma(95))[Italian citizen · Swiss B permit · Zürich]
}

// -------- Skills content (rendered beside the photo when shown) --------
#let skills-block = {
  section[Skills]
  v(0.2em)
  grid(
    columns: (auto, 1fr),
    column-gutter: 1em,
    row-gutter: 0.55em,
    text(weight: "bold", "CLOUD & PLATFORM"),
    [AWS — 250+ account estate: Landing Zone & Organizations, networking, IAM & identity, security (SCPs, KMS), EKS, Kubernetes, Helm, ArgoCD, Istio, Kong, GitLab CI/CD, Docker],

    text(weight: "bold", "OBSERVABILITY & SECURITY"),
    [Datadog, PagerDuty, Snyk],

    text(weight: "bold", "AI / AGENTIC"),
    [Generative & agentic AI — Claude Code (skills, hooks, plugins, marketplaces), AWS Bedrock + AgentCore; multi-agent workflows, agent memory systems, RAG & knowledge bases, MCP],

    text(weight: "bold", "DEVOPS & IAC"),
    [Infrastructure as Code: Terraform, Atlantis; Python, Bash, Linux],

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

#text(size: 9pt, style: "italic", fill: luma(95))[\$1B+ FINMA-regulated digital-asset bank. #linebreak() Hybrid IC-manager: \~50% engineering / \~50% management.]

- Reset the SRE Platform team's operating model from the ground up (priority framework now adopted by all Sygnum platform teams, redesigned PagerDuty on-call / Slack / incident-communication standards) — external-team request backlog cut from #strong[40+ to \<10] with #strong[two consecutive PIs at 100% objective completion;] invited to present the turnaround company-wide.
- Authored Sygnum's first SLO/SLA + reliability/alerting framework on Datadog with multi-window burn-rate alerts (approved 2025); #strong[3 services LIVE, 10+ in pipeline].
- Hardened platform security to meet company audit standards: rolled out Datadog RBAC + Index Management, introduced Snyk vulnerability management with a CISO-approved SLA standard, and automated the GitLab token lifecycle — #strong[120+ access tokens rotated monthly as code, eliminating manual rotation].
- Led company-wide incident response — #strong[same-evening patching of a critical (9.8 CVSS) Kong CVE across all gateways;] hands-on restoration of a company-wide Kafka credential outage.
- Use AI to cut managerial overhead and stay hands-on: authored skills in Sygnum's internal Claude Code plugin marketplace (SRE triage, slide automation, infrastructure), #strong[manage Jira agentically] (AI-driven analytics and worklog automation), and #strong[halved PI-planning prep time] with an agentic planning skill adopted by both SRE teams. Consulted by leadership and asked to run a company workshop on applying AI to ways of working.
- Leading the platform build of Sygnum's AI Landing Zone from scratch — #strong[governed Amazon Bedrock across 4 dedicated AI accounts] for a regulated bank (EU-only inference, PrivateLink-isolated, SCP-enforced, org-wide guardrails & invocation logging), #strong[first RAG knowledge base live].
- Drive cost-optimisation programme: #strong[\~43% Spot adoption sustained] on EC2 compute plus Instance Scheduler shutting down non-prod off-hours — #strong[\~30% reduction in EC2 compute cost] versus the On-Demand baseline.
- Lead engineers across Zürich and Singapore; closed #strong[5 hires] across SRE, DevEx and IT Security; ad interim Manager for the DevEx Team since Oct 2025 and for the SRE Security Specialist role.

#v(0.85em)

#role("Tech Lead, Site Reliability Engineering", "JAN 2024 – JAN 2025")
#company("Sygnum Bank AG", "Zürich, Switzerland")

#text(size: 9pt, style: "italic", fill: luma(95))[Hybrid IC-manager: \~50% engineering / \~50% management.]

- Led Sygnum's AWS Landing Zone redesign in partnership with AWS ProServe (on-site engagement at AWS offices): designed the Sygnum-side infrastructure code, domain/workload account separation, IAM model, and EKS rollout. #strong[AWS estate scaled from 4 accounts (single-region) to 250+ across 3 regions] (CH, EU, APAC) during the programme.
- Automated the security controls underpinning Sygnum's regulatory (FINMA / ISAE) audits — #strong[\~30 AWS Config rules and 4 compliance benchmarks (AWS FSBP, CIS, NIST 800-53) across 7 org-wide security services, enforced by 12 SCPs;] hardened the AWS Organisation with a dedicated Restricted OU isolating its most sensitive accounts.
- Designed Datadog architecture from zero to org standard — #strong[now monitoring 100+ production services].
- Drove Kong Gateway adoption as the Sygnum-standard API gateway — #strong[now running 40 data planes across 8 business domains and 4 environments] (Konnect hybrid, delivered via ArgoCD GitOps).
- Led delivery of EKS Updater (#strong[eliminated weeks of manual upgrade toil twice a year across \~65 EKS clusters]) and ArgoCD-managed application updates across all domains.

#v(0.85em)

#block(breakable: false)[
  #role("Senior Associate, Site Reliability Engineering", "AUG 2022 – JAN 2024")
  #company("Sygnum Bank AG", "Zürich, Switzerland")

  #text(size: 9pt, style: "italic", fill: luma(95))[Individual contributor.]

  - Contributed to the AWS Landing Zone foundation: infrastructure code, account-separation patterns, and EKS rollout.
  - Designed access-control across Sygnum's stack: OpenSearch RBAC, Kubernetes RBAC, AWS Secrets Manager policies, and AWS IAM Identity Center (SSO) — aligned to least-privilege and audit-ready company standards.
  - Built and maintained containerised microservices on EKS and their GitLab CI pipelines.
]

#v(0.85em)

#block(breakable: false)[
  #role("Site Reliability Engineer", "FEB 2021 – JUL 2022")
  #company("Reply Group (Storm Reply) · Full-time consultant at Generali Investments", "Turin, Italy")

  #text(size: 9pt, style: "italic", fill: luma(95))[Individual contributor.]

  - Refactored pipelines and Terraform infrastructure (#strong[4× pipeline efficiency, 2× app performance, 30% toil reduction] via auto-remediation CLI).
  - Contributed to the design and build of the client's AWS Landing Zone.
  - Built the client's ELK monitoring/logging platform and operational dashboards.
]

#v(0.85em)

#block(breakable: false)[
  #role("Freelance System Engineer", "NOV 2017 – FEB 2021")
  #company("Drone Inspection Service", "Naples, Italy")

  #text(size: 9pt, style: "italic", fill: luma(95))[Occasional paid engagement alongside university studies.]

  - Provided IT and systems support as the company's primary technical contact.
  - Configured and maintained its on-premise stack: networking, servers and workstations, OS, directory services, databases, and remote/on-site connectivity.
  - Advised on infrastructure decisions and hardware procurement.
]

// =============================================================
// EDUCATION
// =============================================================

#block(breakable: false)[
  #section[Education] #v(0.2em)

  #role("Master of Computer Engineering", "SEP 2018 – MAR 2021")
  #company("Alma Mater Studiorum University of Bologna", "Bologna, Italy")
  #v(0.35em)

  - Research project at UOC Barcelona (2020-2021): A Real-Time Energy-Saving Mechanism in Internet of Vehicles Systems; published in IEEE Access.
    - #link("https://ieeexplore.ieee.org/document/9624984")[*"A Real-Time Energy-Saving Mechanism in Internet of Vehicles Systems"*] — #strong[first author], IEEE Access 2021 (peer-reviewed; #strong[20 citations]).

  #v(0.85em)

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
  - Multiple PRs merged to #link("https://github.com/runatlantis/atlantis/pulls?q=is%3Apr+author%3Acesarsk+is%3Amerged")[*runatlantis/atlantis*] — popular Terraform GitOps automation tool (#strong[9.2k★ / 1.3k forks]).
  - Merged PR to #link("https://github.com/DataDog/terraform-provider-datadog/pulls?q=is%3Apr+author%3Acesarsk+is%3Amerged")[*DataDog/terraform-provider-datadog*] — the official Datadog Terraform provider (#strong[480M+ registry downloads]).
  - Merged PR to #link("https://gitlab.com/gitlab-org/terraform-provider-gitlab/-/merge_requests?scope=all&state=merged&author_username=lu.cesarano")[*gitlab-org/terraform-provider-gitlab*] — the official GitLab Terraform provider (#strong[160M+ registry downloads]).
  - Merged PR to #link("https://github.com/unslothai/unsloth/pulls?q=is%3Apr+author%3Acesarsk+is%3Amerged")[*unslothai/unsloth*] — popular open-source LLM training & inference framework (#strong[67k★ / 6k forks]).
  - Merged PR to #link("https://github.com/aws-samples/assignment-automation-4-aws-sso/pulls?q=is%3Apr+author%3Acesarsk+is%3Amerged")[*aws-samples*] — AWS's official samples organisation, used globally for AWS reference implementations.
  - Multiple PRs merged to #link("https://gitlab.com/CalcProgrammer1/OpenRGB/-/merge_requests?scope=all&state=merged&author_username=lu.cesarano")[*CalcProgrammer1/OpenRGB*] — popular cross-platform hardware-RGB control tool (#strong[3k★ / 1.7k forks]). My personal project #link("https://github.com/Cesarsk/kraken-unleashed")[*kraken-unleashed*] is listed in OpenRGB's README under "Related Projects".
  - Multiple PRs merged to #link("https://github.com/zpix1/windisplay/pulls?q=is%3Apr+author%3Acesarsk+is%3Amerged")[*zpix1/windisplay*] — open-source Windows brightness control over HDMI.
- Built #link("https://github.com/Cesarsk/ike")[*ike*] — open-source k9s-style terminal UI for Datadog, released on Homebrew; developed end-to-end by directing agentic AI workflows (Go).
- Tech writing on Medium, including articles featured in #link("https://betterprogramming.pub/")[Better Programming] (#link("https://lucacesarano.medium.com")[lucacesarano.medium.com]).
- Open-source Android language app (*Say It! Pronunciation App*, no longer on Store) — #strong[30,000 downloads, 4.9/5] (320 reviews).
- Occasional advisory work for early-stage startups on cloud architecture and platform setup.
