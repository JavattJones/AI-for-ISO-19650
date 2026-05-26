# Contributing to AI for ISO 19650

Thanks for your interest. This project is built by one person solving a real BIM audit problem — any help makes it more useful for the ISO 19650 community.

---

## Ways to Contribute

### Share an idea

The easiest way. No coding required.

1. Go to [**Discussions → Ideas**](../../discussions/categories/ideas)
2. Open a new discussion
3. Describe the audit problem you face today, not just the feature you want

Good submissions answer: *"What takes you too long today when auditing ISO 19650 compliance?"*

### Report a bug or a wrong evaluation

If an agent misclassifies a requirement (e.g., marks something as C when it should be NC):

1. Go to [**Discussions → Bug Reports**](../../discussions/categories/bug-reports)
2. Include: the document you audited (anonymized if needed), the requirement ID, the agent's output, and the correct classification with justification
3. Cite the exact ISO 19650 clause

This is the most valuable contribution — the agents improve through real audit feedback.

### Contribute agent definitions or prompts

The agents live in `.claude/agents/`. Improving their evaluation logic is the highest-impact area.

1. Fork the repo
2. Edit the relevant agent `.md` file
3. Test it by running an audit against a real or synthetic project
4. Open a Pull Request describing: what changed, why the previous logic was wrong or incomplete, and what test case confirms the improvement

**Ground rules:**
- One agent change per PR — don't mix analyzer and reporter changes
- Every change to an agent must cite the ISO 19650 clause it addresses
- If changing compliance criteria, open a Discussion first

### Contribute clause reference documentation

The `docs/` folder contains normative reference material. Contributions here help all agents:

- `docs/clauses_19650-2.md` — clause-by-clause breakdown with audit questions
- `docs/artefact_checklist.md` — verification checklists per artefact type
- `docs/gap_severity.md` — risk level criteria

---

## Current Priorities

| Area | What's needed |
|---|---|
| `excel_to_json.ps1` | Excel importer — the project needs a robust parser for common ISO 19650 requirement templates |
| ISO 19650-3 analyzer | Dedicated agent for the operational phase (AIR, AIM, trigger events) |
| ISO 19650-5 module | Security assessment agent (information sensitivity, threat evaluation) |
| Real-world test cases | Anonymized project examples to validate agent accuracy |
| HTML report | Visual output with clause navigation and traffic lights |

---

## Terminology Standards

All contributions must use ISO 19650 normalized terminology:

| Use | Do not use |
|---|---|
| Information container | File / document (when the ISO term applies) |
| Appointing Party | Client / owner |
| Lead Appointed Party | Main contractor |
| Level of Information Need (LOIN) | LOD |
| Common Data Environment (CDE) | BIM platform / cloud |
| Appointed Party | Subcontractor |

---

## Questions?

Open a [Discussion](../../discussions) — no question is too small.
