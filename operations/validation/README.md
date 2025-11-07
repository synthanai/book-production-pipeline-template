# operations/validation/

**Purpose:** Quality validation reports, gate passage records, and aggregated metrics.

---

## 📂 Directory Structure

```
validation/
├── README.md                           # This file
├── chapter-validation/                 # Chapter-level quality validation
│   ├── narrative-quality/             # Pass 2 NQ validation reports
│   │   └── [Example reports]
│   └── detailed-validation/            # Pass 1 148D validation reports (optional)
│       └── [Example reports]
├── gate-validation/                    # Phase gate passage records
│   ├── phase-1-gate-passed.md         # Phase 1 entry/exit gate records
│   ├── phase-2-gate-passed.md
│   └── [... all 9 phases]
└── quality-metrics/                    # Aggregated metrics and dashboards
    ├── metrics-summary.json            # Machine-readable metrics
    └── validation-summary.md           # Human-readable summary
```

---

## 📋 Validation Types

### Chapter Validation
**Location:** `chapter-validation/`

**Purpose:** Validate individual chapter quality using AI-assisted validation frameworks.

**Validation Tiers:**

**Pass 1: Detailed Validation (148 Dimensions)**
- Location: `chapter-validation/detailed-validation/`
- 148 quality dimensions across multiple categories
- Very granular, time-intensive (2-4 hours per chapter)
- Typically used for early chapters or high-stakes projects
- Optional for most projects (can waive if Pass 2 scores are consistently high)

**Pass 2: Narrative Quality (8 Dimensions)**
- Location: `chapter-validation/narrative-quality/`
- 8 core narrative quality dimensions
- Faster validation (30-60 minutes per chapter)
- Required for Phase 5 exit gate
- Dimensions: Character Development, Plot Coherence, Pacing, Dialogue Quality, Descriptive Quality, Emotional Impact, Thematic Consistency, Overall Engagement

**Validation Report Format:**
Each chapter gets a validation report with:
- Scores for each dimension (1-5 scale)
- Average score (must be ≥4.5 for publication quality)
- Strengths and weaknesses
- Refinement recommendations (if scores <4.5)
- Overall assessment (Pass/Refine)

---

### Gate Validation
**Location:** `gate-validation/`

**Purpose:** Document phase gate passage decisions and rationale.

**What to Document:**
- Date gate was passed
- Which gate (entry or exit)
- Criteria that were met
- Criteria that were waived (if any)
- Decision maker (author, collaborative)
- Rationale for passage or waiver

**File Naming:**
- `phase-1-entry-passed.md` - Phase 1 entry gate
- `phase-1-exit-passed.md` - Phase 1 exit gate
- `phase-2-entry-passed.md` - Phase 2 entry gate
- ... and so on for all 9 phases (18 gate records total)

**Example Use:**
When Phase 5 exit gate is passed:
1. Create `phase-5-exit-passed.md` documenting decision
2. Include criteria met, any waivers, and next phase unblocked
3. Link to relevant validation reports (Pass 2 NQ reports)

---

### Quality Metrics
**Location:** `quality-metrics/`

**Purpose:** Aggregated metrics and dashboards for project-wide visibility.

**Files:**

**metrics-summary.json** (Machine-readable)
- Overall pipeline completion percentage
- Phase-by-phase status
- Gate passage counts
- Quality scores (aggregated)
- Blocker status
- Updated by automation scripts

**validation-summary.md** (Human-readable)
- High-level validation summary
- Key quality metrics
- Validation history
- Decisions and waivers
- Updated manually or by scripts

---

## 🔄 Validation Workflow

### During Writing (Phase 5)

1. **Write chapter** using templates and AI assistance

2. **Run Pass 2 NQ validation** on completed chapter
   ```bash
   # This is an example workflow - actual validation done with Claude
   # Generate validation report for chapter
   ```

3. **Review validation report**
   - If average score ≥4.5: Chapter passes
   - If average score <4.5: Refine chapter, re-validate

4. **Save validation report** to `chapter-validation/narrative-quality/`
   - Filename: `chapter-01-pass2-nq.md`

5. **Update metrics** (manually or via script)
   ```bash
   cd operations/pipeline/scripts
   ./update-chapter-metrics.sh
   ```

---

### At Gate Passages

1. **Check gate criteria**
   ```bash
   cd operations/pipeline/scripts
   ./check-phase-gates.sh <phase> [entry|exit]
   ```

2. **If all criteria met:**
   - Create gate passage record in `gate-validation/`
   - Document decision in `../pipeline/DECISION-LOG.md`
   - Update pipeline dashboard

3. **If criteria waived:**
   - Document waiver rationale in gate record
   - Document in `../pipeline/DECISION-LOG.md`
   - Note risks and mitigation

4. **Update metrics**
   ```bash
   ./update-pipeline-status.sh
   ```

---


**Phase 5 (Text Production) Validation Summary:**

**Chapters Validated:** 21/21 (100%)
**Validation Tier:** Pass 2 NQ (8 dimensions)
**Average Score:** 4.86/5.0 ✅
**Threshold:** ≥4.5/5.0
**Chapters Flagged:** 0
**Status:** ✅ PASSED

**Validation Decisions:**
- ✅ Pass 2 NQ validation completed for all 21 chapters
- ⏸ Pass 1 (148D) validation waived for Acts III-IV based on high Pass 2 scores
- Decision documented in `../pipeline/DECISION-LOG.md`

**Reports:**
- Acts I-IV Pass 2 NQ reports: `chapter-validation/narrative-quality/`
- Acts I-II Pass 1 (148D) reports: `chapter-validation/detailed-validation/`

---

## 🛠️ Automation Scripts

Validation system integrates with pipeline automation scripts:

**update-chapter-metrics.sh**
- Scans `chapter-validation/` for validation reports
- Aggregates scores into `quality-metrics/metrics-summary.json`
- Updates pipeline dashboard

**check-phase-gates.sh**
- Validates gate criteria using metrics from `quality-metrics/`
- Checks validation scores against thresholds
- Returns PASS/FAIL/PENDING status

**validate-gate-criteria.sh**
- Checks specific gate criteria
- Uses validation data to determine if criteria met
- Returns blockers if criteria not met

---

## 📝 Validation Report Templates

### Pass 2 NQ Validation Template

Create file: `chapter-validation/narrative-quality/chapter-XX-pass2-nq.md`

```markdown
# Chapter XX: [Chapter Title] - Pass 2 NQ Validation

**Date:** YYYY-MM-DD
**Validator:** AI-Assisted + Author Review
**Status:** [PASS / REFINE]

---

## Narrative Quality Scores (8 Dimensions)

| Dimension | Score | Notes |
|-----------|-------|-------|
| Character Development | X.X/5.0 | [Strengths/weaknesses] |
| Plot Coherence | X.X/5.0 | [Strengths/weaknesses] |
| Pacing | X.X/5.0 | [Strengths/weaknesses] |
| Dialogue Quality | X.X/5.0 | [Strengths/weaknesses] |
| Descriptive Quality | X.X/5.0 | [Strengths/weaknesses] |
| Emotional Impact | X.X/5.0 | [Strengths/weaknesses] |
| Thematic Consistency | X.X/5.0 | [Strengths/weaknesses] |
| Overall Engagement | X.X/5.0 | [Strengths/weaknesses] |

**Average Score:** X.X/5.0
**Threshold:** ≥4.5/5.0
**Result:** [PASS / REFINE]

---

## Strengths
- [Key strength 1]
- [Key strength 2]
- [Key strength 3]

## Areas for Improvement
- [Weakness 1 + recommendation]
- [Weakness 2 + recommendation]

## Overall Assessment
[Summary of chapter quality and any refinement needed]

---

**Next Steps:**
- [ ] If PASS: No action needed, proceed to next chapter
- [ ] If REFINE: Address noted weaknesses, re-validate
```

---

### Gate Passage Record Template

Create file: `gate-validation/phase-X-[entry|exit]-passed.md`

```markdown
# Phase X: [Phase Name] - [Entry/Exit] Gate Passed

**Date Passed:** YYYY-MM-DD
**Decision Maker:** [Author / Collaborative]
**Next Phase Unblocked:** Phase [X+1]

---

## Criteria Met

- [x] **Criterion 1** - [Evidence/measurement]
- [x] **Criterion 2** - [Evidence/measurement]
- [x] **Criterion 3** - [Evidence/measurement]

## Criteria Waived (if any)

- [ ] **Criterion X** - [Rationale for waiver]
  - **Risks:** [What could go wrong]
  - **Mitigation:** [How risks are handled]

---

## Supporting Evidence

- [Link to relevant documents/reports]
- [Metrics that support passage]
- [Validation reports]

## Rationale

[Why this gate was passed, any decisions made, context]

---

## Impact

**Unblocked:** Phase [X+1] can now begin
**Updated:** Pipeline dashboard, metrics-summary.json
**Logged:** Decision logged in DECISION-LOG.md

---

**Gate passage confirmed. Proceed to Phase [X+1].**
```
**Purpose:** Validation reports and quality check results

---

## 📋 Overview

This directory stores all validation reports for chapters and content. Reports are organized by chapter and validation pass level.

---

## 📂 File Organization

### Naming Convention

```
chapter-[XX]-pass[1/2/3].md          # Individual pass reports
chapter-[XX]-validation-complete.md   # Final validation summary
act-[X]-validation-summary.md         # Act-level summaries
```

### Example Structure

```
validation/
├── chapter-01-pass1.md
├── chapter-01-pass2.md
├── chapter-01-pass3.md
├── chapter-01-validation-complete.md
├── chapter-02-pass1.md
├── chapter-02-pass2.md
├── act-1-validation-summary.md
└── README.md
```

---

## 🔍 Validation Pass Levels

### Pass 1: Structural Validation
- Basic structure and completeness
- Technical formatting
- Scene presence and transitions
- Files: `chapter-XX-pass1.md`

### Pass 2: Content Validation
- Narrative quality
- Character consistency
- Plot coherence
- Pacing and flow
- Files: `chapter-XX-pass2.md`

### Pass 3: Polish Validation
- Prose quality
- Grammar and mechanics
- Final polish
- Publication readiness
- Files: `chapter-XX-pass3.md`

---

## 📝 Report Templates

Use the template from [QA-System-Complete-Reference.md](../QA-System/QA-System-Complete-Reference.md) for all validation reports.

---

## 🎯 Usage Guidelines

### Creating Validation Reports

1. Complete chapter/content
2. Run appropriate validation pass
3. Document findings in report
4. Store in this directory
5. Update CHAPTER-PROGRESS-TRACKER.md

### Report Contents

All reports should include:
- Overall assessment and score
- Dimension scores (structure, characters, etc.)
- Checklist results
- Issues identified (critical, major, minor)
- Strengths and improvements
- Recommendations

---

## 📊 Tracking Validation

Track validation status in:
- [../current/CHAPTER-PROGRESS-TRACKER.md](../current/CHAPTER-PROGRESS-TRACKER.md)
- [../current/STATISTICS-DASHBOARD.md](../current/STATISTICS-DASHBOARD.md)

---

## 🔗 Related Documents

- [Pipeline Status Dashboard](../pipeline/PIPELINE-STATUS-DASHBOARD.md) - Overall pipeline status
- [Stage-Gate Reference](../pipeline/STAGE-GATES-REFERENCE.md) - Gate definitions and criteria
- [Decision Log](../pipeline/DECISION-LOG.md) - Gate passage decisions and waivers
- [Phase Trackers](../phase-tracking/) - Individual phase status

---

**This validation system provides quality assurance and gate passage documentation for your book production pipeline.**
- [../QA-System/QA-System-Complete-Reference.md](../QA-System/QA-System-Complete-Reference.md) - Complete QA system documentation
- [../../3-preparation/quality-frameworks/](../../3-preparation/quality-frameworks/) - Quality standards

---

**Keep validation reports for reference and quality tracking.**
