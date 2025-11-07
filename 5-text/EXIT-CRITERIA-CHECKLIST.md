# Phase 5: Text Production - Exit Criteria

**Purpose:** Verify manuscript is complete and ready for the next phase.

**Last Updated:** [Update when checking]

---

## ✅ Exit Criteria Checklist

### 1. All Chapters Written

- [ ] **Chapter count matches target** - All planned chapters complete
- [ ] **No placeholder chapters** - Every chapter is fully written
- [ ] **Word count per chapter** - Chapters within target range (3K-5K words typical)
- [ ] **Complete narrative** - Story/content arc finished (beginning, middle, end)

**Current Status:** [ ] / [ ] chapters complete (0%)

**Target:** 21 chapters (example)

**How to verify:**
```bash
cd operations/pipeline/scripts
./update-chapter-metrics.sh
```

---

### 2. Word Count Target Met

- [ ] **Total word count ≥ target** - Manuscript meets genre/audience expectations
- [ ] **Not drastically over target** - <20% over (indicates scope creep)
- [ ] **Consistent chapter lengths** - No chapters too short (<2K) or too long (>7K)

**Current Status:** [ ] words (Target: [ ] words)

**Target Range:** 70,000-100,000 words (adjust for your genre)

**How to verify:** Run `./update-chapter-metrics.sh` (shows total word count)

---

### 3. Validation Passed

- [ ] **All chapters validated** - Pass 2 NQ validation run on every chapter
- [ ] **Average score ≥4.5/5.0** - Meets publication quality threshold
- [ ] **No chapters below 4.0** - Minimum acceptable quality
- [ ] **Validation reports generated** - Reports saved in `operations/validation/`

**Current Status:**
- Chapters validated: [ ] / [ ] (0%)
- Average NQ score: [ ] (Target: ≥4.5)
- Chapters below 4.0: [ ]

**How to verify:** Check validation reports in `operations/validation/chapter-validation/narrative-quality/`

---

### 4. Zero Chapters Flagged for Refinement

- [ ] **All chapters meet standards** - No chapters scored below 4.5
- [ ] **Refinement rounds complete** - Low-scoring chapters improved and re-validated
- [ ] **Consistency across acts** - Quality maintained throughout manuscript

**Current Status:** [ ] chapters flagged (Target: 0)

**How to verify:** Review validation reports, confirm all ≥4.5

---

### 5. Final Copyedit Complete

- [ ] **Proofread entire manuscript** - Read through all chapters for errors
- [ ] **Typos fixed** - Grammar, spelling, punctuation corrected
- [ ] **Consistency verified** - Character names, dates, facts consistent
- [ ] **Style guide applied** - Formatting, voice, tone consistent

**Current Status:** ⏸ Not Started

**Time Required:** 2-4 hours (or outsource for $500-$1,500)

**How to verify:** Manually check or receive copyeditor's report

**SYNTHAI Example (BLOCKER):**
- Status: ⏸ Pending (2-4 hours manual work)
- This criterion is currently blocking Phase 5 exit

---

### 6. Manuscript Formatted

- [ ] **Formatted for next phase** - Ready for audio narration or publication
- [ ] **Chapter markers added** - Clear chapter breaks
- [ ] **Extraneous formatting removed** - Clean, professional presentation
- [ ] **File format correct** - Markdown, Word Doc, or required format

**Current Status:** ⏸ Not Started

**Time Required:** 1-2 hours

**How to verify:** Review formatted manuscript file

**SYNTHAI Example (BLOCKER):**
- Status: ⏸ Pending (1-2 hours manual work)
- Need: Add chapter markers for narration
- This criterion is currently blocking Phase 5 exit

---

## 📊 Exit Gate Status

**Criteria Met:** [ ] / 6 (0%)

**Can Exit Phase 5?** ⏸ Not Yet

**Target:** 6/6 (100%) to pass gate

---

## 🚧 Current Blockers

**Example (SYNTHAI Project Status):**

**Passed Criteria (4/6):**
- ✅ All 21 chapters written (100%)
- ✅ Word count: 87,234 words (target: 70K-90K)
- ✅ Pass 2 NQ validation: 4.86/5.0 average (exceeds 4.5 threshold)
- ✅ Zero chapters flagged (all ≥4.5)

**Pending Criteria (2/6):**
- ⏸ Final copyedit NOT complete (2-4 hours manual work)
- ⏸ Manuscript formatting NOT done (1-2 hours manual work)

**Estimated Time to Pass:** 3-6 hours manual work

---

## 🎯 Next Actions

**To pass Phase 5 exit gate:**

1. **Complete copyedit** [MANUAL, 2-4 hours]
   - Read through all 21 chapters
   - Fix typos, grammar, consistency issues
   - Apply style guide
   - Mark complete: `./mark-task-complete.sh 5 copyedit`

2. **Format manuscript** [MANUAL, 1-2 hours]
   - Add chapter markers
   - Clean formatting for narration/publication
   - Export in required format
   - Mark complete: `./mark-task-complete.sh 5 format`

3. **Validate exit gate**
   ```bash
   ./check-phase-gates.sh 5 exit
   ```

4. **If gate passes, mark as passed**
   ```bash
   # Document in decision log
   # Create gate passage record
   ```

5. **Proceed to Phase 6 (Audio) or Phase 8 (Publication)**

---

## 🔗 Related Documents

- [Phase 5 Tracker](../operations/phase-tracking/Phase-5-Text-TRACKER.md) - Detailed status
- [Phase 6 Entry Criteria](../6-audio/ENTRY-CRITERIA-CHECKLIST.md) - Next phase (if doing audiobook)
- [Stage-Gate Reference](../operations/pipeline/STAGE-GATES-REFERENCE.md) - Gate X5 definition
- [Validation Reports](../operations/validation/chapter-validation/narrative-quality/) - Quality assessments

---

**All exit criteria must pass before proceeding to Phase 6 or Phase 8. Take time to complete copyedit and formatting.**
