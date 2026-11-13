# Security

This is a static, open-data prototype built for NASA Space Apps 2026. It has **no backend, no database, no user accounts, no cookies, no analytics and no forms**. We do not collect personal data.

We apply proportional controls **inspired by** ISO/IEC 27001:2022 Annex A. This project is **not certified** and does not claim compliance.

| Area | Control |
|---|---|
| Secure development (A.8.25, A.8.28) | Code review on every PR; automated security review before release |
| Vulnerabilities (A.8.8) | `npm audit`, Dependabot, pinned lockfile; prefer releases older than 7 days |
| Configuration (A.8.9) | Content-Security-Policy via `<meta>`; no third-party scripts or CDNs; SRI if any external asset is unavoidable |
| Privacy (A.5.34) | No personal data processed; optional progress stays in the visitor's own `localStorage` |
| Access | 2FA for all maintainers, protected `main` branch, GitHub secret scanning |
| Supply chain | Agent skills pinned to reviewed commits (`skills-lock.txt`); third-party hooks disabled |

## Reporting
Open a private security advisory in this repository (GitHub → Security → Report a vulnerability).
