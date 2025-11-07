# 🚪 Stage-Gate Reference Guide

**Purpose:** Comprehensive catalog of all stage-gates in the book production pipeline.

**Total Gates:** 45+ gates across 4 categories
- **Entry Gates:** 9 gates (one per phase)
- **Exit Gates:** 9 gates (one per phase)
- **Quality Gates:** 27+ gates (embedded in phases)
- **Validation Gates:** 6 gates (quality validation checkpoints)

---

## 📖 Table of Contents

1. [Understanding Stage-Gates](#understanding-stage-gates)
2. [Phase Entry Gates (9)](#phase-entry-gates)
3. [Phase Exit Gates (9)](#phase-exit-gates)
4. [Quality Gates (27+)](#quality-gates)
5. [Validation Gates (6)](#validation-gates)
6. [Gate Management](#gate-management)

---

## Understanding Stage-Gates

### What is a Stage-Gate?

A **stage-gate** is a checkpoint in the production pipeline where specific criteria must be met before proceeding. Think of it like a quality control checkpoint in manufacturing—you verify that conditions are right before moving to the next step.

### Gate Types

**Entry Gates:** Can you start this phase? (Prerequisites met?)
**Exit Gates:** Can you leave this phase? (Deliverables complete?)
**Quality Gates:** Does the work meet standards? (Quality thresholds reached?)
**Validation Gates:** Has quality been verified? (Independent validation passed?)

### Gate Status

- ✅ **PASSED** - All criteria met, approved to proceed
- ⏸ **PENDING** - Criteria not yet evaluated or in progress
- ❌ **BLOCKED** - Criteria not met, work required before passing
- 🔄 **WAIVED** - Criteria intentionally skipped with documented rationale

### Gate Authority

**Who can pass gates?**
- **Author-Approved:** Author makes final decision
- **AI-Assisted:** AI evaluates, author approves
- **Automated:** Script checks criteria, passes if met
- **Collaborative:** Author + AI + metrics all factor in

---

## Phase Entry Gates

### Gate E1: Phase 1 (Ideation) Entry

**Type:** Entry Gate
**Purpose:** Verify readiness to begin concept development
**Authority:** Author

**Criteria:**
1. ✅ **Project decision made** - Committed to writing this book
2. ✅ **Time allocated** - Have time available for ideation work (10-20 hours)
3. ✅ **Template initialized** - Book production pipeline template set up
4. ⏸ **Idea seed exists** - Have general notion of book topic/theme (can be vague)

**Measurement:**
- Manual: Author self-assessment
- No script validation needed

**Typical Status:** Usually auto-passes (low barrier to starting ideation)

**Blocker Resolution:** If blocked, clarify project commitment and allocate time

---

### Gate E2: Phase 2 (Research) Entry

**Type:** Entry Gate
**Purpose:** Verify concept is solid enough to begin research
**Authority:** Author
**Dependencies:** Phase 1 exit gate must pass

**Criteria:**
1. ✅ **Concept document complete** - Clear description of book idea
2. ✅ **Target audience identified** - Know who will read this book
3. ✅ **Core themes established** - Central messages/ideas defined
4. ✅ **Genre/category selected** - Know where book fits in market

**Measurement:**
- Manual: Review Phase 1 deliverables
- Script: `./check-phase-gates.sh 2 entry`

**Typical Blockers:**
- Concept too vague or undefined
- Target audience unclear
- Genre ambiguous

**Blocker Resolution:**
- Refine concept document in Phase 1
- Run additional ideation sessions
- Research comparable books to clarify positioning

---

### Gate E3: Phase 3 (Preparation) Entry

**Type:** Entry Gate
**Purpose:** Verify research provides foundation for preparation docs
**Authority:** Author
**Dependencies:** Phase 2 exit gate must pass

**Criteria:**
1. ✅ **Research complete** - Literature review, market analysis done
2. ✅ **Competitive landscape mapped** - Understand comparable titles
3. ✅ **Audience insights documented** - Know reader needs/preferences
4. ✅ **Content scope defined** - Know what will/won't be in the book

**Measurement:**
- Manual: Review Phase 2 deliverables
- Script: `./check-phase-gates.sh 3 entry`

**Typical Blockers:**
- Research insufficient for preparation
- Competitive analysis incomplete
- Content scope unclear

---

### Gate E4: Phase 4 (Utilities) Entry

**Type:** Entry Gate
**Purpose:** Verify preparation docs ready to support utility creation
**Authority:** Author
**Dependencies:** Phase 3 exit gate must pass

**Criteria:**
1. ✅ **Master documents complete** - Core preparation docs finished
2. ✅ **Writing frameworks established** - Structure and approach defined
3. ✅ **Quality standards documented** - Know what "good" looks like
4. ⏸ **Tools identified** - Know what utilities needed (templates, prompts, scripts)

**Measurement:**
- Manual: Review Phase 3 deliverables
- Script: `./check-phase-gates.sh 4 entry`

---

### Gate E5: Phase 5 (Text) Entry

**Type:** Entry Gate
**Purpose:** Verify readiness to begin writing
**Authority:** Author
**Dependencies:** Phase 4 exit gate must pass

**Criteria:**
1. ✅ **Writing templates ready** - Have chapter templates, outlines
2. ✅ **AI prompts prepared** - Have prompts for AI-assisted writing
3. ✅ **Quality frameworks in place** - Know how to validate quality
4. ✅ **Chapter structure defined** - Know how many chapters, rough word counts
5. ⏸ **Writing schedule created** - Have plan for completing text production

**Measurement:**
- Manual: Review Phase 4 deliverables
- Script: `./check-phase-gates.sh 5 entry`

**Critical Gate:** This is a major milestone - entering production phase

---

### Gate E6: Phase 6 (Audio) Entry

**Type:** Entry Gate
**Purpose:** Verify manuscript ready for audio production
**Authority:** Author
**Dependencies:** Phase 5 exit gate must pass

**Criteria:**
1. ✅ **All chapters written** - Text production complete
2. ✅ **Validation passed** - Quality checks completed
3. ✅ **Copyedit complete** - Grammar, typos, consistency verified
4. ✅ **Manuscript formatted for narration** - Clean script with chapter markers
5. ⏸ **Narration plan decided** - Self-record, hire narrator, or skip audio?

**Measurement:**
- Automated: Chapter count, word count, validation scores
- Manual: Copyedit status, narration plan
- Script: `./check-phase-gates.sh 6 entry`

**Typical Blockers:**
- Copyedit not complete
- Validation failures
- Manuscript formatting issues

- 21/21 chapters written ✅
- Pass 2 NQ validation: 4.86/5.0 ✅
- Copyedit: ⏸ Pending (2-4 hours)
- Narration format: ⏸ Pending (1-2 hours)

---

### Gate E7: Phase 7 (Video) Entry

**Type:** Entry Gate
**Purpose:** Verify assets ready for video production
**Authority:** Author
**Dependencies:** Phase 5 exit gate must pass (Phase 6 optional)

**Criteria:**
1. ✅ **Content finalized** - Text (and optionally audio) complete
2. ⏸ **Video strategy defined** - Know what videos to create (trailer, course, promos)
3. ⏸ **Key messages identified** - Know what to communicate in videos
4. ⏸ **Target platforms selected** - YouTube, social media, website, etc.

**Measurement:**
- Manual: Review video strategy
- Script: `./check-phase-gates.sh 7 entry`

**Note:** Phase 7 is optional - many authors skip video or do it post-publication

---

### Gate E8: Phase 8 (Publication) Entry

**Type:** Entry Gate
**Purpose:** Verify manuscript ready for publication
**Authority:** Author
**Dependencies:** Phase 5 exit gate must pass; Phase 6-7 optional

**Criteria:**
1. ✅ **Text finalized** - All chapters complete, validated, copyedited
2. ✅ **Quality verified** - Validation gates passed
3. ⏸ **Audio complete** (if doing audiobook) - Narration recorded and mastered
4. ⏸ **Publication strategy decided** - Traditional, self-publish, hybrid?
5. ⏸ **Formats decided** - Ebook, print, audio? Which platforms?

**Measurement:**
- Automated: Text completion, validation scores
- Manual: Audio status, publication strategy
- Script: `./check-phase-gates.sh 8 entry`

**Critical Gate:** This is the final production gate before publication

---

### Gate E9: Phase 9 (Marketing) Entry

**Type:** Entry Gate
**Purpose:** Verify ready to begin marketing
**Authority:** Author
**Dependencies:** Phase 8 entry gate must pass (can start before publication)

**Criteria:**
1. ✅ **Publication timeline set** - Know when book will be available
2. ⏸ **Marketing strategy drafted** - Have plan for promotion
3. ⏸ **Key marketing assets ready** - Book description, author bio, cover (if available)
4. ⏸ **Target audience refined** - Know exactly who to market to

**Measurement:**
- Manual: Review marketing readiness
- Script: `./check-phase-gates.sh 9 entry`

**Note:** Marketing can start 3-6 months before publication

---

## Phase Exit Gates

### Gate X1: Phase 1 (Ideation) Exit

**Type:** Exit Gate
**Purpose:** Verify concept is solid enough to proceed to research
**Authority:** Author

**Criteria:**
1. ✅ **Concept document complete** - Written description of book idea (2-5 pages)
2. ✅ **Target audience defined** - Specific reader persona or demographic
3. ✅ **Core themes articulated** - 3-5 key messages/ideas
4. ✅ **Genre/category decided** - Clear positioning in market
5. ⏸ **Story framework or outline** - High-level structure (for fiction) or chapter list (non-fiction)

**Deliverables:**
- Concept document (1-ideation/concept.md)
- Target audience profile (1-ideation/audience.md)
- Theme summary (1-ideation/themes.md)
- Framework or outline (1-ideation/framework.md)

**Measurement:**
- Manual: Review deliverables for completeness
- Script: `./check-phase-gates.sh 1 exit`

**Estimated Time:** 10-20 hours

---

### Gate X2: Phase 2 (Research) Exit

**Type:** Exit Gate
**Purpose:** Verify research provides adequate foundation for preparation
**Authority:** Author

**Criteria:**
1. ✅ **Literature review complete** - Read 5-10+ comparable books
2. ✅ **Market analysis done** - Understand genre trends, reader expectations
3. ✅ **Competitive landscape documented** - Know how your book differentiates
4. ✅ **Audience research complete** - Validated target audience assumptions
5. ⏸ **Research findings documented** - Written synthesis of research

**Deliverables:**
- Comparable titles analysis (2-research/comp-titles.md)
- Market research summary (2-research/market-analysis.md)
- Audience insights (2-research/audience-research.md)

**Measurement:**
- Manual: Review deliverables for depth and quality
- Script: `./check-phase-gates.sh 2 exit`

**Estimated Time:** 20-40 hours

---

### Gate X3: Phase 3 (Preparation) Exit

**Type:** Exit Gate
**Purpose:** Verify preparation docs provide adequate foundation for writing
**Authority:** Author

**Criteria:**
1. ✅ **Master documents complete** - Core prep docs finished (varies by book type)
2. ✅ **Writing frameworks ready** - Structure, approach, style guide defined
3. ✅ **Quality standards documented** - Validation criteria established
4. ✅ **Chapter outline complete** - Know what each chapter will cover
5. ⏸ **Character/world-building done** (fiction) - Profiles, settings, backstories

**Deliverables:**
- Master documents (3-preparation/masters/)
- Quality frameworks (3-preparation/quality-frameworks/)
- Chapter outline (3-preparation/blueprints/chapter-outline.md)

**Measurement:**
- Manual: Review deliverables for completeness
- Automated: Word count, document count
- Script: `./check-phase-gates.sh 3 exit`

**Estimated Time:** 40-100 hours (highly variable)


---

### Gate X4: Phase 4 (Utilities) Exit

**Type:** Exit Gate
**Purpose:** Verify tools ready to support text production
**Authority:** Author

**Criteria:**
1. ✅ **Templates created** - Chapter templates, scene templates, etc.
2. ✅ **Prompts documented** - AI prompts for writing assistance
3. ✅ **Scripts ready** (if applicable) - Automation tools for workflow
4. ⏸ **Snippets library created** - Reusable text snippets, boilerplate
5. ⏸ **Tool documentation complete** - Know how to use all utilities

**Deliverables:**
- Templates (4-utilities/templates/)
- Prompts (4-utilities/prompts/)
- Scripts (4-utilities/tools/)
- Snippets (4-utilities/snippets/)

**Measurement:**
- Manual: Review utilities for usability
- Script: `./check-phase-gates.sh 4 exit`

**Estimated Time:** 10-30 hours

---

### Gate X5: Phase 5 (Text) Exit

**Type:** Exit Gate
**Purpose:** Verify manuscript complete and ready for next phase
**Authority:** Author + AI (validation)

**Criteria:**
1. ✅ **All chapters written** - Target chapter count reached
2. ✅ **Word count target met** - Meets genre standards (typically 70,000-100,000 words)
3. ✅ **Validation passed** - Quality checks completed (Pass 2 NQ ≥ 4.5/5.0)
4. ✅ **Zero chapters flagged for refinement** - All chapters meet quality standards
5. ✅ **Final copyedit complete** - Grammar, typos, consistency verified
6. ✅ **Manuscript formatted** - Ready for next phase (audio, publication, etc.)

**Deliverables:**
- All chapters (5-text/chapters/)
- Validation reports (operations/validation/chapter-validation/)
- Final manuscript (5-text/manuscript-final.md)

**Measurement:**
- Automated: Chapter count, word count, validation scores
- Manual: Copyedit status, formatting check
- Script: `./check-phase-gates.sh 5 exit`

**Estimated Time:** 200-500 hours (highly variable)

**Critical Gate:** This is the most important gate - manuscript must be publication-ready

- ✅ 21/21 chapters written (100%)
- ✅ 87,234 words (meets target)
- ✅ Pass 2 NQ: 4.86/5.0 (exceeds 4.5 threshold)
- ✅ Zero flagged chapters
- ⏸ Copyedit: Pending (2-4 hours)
- ⏸ Narration format: Pending (1-2 hours)
- **Status:** 4/6 criteria met (67%)

---

### Gate X6: Phase 6 (Audio) Exit

**Type:** Exit Gate
**Purpose:** Verify audiobook complete and ready for publication
**Authority:** Author

**Criteria:**
1. ✅ **All chapters narrated** - Narration recorded for all chapters
2. ✅ **Audio edited** - Mistakes removed, pacing adjusted
3. ✅ **Audio mastered** - Consistent volume, professional quality
4. ✅ **Chapter markers added** - Clear chapter breaks for navigation
5. ✅ **Audio QA passed** - Listened to full audiobook, verified quality
6. ⏸ **Distribution format ready** - Exported in required format (ACX, Findaway, etc.)

**Deliverables:**
- Narration recordings (6-audio/recordings/)
- Edited audio files (6-audio/edited/)
- Master audio files (6-audio/master/)
- Narration guide (6-audio/narration-guide/)

**Measurement:**
- Manual: Audio quality check, QA completion
- Script: `./check-phase-gates.sh 6 exit`

**Estimated Time:** 60-80 hours (self-record) OR 4-6 weeks (outsource)

**Note:** This gate can be skipped if not producing audiobook

---

### Gate X7: Phase 7 (Video) Exit

**Type:** Exit Gate
**Purpose:** Verify video content complete and ready for distribution
**Authority:** Author

**Criteria:**
1. ✅ **All planned videos created** - Trailer, promos, course content, etc.
2. ✅ **Videos edited** - Professional quality, branded
3. ✅ **Videos exported** - In required formats for each platform
4. ⏸ **Video QA passed** - Watched all videos, verified quality
5. ⏸ **Distribution plan ready** - Know where/when to publish videos

**Deliverables:**
- Video files (7-video/)
- Video scripts (7-video/scripts/)
- Video assets (7-video/assets/)

**Measurement:**
- Manual: Video quality check, QA completion
- Script: `./check-phase-gates.sh 7 exit`

**Estimated Time:** 20-60 hours (highly variable)

**Note:** This gate can be skipped if not producing video content

---

### Gate X8: Phase 8 (Publication) Exit

**Type:** Exit Gate
**Purpose:** Verify book published and available to readers
**Authority:** Author

**Criteria:**
1. ✅ **Ebook published** (if applicable) - Live on selected platforms
2. ✅ **Print published** (if applicable) - Available for purchase
3. ✅ **Audiobook published** (if applicable) - Live on audio platforms
4. ✅ **Distribution verified** - Book appears in search, listings correct
5. ⏸ **Launch plan executed** - Announced to email list, social media, etc.

**Deliverables:**
- Published book files (8-publication/ebooks/, print/, audio/)
- Distribution records (8-publication/distribution-log.md)
- Launch plan (8-publication/launch-plan.md)

**Measurement:**
- Manual: Verify live on platforms, check listings
- Script: `./check-phase-gates.sh 8 exit`

**Estimated Time:** 2-4 weeks (mostly waiting for approval/distribution)

**Critical Gate:** Book is now public - this is the publication milestone!

---

### Gate X9: Phase 9 (Marketing) Exit

**Type:** Exit Gate
**Purpose:** Verify marketing efforts launched and ongoing
**Authority:** Author

**Criteria:**
1. ✅ **Marketing plan executed** - Initial promotion complete
2. ✅ **Marketing assets distributed** - Whitepapers, media kit, social posts live
3. ⏸ **Initial traction achieved** - Some sales, reviews, engagement
4. ⏸ **Ongoing marketing scheduled** - Have plan for sustained promotion

**Deliverables:**
- Marketing materials (9-marketing/)
- Marketing analytics (9-marketing/analytics/)
- Marketing plan (9-marketing/marketing-plan.md)

**Measurement:**
- Manual: Review marketing execution, initial results
- Script: `./check-phase-gates.sh 9 exit`

**Estimated Time:** Ongoing (10+ hours/month)

**Note:** Marketing never truly "exits" - this gate marks initial launch complete

---

## Quality Gates

Quality gates are embedded throughout the production process and vary by book type. Below are common quality gates organized by phase.

### Phase 5 (Text) Quality Gates

**Gate Q1: Chapter Structure**
- Criteria: Each chapter has clear beginning, middle, end
- Measurement: Manual review OR AI-assisted structure analysis

**Gate Q2: Character Voice Consistency** (Fiction)
- Criteria: Characters speak/act consistently with their profiles
- Measurement: AI-assisted voice analysis + author review

**Gate Q3: Plot Continuity** (Fiction)
- Criteria: No plot holes, timeline consistent, events logical
- Measurement: Manual review + AI-assisted continuity check

**Gate Q4: Factual Accuracy** (Non-fiction)
- Criteria: All claims verified, sources cited
- Measurement: Manual fact-checking + source verification

**Gate Q5: Technical Depth** (Non-fiction)
- Criteria: Content meets technical standards for audience
- Measurement: Subject matter expert review OR author self-assessment

**Gate Q6: Pacing**
- Criteria: Story/content moves at appropriate pace
- Measurement: Beta reader feedback + author assessment

**Gate Q7: Engagement**
- Criteria: Content maintains reader interest
- Measurement: Beta reader feedback + narrative quality scores

**Gate Q8: Clarity**
- Criteria: Writing is clear, easy to understand
- Measurement: Readability scores + beta reader feedback

**Gate Q9: Grammar & Style**
- Criteria: Professional writing quality, consistent style
- Measurement: Copyedit + grammar tools + style guide compliance

**Gate Q10: Word Count per Chapter**
- Criteria: Chapters within target range (e.g., 3,000-5,000 words)
- Measurement: Automated word count check

[... 17 more quality gates across other phases]

---

## Validation Gates

Validation gates are independent quality checks performed at specific milestones.

### Gate V1: Pass 1 Validation (148-Dimension)

**Type:** Validation Gate
**Purpose:** Deep quality assessment across 148 dimensions
**Authority:** AI-Assisted + Author Review
**Timing:** Phase 5 mid-point (optional)

**Criteria:**
1. ✅ **All dimensions evaluated** - 148 quality dimensions scored
2. ✅ **Average score ≥ 4.0/5.0** - Meets minimum quality threshold
3. ✅ **No critical failures** - No dimensions scored below 3.0
4. ⏸ **Validation report generated** - Documented results

**Measurement:**
- Automated: AI validation script
- Manual: Author reviews report, addresses flagged issues

**Estimated Time:** 2-4 hours per chapter

**Note:** This is a deep validation typically used for early chapters or high-stakes projects. Can be waived for later chapters if Pass 2 validation shows consistent high quality.

---

### Gate V2: Pass 2 Validation (Narrative Quality)

**Type:** Validation Gate
**Purpose:** Core narrative quality assessment (8 dimensions)
**Authority:** AI-Assisted + Author Review
**Timing:** Phase 5 exit (required)

**Criteria:**
1. ✅ **All 8 NQ dimensions evaluated** - Character, plot, pacing, engagement, etc.
2. ✅ **Average score ≥ 4.5/5.0** - Meets publication quality threshold
3. ✅ **No chapters below 4.0** - All chapters meet minimum standard
4. ✅ **Validation report generated** - Documented results

**NQ Dimensions:**
1. Character Development
2. Plot Coherence
3. Pacing
4. Dialogue Quality
5. Descriptive Quality
6. Emotional Impact
7. Thematic Consistency
8. Overall Engagement

**Measurement:**
- Automated: AI validation script
- Manual: Author reviews report, refines flagged chapters

**Estimated Time:** 30-60 minutes per chapter

**Critical Gate:** This validation is required for Phase 5 exit

- Average NQ score: 4.86/5.0 ✅
- All chapters ≥ 4.0 ✅
- Highest score: 5.0/5.0 (multiple chapters)
- Lowest score: 4.5/5.0

---

### Gate V3: Master Document Validation

**Type:** Validation Gate
**Purpose:** Verify preparation docs are complete and consistent
**Authority:** Author (+ AI assistance optional)
**Timing:** Phase 3 exit

**Criteria:**
1. ✅ **All master docs complete** - Required docs finished
2. ✅ **Cross-references validated** - Docs consistent with each other
3. ✅ **No gaps or contradictions** - World-building, character profiles, etc. aligned
4. ⏸ **Quality threshold met** - Docs provide adequate foundation for writing

**Measurement:**
- Manual: Author review
- AI-Assisted: Consistency checking (optional)

**Estimated Time:** 4-8 hours

---

### Gate V4: Blueprint Validation

**Type:** Validation Gate
**Purpose:** Verify chapter outlines are complete and well-structured
**Authority:** Author
**Timing:** Phase 3 exit

**Criteria:**
1. ✅ **All chapters outlined** - Know what each chapter will cover
2. ✅ **Chapter flow logical** - Chapters build on each other appropriately
3. ✅ **Story/content arc complete** - Beginning, middle, end defined
4. ⏸ **Estimated word counts reasonable** - Chapter lengths appropriate

**Measurement:**
- Manual: Author review

**Estimated Time:** 2-4 hours

---

### Gate V5: Audio QA Validation

**Type:** Validation Gate
**Purpose:** Verify audiobook quality before distribution
**Authority:** Author (+ QA checklist)
**Timing:** Phase 6 exit

**Criteria:**
1. ✅ **Full listen-through complete** - Listened to entire audiobook
2. ✅ **Audio quality verified** - Clear, consistent, professional
3. ✅ **Chapter markers correct** - Chapters start/end at right places
4. ✅ **No audio errors** - No pops, clicks, background noise
5. ⏸ **Pacing appropriate** - Narration speed comfortable

**Measurement:**
- Manual: Author listens and checks QA checklist

**Estimated Time:** 6-10 hours (listening time)

---

### Gate V6: Publication QA Validation

**Type:** Validation Gate
**Purpose:** Verify published formats are correct before public launch
**Authority:** Author
**Timing:** Phase 8 (before making public)

**Criteria:**
1. ✅ **Ebook formatting correct** - No formatting errors in ebook
2. ✅ **Print formatting correct** - Print proof reviewed and approved
3. ✅ **Metadata correct** - Title, author, description, categories accurate
4. ✅ **Cover displays correctly** - Cover image renders properly
5. ⏸ **Sample chapters work** - Preview/Look Inside features work

**Measurement:**
- Manual: Author reviews each format

**Estimated Time:** 2-4 hours

---

## Gate Management

### Checking Gate Status

**Command:**
```bash
cd operations/pipeline/scripts
./check-phase-gates.sh <phase-number> [entry|exit]
```

**Example:**
```bash
./check-phase-gates.sh 5 exit
```

**Output:**
```
Phase 5 (Text) EXIT GATE STATUS:
✅ All chapters written (21/21)
✅ Word count met (87,234 words)
✅ Pass 2 NQ validation passed (4.86/5.0)
✅ Zero chapters flagged for refinement
⏸ Copyedit complete [PENDING]
⏸ Manuscript formatted [PENDING]

RESULT: 4/6 criteria met (67%)
STATUS: CANNOT PASS GATE
BLOCKERS: Copyedit, Formatting
NEXT: Complete copyedit (2-4 hours), format manuscript (1-2 hours)
```

---

### Passing a Gate

**Command:**
```bash
./mark-gate-passed.sh <phase-number> [entry|exit]
```

**What it does:**
1. Validates all gate criteria are met
2. Updates PIPELINE-STATUS-DASHBOARD.md
3. Logs decision in DECISION-LOG.md
4. Updates metrics-summary.json
5. Unblocks next phase (if applicable)

---

### Waiving a Gate

**Process:**
1. Document rationale in DECISION-LOG.md
2. Run `./mark-gate-waived.sh <phase> <gate-type> <reason>`
3. Gate marked as waived, next phase unblocked

**When to waive:**
- Data shows criteria not needed (e.g., Pass 1 validation when Pass 2 scores are high)
- Timeline pressure justifies reduced validation
- Cost/benefit analysis favors skipping

**When NOT to waive:**
- Critical quality gates (Pass 2 validation, copyedit)
- Gates protecting downstream work (manuscript formatting before audio)
- Safety/integrity gates (factual accuracy, legal review)

---

### Modifying Gate Criteria

**Process:**
1. Document rationale in DECISION-LOG.md
2. Update gate definition in this document
3. Update validation scripts if applicable
4. Notify collaborators of change

**When to modify:**
- Project requirements differ from template
- Book type requires different criteria
- Lessons learned suggest improvement

---

## 🔗 Related Documents

- [Pipeline Status Dashboard](./PIPELINE-STATUS-DASHBOARD.md) - Current gate status
- [Decision Log](./DECISION-LOG.md) - Gate passage decisions
- [Critical Path Tracker](./CRITICAL-PATH-TRACKER.md) - Blocker analysis
- [Phase Trackers](../phase-tracking/) - Detailed phase status

---

**This is your gate reference guide. Bookmark it and refer back often as you progress through the pipeline!**
