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

#align(center)[
  #text(weight: "bold", size: 18pt, "LUCA CESARANO")
  #v(-0.2em)
  #text(size: 9.5pt)[
    #link("mailto:luca.cesarano1@gmail.com")[luca.cesarano1\@gmail.com] |
    #link("https://www.lucacesarano.com")[lucacesarano.com] |
    #link("https://github.com/cesarsk")[github.com/cesarsk] |
    #link("https://linkedin.com/in/luca-cesarano1")[linkedin.com/in/luca-cesarano1]
  ]
]

#v(0.2em)

// =============================================================
// SUMMARY
// =============================================================

#section[Summary] #v(0.2em)

Head of Platform, Site Reliability Engineering at Sygnum, the FINMA-regulated
digital-asset bank (\$1B+ valuation, \~300 employees). 8+ years across SRE,
cloud, and on-premise infrastructure. Lead the company-wide SRE function across
Zürich and Singapore, running the AWS estate that powers Sygnum's trading,
custody, tokenization, banking, and onboarding workloads for institutional and
B2B clients across CH, EU, and APAC.

// =============================================================
// SKILLS
// =============================================================

#section[Skills] #v(0.2em)

#grid(
  columns: (auto, 1fr),
  column-gutter: 1em,
  row-gutter: 0.45em,
  text(weight: "bold", "CLOUD & PLATFORM"),
  [AWS (Landing Zone, Organizations, EKS, MSK, RDS, Lambda, S3, IAM, Direct Connect, KMS, CloudWatch, Cost Explorer, Route53), Kubernetes, Helm, ArgoCD, ISTIO, Kong, Confluent Kafka, GitLab CI, Docker],

  text(weight: "bold", "OBSERVABILITY"),
  [Datadog, PagerDuty, Snyk, ELK],

  text(weight: "bold", "PROGRAMMING"),
  [Python, Bash, Terraform (Atlantis)],

  text(weight: "bold", "LANGUAGES"),
  [Italian (native), English (fluent), German (B1)],
)

// =============================================================
// WORK EXPERIENCE
// =============================================================

#section[Work Experience] #v(0.2em)

#role("Head of Platform, Site Reliability Engineering", "JAN 2025 – PRESENT")
#company("Sygnum Bank AG", "Zürich, Switzerland")

- Reset the SRE Platform team's operating model from the ground up: defined the priority framework now adopted by all Sygnum platform teams (also used as AI knowledge base), redesigned PagerDuty / Slack / incident-communication standards, and shipped AI-driven transparency reports — #underline[invited to present the turnaround as a company-wide success story and workshop].
- External-team request backlog cut from #underline[40+ to \<10]. #underline[Two consecutive PIs at 100% objective completion] across Platform SRE, DevEx, and Security.
- Authored Sygnum's first SLO/SLA + reliability/alerting framework on Datadog with multi-window burn-rate alerts (approved 2025); #underline[3 services LIVE, 10+ in pipeline].
- Drive cost-optimisation programme: #underline[\~43% Spot adoption sustained] on EC2 compute, #underline[\~\$300k/yr avoided] versus On-Demand baseline; Instance Scheduler shutting down non-prod off-hours.
- Lead engineers across Zürich and Singapore; closed #underline[5 hires] across SRE, DevEx and IT Security Team.
- Ad interim Manager for the DevEx Team since Oct 2025 and for our SRE Security Specialist

#v(0.6em)

#role("Tech Lead, Site Reliability Engineering", "JAN 2024 – JAN 2025")
#company("Sygnum Bank AG", "Zürich, Switzerland")

- Led Sygnum's AWS Landing Zone redesign in partnership with #underline[AWS ProServe (on-site engagement at AWS offices)]: designed the Sygnum-side infrastructure code, domain/workload account separation, IAM model, and EKS rollout. #underline[AWS estate scaled from 4 accounts (single-region) to 248 across 3 regions] (CH, EU, APAC) during the programme.
- Automated FINMA / ISAE audit controls to reduce manual overhead during regulatory audits.
- Designed Datadog architecture from zero to org standard; #underline[onboarded all our services].
- Drove Kong Gateway adoption as the standard Sygnum API gateway.
- Led delivery of EKS Updater (eliminated weeks of manual cluster-upgrade toil twice a year) and ArgoCD-managed application updates across all domains.

#v(0.6em)

#role("Senior Associate, Site Reliability Engineering", "AUG 2022 – JAN 2024")
#company("Sygnum Bank AG", "Zürich, Switzerland")

- Contributed to the AWS Landing Zone foundation as an individual contributor: infrastructure code, account-separation patterns, and EKS rollout.
- Designed the OpenSearch RBAC model and reworked access patterns across multiple Sygnum services to align with least-privilege standards.
- Built and maintained containerised microservices on EKS; advanced GitLab CI pipelines.

#v(0.6em)

#role("Site Reliability Engineer", "FEB 2021 – JUL 2022")
#company("Reply Group (Storm Reply) · Full-time consultant at Generali Investments", "Turin, Italy")

- Refactored pipelines and Terraform infrastructure (#underline[4× pipeline efficiency, 2× app performance, 30% toil reduction] via auto-remediation CLI).
- Contributed to the design and build of the client's AWS Landing Zone.
- AWS Cloud Migration for Banca Agricola Popolare di Ragusa (CloudEndure, EC2, RDS, IAM, Workspaces).
- Built ELK monitoring/logging platform with quality dashboards.

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

  - Research project at UOC Barcelona (2020-2021): A Real-Time Energy-Saving Mechanism in Internet of Vehicles Systems; published in IEEE Access. The outcome is a Pubblication
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
  [AWS Solutions Architect — Professional #text(style: "italic")[(to renew)]], [FEB 2022],
  [AWS Solutions Architect — Associate #text(style: "italic")[(to renew)]], [NOV 2021],
)

// =============================================================
// PROJECTS, PUBLICATIONS & WRITING
// =============================================================

#section[Projects, Publications & Writing] #v(0.2em)

- Tech writing on Medium, including articles featured in #underline[#link("https://betterprogramming.pub/")[Better Programming]] (#link("https://lucacesarano.medium.com")[lucacesarano.medium.com]).
- Open-source Android language app (*Say It! Pronunciation App*, no longer on Store) — #underline[30,000 downloads, 4.9/5] (320 reviews).
- Occasional advisory work for early-stage startups on cloud architecture and platform setup.
