# Template Cleanup Guide: Removing SYNTHAI Example Data

**Purpose:** Convert this repository from "template + examples" to "pure template" for starting a new book project.

**Time Required:** 15-30 minutes (manual) OR 2 minutes (automated script)

**Date:** 2025-11-07

---

## 🎯 What This Guide Does

This guide shows you how to remove all SYNTHAI example data to create a clean template for your own book project.

**After cleanup, you'll have:**
- ✅ Empty pipeline structure (0% complete)
- ✅ Generic checklists without SYNTHAI examples
- ✅ Clean trackers ready for your data
- ✅ No example validation reports
- ✅ Fresh metrics (all zeros)
- ✅ Generic documentation only

---

## 🚀 Quick Start: Automated Cleanup

**Option 1: Run the cleanup script (Recommended)**

```bash
cd /home/user/book-production-pipeline-template
bash operations/pipeline/scripts/cleanup-synthai-examples.sh
```

This script will:
1. Remove all -EXAMPLE files
2. Strip SYNTHAI sections from documentation
3. Reset metrics-summary.json to template state
4. Update CONTINUATION-PLAN.md to generic state
5. Clean README.md examples
6. Create backup before making changes

**Then proceed to:** [Customization Guide](#customization-for-your-project)

---

## 📋 Manual Cleanup Process

If you prefer to understand and control each step, follow this manual process.

---

## Step 1: Delete Example Files (2 files)

These files are pure SYNTHAI examples meant for reference only. Delete them entirely.

```bash
# Delete example validation reports
rm operations/validation/gate-validation/phase-5-entry-passed-EXAMPLE.md
rm operations/validation/chapter-validation/narrative-quality/chapter-01-pass2-nq-EXAMPLE.md
```

**Result:** Example files removed. Your own validation reports will go in these directories later.

---

## Step 2: Reset Metrics (1 file)

**File:** `operations/validation/quality-metrics/metrics-summary.json`

**Action:** Remove the entire `example_data` section (lines 189-238)

**Before (contains SYNTHAI data):**
```json
  },
  "example_data": {
    "note": "The following is example data from a completed project (SYNTHAI)...",
    "synthai_example": {
      "pipeline": {
        "overall_completion": 86,
        ...
      }
    }
  }
}
```

**After (clean template):**
```json
  }
}
```

**Command:**
```bash
# Use sed to remove example_data section
sed -i '/^  "example_data":/,/^  }$/d' operations/validation/quality-metrics/metrics-summary.json
# Fix the trailing comma before the deleted section
sed -i 's/,$//' operations/validation/quality-metrics/metrics-summary.json
```

---

## Step 3: Clean Documentation Files (23 files)

These files have SYNTHAI example sections embedded. Remove only the example sections, keep the template content.

### 3.1 Pipeline Hub Files (3 files)

#### **operations/pipeline/STAGE-GATES-REFERENCE.md**

**Remove these example blocks:**

**Line 196-201** (Example section in Phase 6 entry gate):
```markdown
**Example (SYNTHAI):**
- 21/21 chapters written ✅
- Pass 2 NQ validation: 4.86/5.0 ✅
- Copyedit: ⏸ Pending (2-4 hours)
- Narration format: ⏸ Pending (1-2 hours)
```

**Line 347-349** (Phase 3 example):
```markdown
**Example (SYNTHAI):** ~1.4M words of preparation docs (28 master documents)
```

**Line 407-416** (Phase 5 example):
```markdown
**Example (SYNTHAI):**
- ✅ 21/21 chapters written (100%)
- ✅ 87,234 words (meets target)
- ✅ Pass 2 NQ: 4.86/5.0 (exceeds 4.5 threshold)
- ✅ Zero flagged chapters
- ⏸ Copyedit: Pending (2-4 hours)
- ⏸ Narration format: Pending (1-2 hours)
- **Status:** 4/6 criteria met (67%)
```

**Line 640-645** (Validation gate example):
```markdown
**Example (SYNTHAI):**
- Average NQ score: 4.86/5.0 ✅
- All chapters ≥ 4.0 ✅
- Highest score: 5.0/5.0 (multiple chapters)
- Lowest score: 4.5/5.0
```

**Action:** Delete all blocks starting with `**Example (SYNTHAI):**`

---

#### **operations/pipeline/CRITICAL-PATH-TRACKER.md**

**Keep:** Lines 1-56 (template structure)
**Remove:** Lines 57-265 (entire SYNTHAI example section)

**Delete this entire section:**
```markdown
## 🔍 Example: Critical Path Analysis (SYNTHAI Project)

> **Note:** This is an example from a completed project...

[Lines 57-265 - entire detailed SYNTHAI walkthrough]
```

**Keep the template structure at the top:**
```markdown
## 🚧 CURRENT BLOCKER: Project Start

**Blocker:** No blockers - Project ready to begin
**Phase:** Phase 1 (Ideation)
**Status:** Ready to start
```

---

#### **operations/pipeline/DECISION-LOG.md**

**Action:** Check if there are SYNTHAI-specific decisions logged. If the file has a "Decision 001: Waive Pass 1 Validation" entry with SYNTHAI data, you can either:
- Delete specific SYNTHAI decisions
- Keep as examples (they're instructive)
- Leave blank for your own decisions

**Recommendation:** Keep the structure, delete specific decision entries, leaving just the template.

---

### 3.2 Phase Tracking Files (9 files)

Most phase trackers are mostly template. Only Phase 5 is heavily SYNTHAI-populated.

#### **operations/phase-tracking/Phase-5-Text-TRACKER.md**

This file is **heavily SYNTHAI**. Replace with template version.

**Remove:**
- Lines 3-7: SYNTHAI status
- Lines 40-79: Complete chapter table with SYNTHAI data
- Lines 155-180: SYNTHAI validation scores
- Lines 226-249: SYNTHAI lessons learned

**Replace with template placeholders:**

```markdown
# Phase 5: Text Production - Tracker

**Phase Status:** ⚪ Not Started
**Entry Gate:** ⏸ Pending
**Exit Gate:** ⏸ Pending
**Completion:** 0%

**Last Updated:** [Date]

---

## 📊 Phase Overview

**Purpose:** Write the complete manuscript from first draft to publication-ready text.

**Typical Duration:** 200-500 hours (highly variable)

**Key Question:** *Is my manuscript complete, validated, and ready for the next phase?*

---

## 🚪 Entry Criteria

**Status:** ⏸ 0/5 criteria met (0%) - NOT STARTED

- [ ] **Writing templates ready** - Have chapter templates, outlines
- [ ] **AI prompts prepared** - Have prompts for AI-assisted writing
- [ ] **Quality frameworks in place** - Know how to validate quality
- [ ] **Chapter structure defined** - Know chapter count, rough word counts
- [ ] **Writing schedule created** - Have plan for completing text

**Entry Gate:** ⏸ PENDING (Phase 4 not complete)

---

## 🎯 Phase Deliverables

**Status:** ⏸ 0/[X] deliverables complete (0%)

### Chapter Status

| Chapter | Title | Word Count | Status | Validation | Notes |
|---------|-------|------------|--------|------------|-------|
| 01 | [TODO] | — | ⏸ Not Started | — | — |
| 02 | [TODO] | — | ⏸ Not Started | — | — |
| ... | ... | ... | ... | ... | ... |

**Total Word Count:** 0 words (Target: [YOUR_TARGET])

**Average Pass 2 NQ Score:** — (Target: ≥4.5)

**Chapters Flagged for Refinement:** —

---

## 🚪 Exit Criteria

**Status:** ⏸ 0/6 criteria met (0%)

- [ ] **All chapters written** - [X]/[X] chapters complete
- [ ] **Word count target met** - [CURRENT] words (target: [TARGET])
- [ ] **Validation passed** - Pass 2 NQ average: — (≥4.5 required)
- [ ] **Zero chapters flagged for refinement**
- [ ] **Final copyedit complete**
- [ ] **Manuscript formatted**

**Exit Gate:** ⏸ NOT STARTED

---

## 🤖 AI-Driven vs 🙋 Manual Tasks

### [AI-DRIVEN] Tasks

**Writing Phase:**
- [ ] Draft chapters using templates and prompts
- [ ] Refine chapters based on validation
- [ ] Conduct Pass 2 NQ validation
- [ ] Address validation feedback
- [ ] Generate chapter summaries
- [ ] Cross-reference consistency checks

**Validation Phase:**
- [ ] Pass 2 validation (8 NQ dimensions)
- [ ] Quality reports for all chapters

**Total AI Time:** [Estimate: 160-400 hours]

---

### [MANUAL] Tasks

**Writing Phase:**
- [ ] Review and approve chapters
- [ ] Provide feedback for refinement
- [ ] Validate character consistency
- [ ] Verify plot continuity

**Completion Phase:**
- [ ] Complete final copyedit (2-4 hours)
- [ ] Format manuscript (1-2 hours)

**Total Manual Time:** [Estimate: 40-80 hours]

---

## 📈 Quality Metrics

### Validation Summary

**Pass 2 Narrative Quality (NQ) Scores:**
- **Act I Average:** — (Target: ≥4.5)
- **Act II Average:** — (Target: ≥4.5)
- **Overall Average:** — (Target: ≥4.5)

**Quality Gate Status:**
- [ ] All chapters ≥ 4.0/5.0 (minimum threshold)
- [ ] Average ≥ 4.5/5.0 (publication threshold)
- [ ] Zero chapters flagged for refinement

---

## 🔗 Dependencies

**Prerequisites:**
- Phase 4 (Utilities) exit gate must pass

**Blocks:**
- Phase 6 (Audio Production) cannot start until Phase 5 exits

**Current Blocker:** Phase 4 not complete

---

## 🚧 Current Status & Blockers

**Status:** ⚪ Not Started

**Blockers:**
1. ⏸ Phase 4 (Utilities) must complete first

**Next Actions:**
1. Complete Phase 4 deliverables
2. Validate Phase 4 exit gate
3. Begin Phase 5 entry validation

---

## 🔗 Related Documents

- [5-text/ directory](../../5-text/) - All chapters and drafts
- [Validation Reports](../validation/chapter-validation/) - Quality assessments
- [Stage-Gate Reference](../pipeline/STAGE-GATES-REFERENCE.md) - Gate E5 & X5
- [Phase 6 Tracker](./Phase-6-Audio-TRACKER.md) - Next phase

---

**Phase 5 is ready to begin once Phase 4 completes.**
```

---

#### **operations/phase-tracking/Phase-3-Preparation-TRACKER.md**

**Remove line ~40-50:** SYNTHAI example with "~1.4M words" reference

---

#### **operations/phase-tracking/Phase-6-Audio-TRACKER.md**

**Remove:** Any references to SYNTHAI being "NOT STARTED" or "blocked by Phase 5"

**Replace with:** Generic "Phase 5 must complete first"

---

**Other phase trackers (1, 2, 4, 7-9):** Already mostly template, minimal changes needed. Just search and remove any "SYNTHAI" mentions.

---

### 3.3 Phase 5 Detailed Files (6 files in 5-text/)

#### **5-text/ENTRY-CRITERIA-CHECKLIST.md**

**Remove lines 109-122:** Entire SYNTHAI example section

```markdown
## 📝 Example: SYNTHAI Project

**Entry criteria status on 2025-06-15:**
[... delete entire section ...]
```

---

#### **5-text/EXIT-CRITERIA-CHECKLIST.md**

**Remove:** SYNTHAI example section (if present)

---

#### **5-text/AI-TASKS.md**

**Remove:** Any SYNTHAI-specific task examples

**Keep:** Generic AI task lists

---

#### **5-text/MANUAL-TASKS.md**

**Remove:** Any SYNTHAI-specific task examples

**Keep:** Generic manual task lists

---

#### **5-text/DELIVERABLES-CHECKLIST.md**

**Remove:** SYNTHAI-specific deliverable counts (21 chapters, 87K words)

**Replace with:** `[TODO: Your chapter count]`, `[TODO: Your target word count]`

---

#### **5-text/PHASE-OVERVIEW.md**

**Check for:** SYNTHAI references (likely clean)

---

### 3.4 Preparation Phase Files (7 files in 3-preparation/)

**Files:**
- `3-preparation/README.md`
- `3-preparation/masters/README.md`
- `3-preparation/quality-frameworks/README.md`
- `3-preparation/references/README.md`
- `3-preparation/blueprints/README.md`
- `3-preparation/guides/README.md`
- `3-preparation/architectures/README.md`

**Action:** Search for "SYNTHAI" or "1.4M words" references

**Remove:** Example references like:
```markdown
**Example:** SYNTHAI has 28 master documents totaling ~1.4M words
```

**Replace with:** Generic guidance

---

### 3.5 Other Phase Files (3 files)

#### **1-ideation/README.md**

**Remove line ~40-50:** SYNTHAI business fiction example

```markdown
### Example: SYNTHAI (Business Fiction)
- Focus: AI ethics in tech startup
- ...
```

---

#### **2-research/README.md**

**Remove:** SYNTHAI comparable titles example

---

#### **metrics/README.md**

**Remove lines 173-177:** SYNTHAI example metrics

```markdown
### For SYNTHAI (Business Fiction)
- 28 preparation documents (3-preparation/)
- 21 chapters (5-text/chapters/)
- ...
```

---

### 3.6 Root Files (2 files)

#### **README.md**

**Remove lines 153-156:** SYNTHAI use case example

```markdown
### Business Fiction (like SYNTHAI)
- Heavy 3-preparation/ (world-building, frameworks)
- Extensive 2-research/ (industry research, comp titles)
- Detailed 9-marketing/ (whitepapers, LinkedIn, Substack)
```

**Keep:** Other use case examples (memoir, non-fiction, poetry)

---

#### **operations/CONTINUATION-PLAN.md**

**Decision:** This file documents the creation of the operations system itself.

**Option A:** Delete entirely (it's about building the system, not using it)

**Option B:** Keep as historical reference (shows how system was built)

**Recommendation:** Delete or move to `archive/` since it's not needed for template users

```bash
mv operations/CONTINUATION-PLAN.md archive/system-development-history.md
```

---

## Step 4: Reset Pipeline Status

After removing SYNTHAI data, reset the pipeline to initial state.

```bash
cd operations/pipeline/scripts
./update-pipeline-status.sh
```

This will regenerate `PIPELINE-STATUS-DASHBOARD.md` with:
- 0% completion
- Phase 1 ready to start
- No blockers
- All gates pending

---

## 📋 Cleanup Checklist

Use this checklist to track your cleanup progress:

### Files to Delete
- [ ] `operations/validation/gate-validation/phase-5-entry-passed-EXAMPLE.md`
- [ ] `operations/validation/chapter-validation/narrative-quality/chapter-01-pass2-nq-EXAMPLE.md`
- [ ] `operations/CONTINUATION-PLAN.md` (optional - move to archive)

### Files to Edit (Remove SYNTHAI sections)
- [ ] `operations/validation/quality-metrics/metrics-summary.json` (remove example_data)
- [ ] `operations/pipeline/STAGE-GATES-REFERENCE.md` (remove 4 example blocks)
- [ ] `operations/pipeline/CRITICAL-PATH-TRACKER.md` (remove lines 57-265)
- [ ] `operations/pipeline/DECISION-LOG.md` (remove SYNTHAI decisions)
- [ ] `operations/phase-tracking/Phase-5-Text-TRACKER.md` (major rewrite - use template above)
- [ ] `operations/phase-tracking/Phase-3-Preparation-TRACKER.md` (remove examples)
- [ ] `operations/phase-tracking/Phase-6-Audio-TRACKER.md` (remove SYNTHAI references)
- [ ] `5-text/ENTRY-CRITERIA-CHECKLIST.md` (remove example section)
- [ ] `5-text/EXIT-CRITERIA-CHECKLIST.md` (check for examples)
- [ ] `5-text/AI-TASKS.md` (check for examples)
- [ ] `5-text/MANUAL-TASKS.md` (check for examples)
- [ ] `5-text/DELIVERABLES-CHECKLIST.md` (replace with placeholders)
- [ ] `3-preparation/README.md` (remove examples)
- [ ] `3-preparation/masters/README.md` (remove examples)
- [ ] `3-preparation/quality-frameworks/README.md` (check for examples)
- [ ] `3-preparation/references/README.md` (check for examples)
- [ ] `3-preparation/blueprints/README.md` (check for examples)
- [ ] `3-preparation/guides/README.md` (check for examples)
- [ ] `3-preparation/architectures/README.md` (check for examples)
- [ ] `1-ideation/README.md` (remove SYNTHAI use case)
- [ ] `2-research/README.md` (remove SYNTHAI examples)
- [ ] `metrics/README.md` (remove SYNTHAI metrics section)
- [ ] `README.md` (remove "Business Fiction (like SYNTHAI)" section)

### Verification Steps
- [ ] Run `grep -r "SYNTHAI" --include="*.md" .` → Should return 0 results
- [ ] Run `grep -r "synthai" --include="*.json" .` → Should return 0 results
- [ ] Run `operations/pipeline/scripts/update-pipeline-status.sh` → Should show 0% complete
- [ ] Check `PIPELINE-STATUS-DASHBOARD.md` → Should show fresh project state
- [ ] Review `metrics-summary.json` → Should have no example_data section

---

## 🤖 Automated Cleanup Script

Save time with this automated script that performs all cleanup steps.

**Location:** `operations/pipeline/scripts/cleanup-synthai-examples.sh`

*[Script will be created in the next step]*

---

## 🎯 Customization for Your Project

After cleanup, customize the template for your book:

### 1. Update Project Metadata

**File:** `operations/validation/quality-metrics/metrics-summary.json`

```json
{
  "project": {
    "name": "My Book Title",  ← Change this
    "last_updated": "2025-11-07T00:00:00Z",
    "pipeline_version": "1.0"
  },
  ...
}
```

### 2. Set Chapter Count and Word Count Targets

**File:** `5-text/DELIVERABLES-CHECKLIST.md`

```markdown
**Chapters:** [TODO: Your chapter count, e.g., 15 chapters]
**Target Word Count:** [TODO: Your target, e.g., 70,000-80,000 words]
```

### 3. Define Your Book Structure

**File:** `3-preparation/blueprints/chapter-outline.md` (create this)

```markdown
# Chapter Outline

## Act I: [Your Act Title]
- Chapter 1: [Title] - [Brief description]
- Chapter 2: [Title] - [Brief description]
...
```

### 4. Update Phase 5 Tracker

**File:** `operations/phase-tracking/Phase-5-Text-TRACKER.md`

Update the chapter table with your chapter titles:

```markdown
| Chapter | Title | Word Count | Status | Validation | Notes |
|---------|-------|------------|--------|------------|-------|
| 01 | [Your Chapter 1 Title] | — | ⏸ Not Started | — | — |
| 02 | [Your Chapter 2 Title] | — | ⏸ Not Started | — | — |
```

### 5. Customize Quality Thresholds (Optional)

If your project has different quality standards:

**File:** `operations/QA-System/QA-System-Complete-Reference.md`

Adjust thresholds:
```markdown
**Pass Criteria:** ≥ 80% of checklist items passing  ← Adjust as needed
```

---

## ✅ Verification

After cleanup, verify the template is clean:

### Quick Check
```bash
# Should return 0 results (or only this guide)
grep -r "SYNTHAI" --include="*.md" . | grep -v "TEMPLATE-CLEANUP-GUIDE.md"
grep -r "synthai" --include="*.json" .
```

### Pipeline Status Check
```bash
cd operations/pipeline/scripts
./generate-pipeline-report.sh
```

**Expected output:**
```
Pipeline Status Report
======================
Overall Completion: 0%
Current Phase: Phase 1 (Ideation)
Status: Not Started
Blockers: None - Ready to begin
```

---

## 🎉 Success!

You now have a **pure template** ready for your book project!

**Next steps:**
1. ✅ Start Phase 1 (Ideation) - Define your concept
2. ✅ Use `./get-ai-tasks.sh 1` to see what Claude can help with
3. ✅ Use `./get-manual-tasks.sh 1` to see what you do independently
4. ✅ Track progress in phase trackers
5. ✅ Run `./update-pipeline-status.sh` after completing work

---

## 📚 Additional Resources

- [Phase 1 Tracker](../operations/phase-tracking/Phase-1-Ideation-TRACKER.md) - Start here
- [Pipeline Status Dashboard](../operations/pipeline/PIPELINE-STATUS-DASHBOARD.md) - Track progress
- [Stage-Gate Reference](../operations/pipeline/STAGE-GATES-REFERENCE.md) - Understand gates
- [QA System Reference](../operations/QA-System/QA-System-Complete-Reference.md) - Quality standards

---

**Template cleanup complete! Ready to start your book project! 📚✨**
