# Phase 1: Ideation - Tracker

**Phase Status:** ⚪ Not Started
**Entry Gate:** ⏸ Pending
**Exit Gate:** ⏸ Pending
**Completion:** 0%

**Last Updated:** [Timestamp]

---

## 📊 Phase Overview

**Purpose:** Develop and validate your book concept before investing in research and writing.

**Typical Duration:** 10-20 hours

**Key Question:** *Do I have a clear, compelling concept worth pursuing?*

---

## 🚪 Entry Criteria

**Status:** ⏸ 0/4 criteria met (0%)

- [ ] **Project decision made** - Committed to writing this book
- [ ] **Time allocated** - Have 10-20 hours available for ideation
- [ ] **Template initialized** - Book production pipeline set up
- [ ] **Idea seed exists** - Have general notion of book topic/theme

**Entry Gate:** Ready to pass (low barrier)

---

## 🎯 Phase Deliverables

**Status:** ⏸ 0/5 deliverables complete (0%)

### Core Documents
- [ ] **Concept document** - 2-5 page description of book idea
  - Location: `1-ideation/concept.md`
  - What to include: Core idea, why this book matters, what makes it unique
  - Estimated time: 2-4 hours

- [ ] **Target audience profile** - Specific reader persona or demographic
  - Location: `1-ideation/audience.md`
  - What to include: Demographics, psychographics, pain points, needs
  - Estimated time: 1-2 hours

- [ ] **Core themes** - 3-5 key messages or ideas
  - Location: `1-ideation/themes.md`
  - What to include: Central messages, what readers will learn/feel/do
  - Estimated time: 1-2 hours

- [ ] **Genre/category** - Clear positioning in market
  - Location: `1-ideation/genre.md`
  - What to include: Primary genre, sub-genres, comparable titles
  - Estimated time: 1 hour

- [ ] **Story framework or chapter outline** - High-level structure
  - Location: `1-ideation/framework.md`
  - What to include: Act structure (fiction), chapter topics (non-fiction)
  - Estimated time: 3-5 hours

---

## 🚪 Exit Criteria

**Status:** ⏸ 0/5 criteria met (0%)

- [ ] **Concept document complete** - Written description of book idea (2-5 pages)
- [ ] **Target audience defined** - Specific reader persona or demographic
- [ ] **Core themes articulated** - 3-5 key messages/ideas documented
- [ ] **Genre/category decided** - Clear positioning in market
- [ ] **Story framework or outline complete** - High-level structure defined

**Exit Gate:** Blocks Phase 2 (Research) entry

**Validation:** Run `./check-phase-gates.sh 1 exit` to verify readiness

---

## 🤖 AI-Driven vs 🙋 Manual Tasks

### [AI-DRIVEN] Tasks Requiring Claude
- [ ] **Brainstorm concepts** - Generate book ideas from seed concept
- [ ] **Develop target audience** - Create detailed reader personas
- [ ] **Identify themes** - Extract key messages from concept
- [ ] **Research genres** - Find comparable titles and positioning
- [ ] **Draft framework** - Create story structure or chapter outline
- [ ] **Validate concept** - Check if concept is viable/marketable

**Estimated AI Time:** 4-8 hours

**How to use:**
```bash
cd operations/pipeline/scripts
./get-ai-tasks.sh 1
```

---

### [MANUAL] Tasks Author Can Do Independently
- [ ] **Reflect on why you want to write this book** - Personal motivation
- [ ] **List topics you're passionate about** - Brainstorm independently
- [ ] **Research comparable books** - Browse Amazon, Goodreads
- [ ] **Talk to potential readers** - Validate audience interest
- [ ] **Sketch initial ideas** - Freewrite or mind-map concepts
- [ ] **Refine AI-generated materials** - Review and personalize Claude's outputs

**Estimated Manual Time:** 6-12 hours

**How to use:**
```bash
./get-manual-tasks.sh 1
```

---

## 📈 Quality Metrics

**Concept Quality Indicators:**
- [ ] Concept is clear enough to explain in 2-3 sentences
- [ ] Target audience is specific (not "everyone")
- [ ] Book fills a gap or offers unique angle
- [ ] You're excited to spend 200+ hours on this book
- [ ] At least 3 comparable titles exist (validates market)

---

## 🔗 Dependencies

**Prerequisites (Before Starting):**
- None - Phase 1 is the starting point

**Blocks (If Not Complete):**
- Phase 2 (Research) cannot start until Phase 1 exit gate passes

---

## 🚧 Current Status & Blockers

**Status:** ⚪ Not Started

**Blockers:** None

**Next Action:** Begin concept development work in `1-ideation/` directory

---

## 💡 Tips for This Phase

**Do:**
- ✅ Start broad, narrow as you go
- ✅ Talk to potential readers early
- ✅ Research comparable titles for validation
- ✅ Be specific about target audience
- ✅ Document everything (even bad ideas)

**Don't:**
- ❌ Skip audience definition (critical for later phases)
- ❌ Try to perfect the concept (it will evolve)
- ❌ Start writing chapters (too early)
- ❌ Worry about word count or structure yet
- ❌ Get paralyzed by too many options (pick one, test it)

**Common Pitfalls:**
- Concept too vague or broad
- Target audience too generic ("anyone who likes X")
- No differentiation from existing books
- Skipping framework (leads to structural problems later)

---

## 🔗 Related Documents

- [1-ideation/ directory](../../1-ideation/) - Working files for this phase
- [Stage-Gate Reference](../pipeline/STAGE-GATES-REFERENCE.md) - Gate E1 & X1 definitions
- [Phase 2 Tracker](./Phase-2-Research-TRACKER.md) - Next phase

---

**Use this tracker to monitor your progress through Phase 1. Update checkboxes as you complete deliverables.**
