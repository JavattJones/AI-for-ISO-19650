# Verification — How to confirm an audit is complete and correct

> The Reporter agent uses this document before generating final outputs.
> A human reviewer uses it before delivering results to the client.

---

## V1 — All requirements have a result

```powershell
# Run in the project folder
$req = Get-Content requirements.json -Raw | ConvertFrom-Json
$pending = $req.requirements | Where-Object { $_.status -ne "complete" -and $_.status -ne "blocked" }
if ($pending.Count -gt 0) {
    Write-Host "INCOMPLETE: $($pending.Count) requirements still pending" -ForegroundColor Red
    $pending | ForEach-Object { Write-Host "  - $($_.id) [$($_.status)]" }
} else {
    Write-Host "OK: All requirements have a result" -ForegroundColor Green
}
```

Expected: 0 requirements in `pending` or `analyzing` state.

---

## V2 — Every NC and PC has a gap entry

Check that `progress/gaps_nc_pc.md` contains an entry for every requirement with result `NC` or `PC`:

1. Count NC+PC in `requirements.json`
2. Count NC-XXX + OB-XXX entries in `progress/gaps_nc_pc.md`
3. Numbers must match

If they differ, the Gap Analyst did not process all findings.

---

## V3 — Every gap cites an exact ISO clause

Scan `progress/gaps_nc_pc.md` for the pattern `ISO 19650`. Every gap description must contain at least one clause reference in the form `ISO 19650-X §Y.Y.Y`.

Gaps without clause citations are not acceptable — they cannot be traced to a specific normative requirement.

---

## V4 — The maturity index is correctly calculated

Formula: `(count_C × 100 + count_PC × 50) / count_applicable`

Where `count_applicable` = total requirements − NA requirements.

Verify manually against the counts in the executive report summary.

---

## V5 — Artefact coherence check

Before finalizing, verify that the following cross-artefact checks have been performed:

| Check | What to verify |
|---|---|
| EIR ↔ BEP | LOIN definitions are consistent. Nomenclature conventions match. CDE platform is the same. |
| EIR ↔ MIDP | All delivery milestones in the EIR appear in the MIDP. |
| BEP ↔ MIDP | All deliverables in the MIDP have a responsible team defined in the BEP. |
| BEP roles ↔ Appointments | Every role named in the BEP has a corresponding formal appointment document. |
| Naming convention ↔ CDE files | If CDE files are accessible, sample check that filenames follow the documented convention. |

Incoherences between artefacts must be recorded as NC even if each document individually appears correct.

---

## V6 — Risk levels are justified

Every gap with risk level ALTO must justify why it is ALTO and not MEDIO.
Use `docs/gap_severity.md` as the reference. If a gap is marked ALTO but does not meet the ALTO criteria, downgrade it.

---

## V7 — The outputs are self-consistent

Before delivery, verify:
- The number of NC entries in the traceability table matches the NC-XXX count in the executive report
- The maturity index in the report matches the calculation from the traceability table
- Documents listed under "Documentation reviewed" in the report match `progress/index_artifacts.md`
- No strength listed in "Key strengths" contradicts any NC finding

---

## Final Delivery Checklist

- [ ] V1 passed — no requirements without result
- [ ] V2 passed — all NC/PC have gap entries
- [ ] V3 passed — all gaps cite ISO clauses
- [ ] V4 passed — maturity index verified
- [ ] V5 passed — cross-artefact coherence checked
- [ ] V6 passed — ALTO risks justified
- [ ] V7 passed — outputs are self-consistent
- [ ] `SALIDA_1_trazabilidad.md` reviewed by a qualified BIM Manager
- [ ] `SALIDA_2_informe.md` reviewed by a qualified BIM Manager
