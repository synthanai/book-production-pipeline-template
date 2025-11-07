# Phase 6: Audio Production - Tracker

**Phase Status:** ⚪ Not Started (Blocked by Phase 5 exit)
**Entry Gate:** ⏸ Pending (3/5 criteria met - 60%)
**Exit Gate:** ⏸ Pending
**Completion:** 0%

**Last Updated:** 2025-11-07

---

## 📊 Phase Overview

**Purpose:** Create a professional audiobook from the finished manuscript.

**Typical Duration:** 60-80 hours (self-record) OR 4-6 weeks (outsource to narrator)

**Key Question:** *Do I want to produce an audiobook, and if so, how (self-record or hire narrator)?*

---

## 🚪 Entry Criteria

**Status:** ⏸ 3/5 criteria met (60%) - BLOCKED

- [x] **All chapters written** - 21/21 chapters complete ✅
- [x] **Validation passed** - Pass 2 NQ: 4.86/5.0 ✅
- [ ] **Copyedit complete** - Grammar, typos, consistency verified ⏸ **[BLOCKER]**
- [ ] **Manuscript formatted for narration** - Clean script with chapter markers ⏸ **[BLOCKER]**
- [ ] **Narration plan decided** - Self-record, hire narrator, or skip? ⏸ **[DECISION NEEDED]**

**Entry Gate:** ⏸ BLOCKED - Phase 5 exit gate must pass first

**Blockers:**
1. Phase 5 copyedit not complete (2-4 hours, MANUAL)
2. Manuscript not formatted for narration (1-2 hours, MANUAL)
3. Narration approach not decided (DECISION)

**Next Actions:**
1. Complete Phase 5 exit criteria (copyedit + formatting)
2. Decide narration approach: self-record, outsource, or skip
3. If proceeding: Run `./get-ai-tasks.sh 6` to get AI preparation tasks
4. If proceeding: Run `./get-manual-tasks.sh 6` to get recording tasks

---

## 🎯 Phase Deliverables

**Status:** ⏸ 0/6 deliverables complete (0%) - NOT STARTED

### Core Deliverables

- [ ] **Narration guide** - Tone, pacing, character voices, pronunciation
  - Location: `6-audio/narration-guide/`
  - What to include: Voice descriptions, pacing notes, difficult pronunciations, character voice guide
  - Estimated time: 1-2 hours [AI-DRIVEN]
  - **Critical:** This must be completed BEFORE recording begins

- [ ] **Chapter summaries for narrator** - Brief chapter overviews
  - Location: `6-audio/scripts/chapter-summaries.md`
  - What to include: Chapter summaries, key scenes, emotional beats
  - Estimated time: 30-60 minutes [AI-DRIVEN]

- [ ] **Audio recordings** - All 21 chapters narrated
  - Location: `6-audio/recordings/raw/`
  - What to include: Chapter 01-21 audio files (WAV or FLAC)
  - Estimated time: 25-35 hours (recording only, ~45 min/chapter)
  - **[MANUAL]** Self-record OR **[OUTSOURCE]** Hire narrator

- [ ] **Edited audio files** - Cleaned, mistake-free audio
  - Location: `6-audio/recordings/edited/`
  - What to include: Edited Chapter 01-21 (mistakes removed, pacing adjusted)
  - Estimated time: 20-30 hours (editing time)
  - **[MANUAL]** OR **[OUTSOURCE]**

- [ ] **Master audio files** - Final, distribution-ready audio
  - Location: `6-audio/recordings/master/`
  - What to include: Mastered Chapter 01-21 (consistent volume, professional quality)
  - Estimated time: 10-15 hours (mastering + QA)
  - **[MANUAL]** OR **[OUTSOURCE]**

- [ ] **Audiobook metadata** - Description, cover, marketing copy
  - Location: `6-audio/metadata/`
  - What to include: Audiobook description, narrator bio, categories, keywords
  - Estimated time: 1-2 hours [AI-DRIVEN]

---

## 🚪 Exit Criteria

**Status:** ⏸ 0/6 criteria met (0%)

- [ ] **All chapters narrated** - Narration recorded for 21 chapters
- [ ] **Audio edited** - Mistakes removed, pacing adjusted
- [ ] **Audio mastered** - Consistent volume, professional quality
- [ ] **Chapter markers added** - Clear chapter breaks for navigation
- [ ] **Audio QA passed** - Listened to full audiobook, verified quality
- [ ] **Distribution format ready** - Exported in required format (ACX, Findaway, etc.)

**Exit Gate:** Blocks Phase 8 (Publication) entry (Phase 7 optional)

**Validation:** Run `./check-phase-gates.sh 6 exit` to verify readiness

**Note:** This phase can be skipped entirely if not producing audiobook. See "Fast-Track Options" below.

---

## 🤖 AI-Driven vs 🙋 Manual Tasks

### [AI-DRIVEN] Tasks (Must Complete BEFORE Recording)

**Estimated AI Time:** 1-2 hours (preparation phase)

- [ ] **Generate narration guide** [1 hour]
  - Tone and pacing guidance (professional, conversational, technical depth)
  - Difficult pronunciations (Indian names, technical terms, company names)
  - Emotional beats per chapter (where to add emphasis, where to slow down)
  - **Why critical:** Ensures consistent narration across all chapters

- [ ] **Create chapter summaries** [30 minutes]
  - Brief overview of each chapter for narrator context
  - Key scenes and emotional arcs
  - Important character moments
  - **Why helpful:** Narrator understands context for better performance

- [ ] **Identify challenging pronunciations** [30 minutes]
  - Technical terms (API, algorithmic bias, neural networks)
  - Company names (SynthAI, proper nouns)
  - Phonetic spellings for narrator
  - **Why critical:** Avoids re-recording due to mispronunciation

- [ ] **Generate audiobook marketing copy** [30 minutes]
  - Audiobook description (different from ebook description)
  - Narrator bio (if self-recording)
  - Keywords and categories for ACX/Findaway
  - **Why helpful:** Ready to publish when audio is done

---

### [MANUAL] Tasks (Author or Hired Narrator)

**Option A: Self-Record (60-80 hours author time)**

**Recording Phase (25-35 hours):**
- [ ] Set up recording space (quiet room, sound treatment)
- [ ] Test recording equipment (microphone, audio interface, software)
- [ ] Record Chapter 01 (~45 min reading + retakes = 1.5 hours)
- [ ] Record Chapter 02 (~45 min reading + retakes = 1.5 hours)
- [ ] Record Chapter 03-21 (repeat for all chapters)
- **Total:** ~25-35 hours (1-1.5 hours per chapter including retakes)

**Editing Phase (20-30 hours):**
- [ ] Edit Chapter 01 (remove mistakes, mouth noises, long pauses)
- [ ] Add chapter markers for Chapter 01
- [ ] Edit Chapter 02-21 (repeat for all chapters)
- **Total:** ~20-30 hours (~1 hour editing per chapter)

**Mastering Phase (10-15 hours):**
- [ ] Master all audio tracks (consistent volume, EQ, compression)
- [ ] Add intro/outro music (optional)
- [ ] QA: Listen to full audiobook (~10 hours)
- [ ] Export in distribution format (ACX: specific technical requirements)
- **Total:** ~10-15 hours

**Distribution (2-4 hours):**
- [ ] Create ACX account (or Findaway Voices)
- [ ] Upload audio files
- [ ] Add audiobook metadata (title, description, cover, pricing)
- [ ] Submit for review
- [ ] Wait for approval (1-2 weeks)

**Total Self-Record Time:** 60-80 hours + 1-2 weeks approval

---

**Option B: Outsource to Narrator ($3,000-$5,000, 4-6 weeks)**

**Hiring Phase (4-8 hours author time):**
- [ ] Research narrators on ACX, Findaway Voices, or freelance platforms
- [ ] Listen to narrator samples (match voice to characters)
- [ ] Create audition script (first 1-2 pages of Chapter 01)
- [ ] Review auditions and select narrator
- [ ] Negotiate rate ($200-$400 per finished hour, ~8-12 finished hours)
- [ ] Sign contract

**Narrator's Work (handled by narrator, 4-6 weeks):**
- Narrator records all chapters (~25-35 hours)
- Narrator edits audio (~20-30 hours)
- Narrator masters audio (~10-15 hours)
- Narrator delivers final files

**Author QA Phase (5-10 hours author time):**
- [ ] Listen to full audiobook (~10 hours)
- [ ] Note any errors or pronunciation issues
- [ ] Request pickup recordings if needed
- [ ] Approve final audio

**Distribution (2-4 hours author time):**
- [ ] Upload audio files to ACX/Findaway
- [ ] Add metadata and cover
- [ ] Submit for review

**Total Outsource Time:** 10-20 hours author time, $3K-$5K cost, 4-6 weeks calendar time

---

**Option C: Skip Audio (For Now)**

- Phase 6 can be skipped entirely
- Jump from Phase 5 → Phase 8 (Publication)
- Publish ebook/print first, add audiobook later
- Saves 60-80 hours OR $3K-$5K
- Tradeoff: No audiobook at launch (can add post-publication)

---

## 📈 Quality Metrics

**Audio Quality Indicators:**
- [ ] Clear, professional sound (no background noise, pops, clicks)
- [ ] Consistent volume throughout (~-18 to -23 dB RMS for ACX)
- [ ] Appropriate pacing (not too fast or slow, ~9,300 words/hour = ~150 words/min)
- [ ] Character voices consistent across chapters
- [ ] Emotional tone matches scene content
- [ ] Pronunciation correct (especially Indian names, technical terms)

**ACX Quality Requirements (if distributing via Audible):**
- Peak values no higher than -3dB
- RMS (average loudness) between -18dB and -23dB
- Noise floor no higher than -60dB
- Room tone at start and end (0.5-1 second)
- No extraneous sounds (clicks, pops, mouth noises)

---

## 🔗 Dependencies

**Prerequisites:**
- Phase 5 (Text Production) exit gate must pass ⏸

**Blocks:**
- Phase 8 (Publication) entry if audiobook is part of launch strategy
- Phase 7 (Video) entry if video includes audio excerpts

**Optional:** Phase 6 can be skipped if not producing audiobook

---

## 🚧 Current Status & Blockers

**Status:** ⚪ Not Started - Blocked by Phase 5 exit

**Blockers:**
1. ⏸ **Phase 5 copyedit not complete** (2-4 hours, MANUAL)
2. ⏸ **Phase 5 manuscript formatting not done** (1-2 hours, MANUAL)
3. ⏸ **Narration approach not decided** (DECISION: self-record, outsource, or skip)

**Decision Needed: Narration Approach**

**Factors to Consider:**
- **Budget:** Self-record = time investment, Outsource = $3K-$5K
- **Timeline:** Self-record = 60-80 hours author time, Outsource = 4-6 weeks calendar time
- **Quality:** Professional narrator typically higher quality than author (unless author has narration experience)
- **Control:** Self-record = full creative control, Outsource = limited control
- **Importance:** Is audiobook critical for launch, or can it be added later?

**Recommendation:**
- **If time-sensitive launch:** Skip audio for now, add post-publication
- **If budget available:** Outsource to professional narrator
- **If author has narration skills:** Self-record with professional mastering
- **If unsure:** Start with AI prep tasks (narration guide), decide during prep

**Next Actions:**
1. Complete Phase 5 exit (copyedit + formatting)
2. Decide narration approach (self, outsource, skip)
3. If self or outsource: Run `./get-ai-tasks.sh 6` to start prep
4. If skip: Proceed to Phase 8 (Publication) or Phase 7 (Video)

---

## 💡 Tips for This Phase

**Do:**
- ✅ Complete narration guide BEFORE recording (critical for consistency)
- ✅ Test equipment and recording space before committing
- ✅ Listen to professional audiobooks in your genre for pacing/tone reference
- ✅ Take breaks during recording (vocal fatigue affects quality)
- ✅ Record in consistent environment (same room, time of day)

**Don't:**
- ❌ Start recording without narration guide (leads to inconsistency)
- ❌ Rush through recording (quality suffers)
- ❌ Skip QA listening phase (errors will reach listeners)
- ❌ Ignore ACX technical requirements (will be rejected)
- ❌ Underestimate time investment (recording is slower than you think)

**Common Pitfalls:**
- Recording without sound treatment (background noise, echo)
- Inconsistent character voices across chapters
- Mispronouncing names or technical terms
- Not taking enough retakes (settling for "good enough")
- Skipping mastering phase (volume inconsistency)

---

## 🔗 Related Documents

- [6-audio/ directory](../../6-audio/) - Working files for this phase
- [Stage-Gate Reference](../pipeline/STAGE-GATES-REFERENCE.md) - Gate E6 & X6 definitions
- [Phase 5 Tracker](./Phase-5-Text-TRACKER.md) - Previous phase (must complete first)
- [Phase 7 Tracker](./Phase-7-Video-TRACKER.md) - Next phase (optional)
- [Phase 8 Tracker](./Phase-8-Publication-TRACKER.md) - Next phase (if skipping video)
- [Critical Path Tracker](../pipeline/CRITICAL-PATH-TRACKER.md) - Fast-track options

---

**Phase 6 is blocked by Phase 5 exit. Complete copyedit + formatting, then decide narration approach.**

**Fast-track option: Skip Phase 6, publish ebook/print first, add audiobook later.**
