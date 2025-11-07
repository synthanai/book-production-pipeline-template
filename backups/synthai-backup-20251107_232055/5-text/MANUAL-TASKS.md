# Phase 5: Text Production - Manual Tasks

**Purpose:** Tasks the author can complete independently without AI assistance.

**Estimated Manual Time:** 40-60 hours (review + copyedit + formatting)

---

## 🙋 Author-Independent Tasks

### Review & Approval Tasks

- [ ] **Review Chapter 01 draft** [30-60 min]
  - Read AI-generated draft
  - Provide feedback for refinement
  - Approve final version

- [ ] **Review Chapter 02 draft** [30-60 min]
- [ ] **Review Chapter 03 draft** [30-60 min]
- [ ] **Review Chapter 04 draft** [30-60 min]
- [ ] **Review Chapter 05 draft** [30-60 min]
- [ ] **Review Chapter 06 draft** [30-60 min]
- [ ] **Review Chapter 07 draft** [30-60 min]
- [ ] **Review Chapter 08 draft** [30-60 min]
- [ ] **Review Chapter 09 draft** [30-60 min]
- [ ] **Review Chapter 10 draft** [30-60 min]
- [ ] **Review Chapter 11 draft** [30-60 min]
- [ ] **Review Chapter 12 draft** [30-60 min]
- [ ] **Review Chapter 13 draft** [30-60 min]
- [ ] **Review Chapter 14 draft** [30-60 min]
- [ ] **Review Chapter 15 draft** [30-60 min]
- [ ] **Review Chapter 16 draft** [30-60 min]
- [ ] **Review Chapter 17 draft** [30-60 min]
- [ ] **Review Chapter 18 draft** [30-60 min]
- [ ] **Review Chapter 19 draft** [30-60 min]
- [ ] **Review Chapter 20 draft** [30-60 min]
- [ ] **Review Chapter 21 draft** [30-60 min]

**Subtotal Review:** 10-21 hours (21 chapters × 30-60 min/chapter)

---

### Validation Review Tasks

- [ ] **Review Chapter 01 validation report** [15-30 min]
  - Read Pass 2 NQ report
  - Decide if refinement needed
  - Approve or request changes

- [ ] **Review Chapter 02 validation report** [15-30 min]
- [ ] **Review Chapter 03 validation report** [15-30 min]
- [ ] **Review Chapter 04 validation report** [15-30 min]
- [ ] **Review Chapter 05 validation report** [15-30 min]
- [ ] **Review Chapter 06 validation report** [15-30 min]
- [ ] **Review Chapter 07 validation report** [15-30 min]
- [ ] **Review Chapter 08 validation report** [15-30 min]
- [ ] **Review Chapter 09 validation report** [15-30 min]
- [ ] **Review Chapter 10 validation report** [15-30 min]
- [ ] **Review Chapter 11 validation report** [15-30 min]
- [ ] **Review Chapter 12 validation report** [15-30 min]
- [ ] **Review Chapter 13 validation report** [15-30 min]
- [ ] **Review Chapter 14 validation report** [15-30 min]
- [ ] **Review Chapter 15 validation report** [15-30 min]
- [ ] **Review Chapter 16 validation report** [15-30 min]
- [ ] **Review Chapter 17 validation report** [15-30 min]
- [ ] **Review Chapter 18 validation report** [15-30 min]
- [ ] **Review Chapter 19 validation report** [15-30 min]
- [ ] **Review Chapter 20 validation report** [15-30 min]
- [ ] **Review Chapter 21 validation report** [15-30 min]

**Subtotal Validation Review:** 5-11 hours (21 chapters × 15-30 min/chapter)

---

### Copyedit Tasks

- [ ] **Complete final copyedit** [2-4 hours] ⚠️ **CRITICAL - BLOCKS PHASE 5 EXIT**
  - Read entire manuscript cover-to-cover
  - Fix typos, grammar, punctuation
  - Verify consistency (character names, dates, facts)
  - Apply style guide
  - Check formatting

**Why this blocks Phase 5 exit:** Manuscript must be error-free before proceeding to audio or publication. Typos in audiobook narration are very expensive to fix.

**Can be outsourced:** $500-$1,500 for professional copyedit

**Subtotal Copyedit:** 2-4 hours (or outsource)

---

### Formatting Tasks

- [ ] **Format manuscript for narration/publication** [1-2 hours] ⚠️ **CRITICAL - BLOCKS PHASE 5 EXIT**
  - Add chapter markers ("Chapter 1", "Chapter 2", etc.)
  - Remove extraneous formatting (comments, track changes)
  - Clean up paragraph spacing
  - Create table of contents (if needed)
  - Export in required format (Markdown, Word Doc, PDF)

**Why this blocks Phase 5 exit:** Next phase (audio or publication) requires clean, formatted manuscript. Formatting errors cause delays.

**Subtotal Formatting:** 1-2 hours

---

### Quality Assurance Tasks

- [ ] **Final manuscript QA pass** [2-4 hours]
  - Read formatted manuscript
  - Check table of contents links work
  - Verify all chapters present
  - Spot-check for formatting issues
  - Confirm file exports correctly

**Subtotal QA:** 2-4 hours

---

## 📊 Total Manual Time Estimate

**Conservative (detailed review):**
- Review: 21 hours
- Validation Review: 11 hours
- Copyedit: 4 hours
- Formatting: 2 hours
- QA: 4 hours
- **Total:** ~42 hours

**Moderate (typical):**
- Review: 15 hours
- Validation Review: 8 hours
- Copyedit: 3 hours
- Formatting: 1.5 hours
- QA: 3 hours
- **Total:** ~30.5 hours

**Aggressive (quick review, outsource copyedit):**
- Review: 10 hours
- Validation Review: 5 hours
- Copyedit: 0 hours (outsourced)
- Formatting: 1 hour
- QA: 2 hours
- **Total:** ~18 hours

**Typical range: 18-42 hours of author manual work**

---

## 🎯 How to Use This List

### Check Pending Manual Tasks

```bash
cd ../operations/pipeline/scripts
./get-manual-tasks.sh 5
```

### Complete Tasks Independently

**No AI session needed!** These tasks are author-only work.

**Example workflow:**
1. AI drafts Chapter 1 → Author reviews → Approve
2. AI validates Chapter 1 → Author reviews report → Approve
3. Repeat for all chapters
4. When all chapters done: Copyedit (manual, 2-4 hours)
5. Format manuscript (manual, 1-2 hours)
6. Phase 5 exit gate passes!

---

## ⚠️ Critical Manual Tasks (Block Phase 5 Exit)

These tasks MUST be completed before Phase 5 can exit:

### 1. Final Copyedit [2-4 hours]

**Status:** ⏸ Not Started

**What to do:**
1. Open complete manuscript
2. Read chapter-by-chapter
3. Mark typos, grammar errors, consistency issues
4. Fix all marked issues
5. Second pass: Quick skim to verify

**Tools:**
- Text editor (VS Code, Word, Google Docs)
- Grammar checker (Grammarly, ProWritingAid) - optional
- Style guide (your project's style guide)

**When done:**
```bash
./mark-task-complete.sh 5 copyedit
```

---

### 2. Manuscript Formatting [1-2 hours]

**Status:** ⏸ Not Started

**What to do:**
1. Add chapter markers (e.g., "Chapter 1: The Offering")
2. Remove comments, track changes, extraneous formatting
3. Clean paragraph spacing (consistent throughout)
4. Create table of contents (if needed)
5. Export in required format (Markdown for audio, Word for print)

**Tools:**
- Text editor or word processor
- Format templates (if available)

**When done:**
```bash
./mark-task-complete.sh 5 format
```

---

## 💡 Tips for Manual Tasks

**Do:**
- ✅ Complete copyedit in one sitting (maintains focus)
- ✅ Use grammar checker but don't rely on it (catches ~80% of issues)
- ✅ Read aloud (catches awkward phrasing)
- ✅ Take breaks (prevents eye fatigue, missing errors)
- ✅ Mark complete when actually done (not "mostly done")

**Don't:**
- ❌ Rush copyedit (errors damage book quality)
- ❌ Skip formatting (causes problems in next phase)
- ❌ Rely 100% on spell checker (misses context errors)
- ❌ Copyedit while tired (miss more errors)
- ❌ Skip QA pass (final check catches formatting issues)

---

## 📝 Example: SYNTHAI Project

**Manual Task Status:**

**Completed Manual Tasks (Weeks 1-15):**
- ✅ Reviewed all 21 chapter drafts (~15 hours)
- ✅ Reviewed all 21 validation reports (~8 hours)
- ✅ Approved all chapters for finalization

**Pending Manual Tasks (Current Blockers):**
- ⏸ **Final copyedit** (2-4 hours) - BLOCKING PHASE 5 EXIT
- ⏸ **Format manuscript** (1-2 hours) - BLOCKING PHASE 5 EXIT
- ⏸ QA pass (2 hours) - Can do after copyedit/formatting

**Estimated Time to Unblock:** 3-6 hours

**Next Action:** Author completes copyedit and formatting independently (no AI session needed)

---

## 🔗 Related Documents

- [AI Tasks](./AI-TASKS.md) - Tasks requiring AI assistance
- [Exit Criteria Checklist](./EXIT-CRITERIA-CHECKLIST.md) - What blocks Phase 5 exit
- [Phase 5 Tracker](../operations/phase-tracking/Phase-5-Text-TRACKER.md) - Overall status

---

**Run `./get-manual-tasks.sh 5` to see your current manual task list. Complete these without AI assistance!**
