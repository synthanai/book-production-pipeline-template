# Template Usage Quick Start

**For:** Authors starting a new book project with this template

**Time:** 5 minutes to understand, 2 minutes to clean, 15 minutes to customize

---

## 🚀 Three Steps to Get Started

### Step 1: Clean the Template (2 minutes)

Remove all SYNTHAI example data:

```bash
cd /path/to/book-production-pipeline-template
bash operations/pipeline/scripts/cleanup-synthai-examples.sh
```

**What this does:**
- ✅ Deletes example files
- ✅ Removes SYNTHAI references from docs
- ✅ Resets metrics to 0%
- ✅ Creates backup first (safe!)

**Result:** Pure template ready for your project

---

### Step 2: Customize for Your Book (15 minutes)

#### A. Set Project Name

**File:** `operations/validation/quality-metrics/metrics-summary.json`

```json
{
  "project": {
    "name": "My Book Title",  ← Change this
    ...
  }
}
```

#### B. Define Chapter Structure

**File:** `5-text/DELIVERABLES-CHECKLIST.md`

```markdown
**Chapters:** 15 chapters  ← Your count
**Target Word Count:** 70,000-80,000 words  ← Your target
```

**File:** `operations/phase-tracking/Phase-5-Text-TRACKER.md`

Update the chapter table:
```markdown
| Chapter | Title | Word Count | Status | Validation | Notes |
|---------|-------|------------|--------|------------|-------|
| 01 | Your Chapter 1 Title | — | ⏸ | — | — |
| 02 | Your Chapter 2 Title | — | ⏸ | — | — |
...
```

#### C. Create Chapter Outline

**File:** `3-preparation/blueprints/chapter-outline.md` (create this)

```markdown
# Chapter Outline

## Act I: [Your Act Name]
- Chapter 1: [Title] - [Brief description]
- Chapter 2: [Title] - [Brief description]
...
```

---

### Step 3: Start Phase 1 (Begin ideation)

```bash
cd operations/pipeline/scripts

# See what you can do without AI
./get-manual-tasks.sh 1

# See what AI tasks are available
./get-ai-tasks.sh 1

# Check your status anytime
./generate-pipeline-report.sh
```

---

## 📊 Understanding the Template

### What This Template Gives You

**9-Phase Pipeline:**
1. **Ideation** - Develop concept
2. **Research** - Market analysis
3. **Preparation** - World-building, characters
4. **Utilities** - Templates, prompts, tools
5. **Text** - Write the manuscript ← Longest phase
6. **Audio** - Audiobook production (optional)
7. **Video** - Marketing videos (optional)
8. **Publication** - Publish the book
9. **Marketing** - Promote the book

**45+ Stage Gates:**
- Entry gates: Can I start this phase?
- Exit gates: Can I finish this phase?
- Quality gates: Does it meet standards?

**Quality Assurance:**
- Pass 2 NQ validation (8 dimensions)
- Automated quality scoring
- Chapter-by-chapter tracking

**AI/Manual Separation:**
- Know what needs Claude vs. what you do alone
- Task lists for each phase
- Time estimates for planning

---

## 🎯 Typical Workflow

### Daily
1. Check current phase tracker
2. Get task list (AI or manual)
3. Complete tasks
4. Update progress

### Weekly
1. Run pipeline status update
2. Review gate criteria
3. Check quality metrics
4. Adjust schedule if needed

### At Phase Completion
1. Validate exit criteria
2. Pass exit gate
3. Document in decision log
4. Start next phase

---

## 📁 Key Files to Know

### Operations Hub
- **PIPELINE-STATUS-DASHBOARD.md** - Your single source of truth
- **STAGE-GATES-REFERENCE.md** - All 45 gates defined
- **CRITICAL-PATH-TRACKER.md** - What's blocking you?
- **DECISION-LOG.md** - Record major decisions

### Phase Tracking
- **Phase-[1-9]-TRACKER.md** - Detailed phase status
- Updated as you work
- Shows entry/exit criteria

### Scripts (operations/pipeline/scripts/)
- **check-phase-gates.sh** - Validate gate criteria
- **get-ai-tasks.sh** - List AI-required tasks
- **get-manual-tasks.sh** - List independent tasks
- **update-pipeline-status.sh** - Refresh metrics
- **generate-pipeline-report.sh** - Full status report

### Quality Assurance
- **QA-System-Complete-Reference.md** - Validation framework
- Chapter validation reports go in `validation/`
- Metrics tracked in `metrics-summary.json`

---

## 🤖 Working with AI (Claude)

### What AI Helps With
- **Ideation:** Brainstorm concepts, develop characters
- **Research:** Find comparable titles, analyze trends
- **Writing:** Draft chapters using your templates
- **Validation:** Quality assessment, consistency checks
- **Refinement:** Improve prose based on feedback

### What You Do Manually
- **Decision-making:** Choose direction, approve content
- **Review:** Read and evaluate AI output
- **Copyedit:** Final proofreading
- **Publishing:** Upload to platforms, manage accounts

### Getting AI Task Lists

```bash
# For any phase (1-9)
./get-ai-tasks.sh 5

# Example output:
# Phase 5 AI-Driven Tasks:
# - Draft chapters using templates
# - Run Pass 2 NQ validation
# - Generate chapter summaries
# Total estimated time: 160-400 hours
```

---

## 📈 Tracking Progress

### Check Overall Status
```bash
./generate-pipeline-report.sh
```

**Shows:**
- Overall completion percentage
- Current phase
- Blockers
- Next actions

### Check Specific Phase
```bash
./check-phase-gates.sh 5 entry  # Can I start Phase 5?
./check-phase-gates.sh 5 exit   # Can I finish Phase 5?
```

### Mark Tasks Complete
```bash
./mark-task-complete.sh 5 copyedit
```

### Update Metrics
```bash
./update-pipeline-status.sh
```

---

## 🎨 Customization Tips

### For Fiction Books
- Heavy Phase 3 (character profiles, world-building)
- Focus on Pass 2 NQ validation (narrative quality)
- Optional: Skip or minimize Phase 7 (video)

### For Non-Fiction Books
- Moderate Phase 3 (topic research, chapter outlines)
- May want more Phase 7 (tutorial videos)
- Strong Phase 9 (content marketing)

### For Memoir/Personal Narrative
- Light Phase 3 (timeline, key events)
- Primary focus on Phase 5 (writing)
- Strong Phase 9 (personal platform)

### For Technical/Programming Books
- Heavy Phase 3 (code examples, tutorials)
- Extensive Phase 4 (code snippets, templates)
- May include Phase 7 (video tutorials)

---

## ⚡ Fast-Track Options

### Skip Audio (Phase 6)
- Complete Phase 5 → Jump to Phase 8
- Publish ebook/print first
- Add audiobook later if desired
- **Time saved:** 60-80 hours or 4-6 weeks

### Skip Video (Phase 7)
- Many authors don't create video content
- Can add post-publication
- **Time saved:** 20-60 hours

### Outsource Intensive Work
- Copyedit: $500-$1,500 (saves 4-8 hours)
- Audio narration: $3,000-$5,000 (saves 60-80 hours)
- Cover design: $300-$3,000 (not in pipeline)

---

## 🆘 Troubleshooting

### "I don't know what to do next"
```bash
# Check your current blockers
./generate-pipeline-report.sh

# See manual tasks (no AI needed)
./get-manual-tasks.sh [current-phase]

# See AI tasks (need Claude)
./get-ai-tasks.sh [current-phase]
```

### "Gate won't pass"
```bash
# See what's missing
./check-phase-gates.sh [phase] exit

# Shows:
# - Which criteria passed ✅
# - Which criteria pending ⏸
# - What to do next
```

### "Metrics seem wrong"
```bash
# Refresh from source files
./update-pipeline-status.sh

# Regenerate dashboard
./generate-pipeline-report.sh
```

### "Want to skip a gate"
- Document rationale in `DECISION-LOG.md`
- Use waiver sparingly (only for good reasons)
- Update tracker manually
- Note: Don't skip critical gates (Phase 5 validation, copyedit)

---

## 📚 Learning Resources

### First-Time Users
1. Read: [README.md](README.md) - Overview
2. Read: [PIPELINE-STATUS-DASHBOARD.md](operations/pipeline/PIPELINE-STATUS-DASHBOARD.md)
3. Study: [Phase-1-Ideation-TRACKER.md](operations/phase-tracking/Phase-1-Ideation-TRACKER.md)
4. Run: `./generate-pipeline-report.sh`

### Understanding Gates
- Read: [STAGE-GATES-REFERENCE.md](operations/pipeline/STAGE-GATES-REFERENCE.md)
- All 45 gates explained
- Entry/exit criteria for each phase
- Validation methods

### Quality Assurance
- Read: [QA-System-Complete-Reference.md](operations/QA-System/QA-System-Complete-Reference.md)
- Understand validation passes
- Learn scoring system
- See quality thresholds

### Automation
- Read: [scripts/README.md](operations/pipeline/scripts/README.md)
- All 8 scripts explained
- Usage examples
- Common workflows

---

## ✅ Success Criteria

**You're successfully using the template when:**

- ✅ You know your current phase
- ✅ You know what's blocking you
- ✅ You can see next actions clearly
- ✅ You track progress regularly
- ✅ You pass gates systematically
- ✅ You maintain quality standards
- ✅ You reach publication!

---

## 🎉 You're Ready!

**This template provides:**
- 📊 Structure (9 phases)
- 🚪 Gates (45 checkpoints)
- 🤖 Automation (8 scripts)
- 📈 Metrics (progress tracking)
- ✅ Quality (validation framework)
- 🎯 Clarity (always know next action)

**Your book journey:**
1. Clean template ← Start here
2. Customize for your book
3. Work through Phase 1-9
4. Track progress with scripts
5. Pass gates systematically
6. Publish your book! 📚

---

**Questions? Check:**
- [TEMPLATE-CLEANUP-GUIDE.md](TEMPLATE-CLEANUP-GUIDE.md) - Detailed cleanup instructions
- [operations/pipeline/scripts/README.md](operations/pipeline/scripts/README.md) - Script documentation
- [PIPELINE-STATUS-DASHBOARD.md](operations/pipeline/PIPELINE-STATUS-DASHBOARD.md) - Current status

**Ready to start? Run:**
```bash
bash operations/pipeline/scripts/cleanup-synthai-examples.sh
```

**Happy writing! 📝✨**
