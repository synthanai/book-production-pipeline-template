# Phase 5: Text Production - AI Tasks

**Purpose:** Tasks requiring AI assistance (Claude or other AI tools).

**Estimated AI Time:** 160-180 hours (writing + validation + refinement)

---

## 🤖 AI-Driven Tasks

### Writing Tasks

- [ ] **Draft Chapter 01** [3-4 hours]
  - Use chapter template + AI prompts
  - Generate initial draft from chapter outline
  - Review and refine output

- [ ] **Draft Chapter 02** [3-4 hours]
- [ ] **Draft Chapter 03** [3-4 hours]
- [ ] **Draft Chapter 04** [3-4 hours]
- [ ] **Draft Chapter 05** [3-4 hours]
- [ ] **Draft Chapter 06** [3-4 hours]
- [ ] **Draft Chapter 07** [3-4 hours]
- [ ] **Draft Chapter 08** [3-4 hours]
- [ ] **Draft Chapter 09** [3-4 hours]
- [ ] **Draft Chapter 10** [3-4 hours]
- [ ] **Draft Chapter 11** [3-4 hours]
- [ ] **Draft Chapter 12** [3-4 hours]
- [ ] **Draft Chapter 13** [3-4 hours]
- [ ] **Draft Chapter 14** [3-4 hours]
- [ ] **Draft Chapter 15** [3-4 hours]
- [ ] **Draft Chapter 16** [3-4 hours]
- [ ] **Draft Chapter 17** [3-4 hours]
- [ ] **Draft Chapter 18** [3-4 hours]
- [ ] **Draft Chapter 19** [3-4 hours]
- [ ] **Draft Chapter 20** [3-4 hours]
- [ ] **Draft Chapter 21** [3-4 hours]

**Subtotal Writing:** 63-84 hours (21 chapters × 3-4 hours/chapter)

---

### Validation Tasks

- [ ] **Pass 2 NQ Validation - Chapter 01** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 02** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 03** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 04** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 05** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 06** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 07** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 08** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 09** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 10** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 11** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 12** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 13** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 14** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 15** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 16** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 17** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 18** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 19** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 20** [30-60 min]
- [ ] **Pass 2 NQ Validation - Chapter 21** [30-60 min]

**Subtotal Validation:** 10-21 hours (21 chapters × 30-60 min/chapter)

---

### Refinement Tasks (As Needed)

- [ ] **Refine low-scoring chapters** [2-4 hours/chapter]
  - Address validation feedback
  - Improve scores to ≥4.5
  - Re-validate

**Subtotal Refinement:** 0-40 hours (depends on initial quality)

---

### Supporting Tasks

- [ ] **Generate chapter summaries** [2-4 hours]
  - Create 1-2 paragraph summary for each chapter
  - Use for marketing, audiobook metadata

- [ ] **Cross-reference consistency check** [4-6 hours]
  - Verify character names, dates, facts consistent across chapters
  - Flag inconsistencies for author review

- [ ] **Create chapter transition analysis** [2-4 hours]
  - Check flow between chapters
  - Identify abrupt or weak transitions

**Subtotal Supporting:** 8-14 hours

---

## 📊 Total AI Time Estimate

**Conservative (high quality, minimal refinement):**
- Writing: 84 hours
- Validation: 21 hours
- Refinement: 10 hours
- Supporting: 14 hours
- **Total:** ~129 hours

**Moderate (typical quality, some refinement):**
- Writing: 73 hours
- Validation: 16 hours
- Refinement: 20 hours
- Supporting: 10 hours
- **Total:** ~119 hours

**Aggressive (fast drafting, more refinement):**
- Writing: 63 hours
- Validation: 11 hours
- Refinement: 40 hours
- Supporting: 8 hours
- **Total:** ~122 hours

**Typical range: 100-180 hours of AI-assisted work**

---

## 🎯 How to Use This List

### Starting a Claude Session

1. **Check which tasks are pending:**
   ```bash
   cd ../operations/pipeline/scripts
   ./get-ai-tasks.sh 5
   ```

2. **Pick next task** (usually in chapter order)

3. **Provide context to Claude:**
   - Share chapter outline for the chapter
   - Share relevant master documents (character profiles, etc.)
   - Share chapter template
   - Share AI prompts

4. **Work with Claude to complete task**

5. **Mark complete:**
   ```bash
   ./mark-task-complete.sh 5 "chapter-01-draft"
   ```

---

### Batch Processing

**Recommended approach:** Write in batches of 3-5 chapters, then validate together

**Example workflow:**
1. Week 1-2: Draft Chapters 1-5 (Act I)
2. Week 2: Validate Chapters 1-5
3. Week 2-3: Refine any low-scoring chapters
4. Week 3-4: Draft Chapters 6-11 (Act II)
5. Week 4-5: Validate Chapters 6-11
6. Repeat for Acts III-IV

**Why batch:** Maintains context, enables pattern recognition, prevents burnout

---

## 💡 Tips for AI-Assisted Writing

**Do:**
- ✅ Provide detailed chapter context (outline, character profiles, previous chapters)
- ✅ Review and refine AI output (AI drafts, author perfects)
- ✅ Use consistent prompts (maintains voice and style)
- ✅ Save AI outputs immediately (prevents loss)
- ✅ Validate frequently (catch issues early)

**Don't:**
- ❌ Accept first draft uncritically (AI makes mistakes)
- ❌ Skip validation (quality problems compound)
- ❌ Change prompts mid-project (causes inconsistency)
- ❌ Rush through refinement (poor quality degrades book)
- ❌ Forget to save work (AI sessions can disconnect)

---

## 📝 Example: SYNTHAI Project

**AI Task Completion (Phase 5):**
- ✅ All 21 chapters drafted with AI assistance (73 hours)
- ✅ Pass 2 NQ validation on all 21 chapters (16 hours)
- ✅ Refinement rounds on 8 chapters (12 hours)
- ✅ Chapter summaries generated (2 hours)
- ✅ Consistency checks performed (4 hours)

**Total AI Time:** ~107 hours

**AI Efficiency:** ~815 words/hour (87,234 words ÷ 107 hours)

**Quality Result:** 4.86/5.0 average (high quality with AI assistance)

---

## 🔗 Related Documents

- [Manual Tasks](./MANUAL-TASKS.md) - Tasks you can do without AI
- [Phase 5 Tracker](../operations/phase-tracking/Phase-5-Text-TRACKER.md) - Overall status
- [Writing Prompts](../4-utilities/prompts/) - AI prompts for writing

---

**Run `./get-ai-tasks.sh 5` to see pending AI tasks for your current session.**
