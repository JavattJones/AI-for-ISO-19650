# AI for ISO 19650

> A multi-agent Claude Code system that audits BIM information management documentation against the ISO 19650 series — in minutes, not days.

![Platform](https://img.shields.io/badge/platform-Claude%20Code-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-active-brightgreen)
![Built with](https://img.shields.io/badge/built%20with-Claude%20Agents%20%2B%20PowerShell-blueviolet)
![Standard](https://img.shields.io/badge/standard-ISO%2019650--1%2F2%2F3%2F5-orange)

---

## The Problem

Auditing a BIM project against ISO 19650 means manually cross-referencing dozens of requirements against multiple documents — EIR, BEP, MIDP, TIDP, CDE protocols, naming conventions, role assignments. A thorough audit takes a senior BIM Manager 2–3 days per project.

**AI for ISO 19650 automates that.**

---

## What It Does

A team of specialized AI agents reads all your project documentation, maps evidence against every ISO 19650 requirement, identifies gaps with clause-level precision, and generates a complete audit report with a traceability table, a maturity index, and a prioritized action plan.

All evidence is documented. No assumption is made without a source. Every non-conformity cites the exact ISO clause it violates.

---

## Agent Architecture

```
Project documents + Requirements Excel
        |
   [ Indexer ]  →  Reads and catalogs all artefacts (EIR, BEP, MIDP, CDE...)
        |
   [ Analyzer ] ×N  →  One agent per ISO clause, runs in parallel
        |             §5.1  §5.2  §5.3  §5.4  §5.5  §5.6  §5.7
        |
   [ Gap Analyst ]  →  Drafts specific gaps for every NC/PC/PR finding
        |             Each gap: clause cited · risk level · corrective action
        |
   [ Reporter ]  →  Assembles final outputs after verifying all checkpoints
        |
OUTPUT 1: Traceability table (one row per requirement)
OUTPUT 2: Executive audit report with maturity index
```

| Agent | Role | Never does |
|---|---|---|
| **Indexer** | Catalogs artefacts, identifies missing documents | Classify compliance |
| **Analyzer** | Maps evidence per clause, assigns C/PC/NC/NA/PR | Edit documents |
| **Gap Analyst** | Writes precise gap descriptions + corrective actions | Reclassify states |
| **Reporter** | Assembles outputs, verifies checkpoints, calculates maturity | Re-analyze |

---

## Compliance States

| State | Meaning |
|---|---|
| **C — Conform** | Documented, specific, current and sufficient evidence |
| **PC — Partially Conform** | Evidence exists but incomplete, generic, or not formally approved |
| **NC — Non-Conform** | No coverage, document missing, or evidence does not satisfy the requirement |
| **NA — Not Applicable** | Not applicable to this project/phase/role. Justification mandatory |
| **PR — Pending Review** | Insufficient documentation to issue a judgment |

---

## How to Use

### Prerequisites

- [Claude Code](https://claude.ai/code) (CLI or VS Code extension)
- PowerShell 5.1+ (built into Windows)
- Git

### Setup

```powershell
git clone https://github.com/JavattJones/AI-for-ISO-19650.git
cd "AI-for-ISO-19650"
PowerShell -ExecutionPolicy Bypass -File init.ps1
```

`init.ps1` verifies the environment and reports what's ready, what's missing, and what needs to be configured before starting.

### Running an Audit

1. **Import your requirements Excel**
   ```powershell
   PowerShell -ExecutionPolicy Bypass -File excel_to_json.ps1 -ExcelPath "path\to\requirements.xlsx"
   ```
   This generates `requirements.json` from your client's ISO 19650 requirements template.

2. **Place project documents** in a `proyecto/` subfolder (BEP, EIR, MIDP, CDE docs, etc.)

3. **Open Claude Code** in this folder and launch the Leader agent:
   > "Inicia la auditoría. Los documentos del proyecto están en `proyecto/`. Rol auditado: Lead Appointed Party. Fase: Ejecución."

4. The Leader confirms the scope, then orchestrates Indexer → Analyzers → Gap Analyst → Reporter automatically.

5. **Retrieve outputs:**
   - `SALIDA_1_trazabilidad.md` — full traceability table, ready to copy to Excel
   - `SALIDA_2_informe.md` — executive audit report

---

## Outputs

### Traceability Table

| ID Req | ISO Clause | Requirement | State | Source Artefact | Section | Evidence | Specific Gap | Corrective Action | Audit Risk |
|---|---|---|---|---|---|---|---|---|---|
| REQ-007 | 5.4 | Post-appointment BEP approved by Appointing Party | PC | BEP | §1 Cover | BEP v2.0 exists, dated Mar-2024 | No formal approval by AP documented (§5.4.4) | Obtain and publish AP approval in CDE | HIGH |

### Executive Report

- Maturity Index: `(C×100 + PC×50) / total applicable requirements`
- Compliance by clause with traffic light status
- Numbered non-conformities (NC-001, NC-002...) with clause, impact and corrective action
- Prioritized action plan with estimated effort

---

## Norm Coverage

| Part | Scope | Supported |
|---|---|---|
| ISO 19650-1 | Concepts and principles | ✅ |
| ISO 19650-2 | Delivery phase (design & construction) | ✅ Full (§5.1–§5.7) |
| ISO 19650-3 | Operational phase (AIM) | ✅ |
| ISO 19650-5 | Security | ✅ |

---

## Repository Structure

```
AI-for-ISO-19650/
├── CLAUDE.md                  ← Agent identity and project context
├── AGENTS.md                  ← Navigation map for all agents
├── CHECKPOINTS.md             ← Objective criteria for a complete audit
├── requirements.json          ← Requirements loaded from client Excel
├── init.ps1                   ← Environment verification
├── excel_to_json.ps1          ← Excel → requirements.json importer
├── progress/
│   ├── current.md             ← Active session state
│   └── history.md             ← Append-only session log
├── docs/
│   ├── clauses_19650-2.md     ← Clause-by-clause normative reference
│   ├── artefact_checklist.md  ← Verification checklists (EIR, BEP, MIDP, CDE...)
│   └── gap_severity.md        ← HIGH / MEDIUM / LOW risk criteria
└── .claude/agents/
    ├── leader.md              ← Orchestrator
    ├── indexer.md             ← Artefact cataloger
    ├── analyzer.md            ← Evidence mapper (one per clause)
    ├── gap_analyst.md         ← Gap writer
    └── reporter.md            ← Output assembler
```

---

## Roadmap

- [ ] `excel_to_json.ps1` — automated importer for client Excel templates
- [ ] ISO 19650-3 dedicated analyzer (AIR, AIM transition, trigger events)
- [ ] ISO 19650-5 security assessment module
- [ ] HTML report output with interactive clause navigation
- [ ] Multi-project comparison (audit delta between versions)
- [ ] Integration with ACC / BIM 360 document APIs

---

## Contributing

Ideas, feedback and pull requests are welcome.
Read [CONTRIBUTING.md](CONTRIBUTING.md) to get started.

---

## License

MIT © Javier — developed in the context of BIM information management at ACCIONA.

> Every output is a draft for a qualified BIM Manager's review. This system assists audit judgment — it does not replace a certified ISO 19650 auditor.
