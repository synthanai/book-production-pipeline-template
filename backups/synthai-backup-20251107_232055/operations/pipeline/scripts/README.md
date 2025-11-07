# Pipeline Automation Scripts

**Purpose:** Scripts to automate pipeline status updates, gate validation, and task management.

---

## 📋 Quick Reference

| Script | Purpose | Usage |
|--------|---------|-------|
| **update-pipeline-status.sh** | Update dashboard with current status | `./update-pipeline-status.sh` |
| **check-phase-gates.sh** | Validate phase entry/exit criteria | `./check-phase-gates.sh 5 exit` |
| **generate-pipeline-report.sh** | Create comprehensive status report | `./generate-pipeline-report.sh [file]` |
| **get-ai-tasks.sh** | List tasks requiring AI assistance | `./get-ai-tasks.sh [phase]` |
| **get-manual-tasks.sh** | List author-independent tasks | `./get-manual-tasks.sh [phase]` |
| **mark-task-complete.sh** | Mark task as complete in tracker | `./mark-task-complete.sh 5 copyedit` |
| **update-chapter-metrics.sh** | Scan chapters for word counts | `./update-chapter-metrics.sh` |
| **validate-gate-criteria.sh** | Check if exit gate can pass | `./validate-gate-criteria.sh 5` |

---

## 🚀 Getting Started

### Prerequisites

**Required:**
- Bash shell (Linux, Mac, WSL on Windows)
- Basic command line knowledge

**Optional (for enhanced features):**
- `jq` - JSON processor for automated metrics updates
  - Install: `sudo apt-get install jq` (Ubuntu/Debian)
  - Install: `brew install jq` (Mac)
  - Without jq: Scripts still work, but some features limited

### Configuration

All scripts use `config.sh` for configuration. Customize variables in `config.sh` to match your project:

```bash
# Edit configuration
nano config.sh

# Key variables to customize:
# - PROJECT_NAME: Your book's name
# - TARGET_WORD_COUNT: Target manuscript word count
# - TARGET_CHAPTER_COUNT: Target number of chapters
# - VALIDATION_THRESHOLD: Minimum quality score (default: 4.5)
```

---

## 📖 Script Documentation

### 1. update-pipeline-status.sh

**Purpose:** Scans phase trackers and updates the pipeline dashboard with current status.

**Usage:**
```bash
./update-pipeline-status.sh
```

**What it does:**
1. Reads all 9 phase tracker files
2. Extracts completion percentages and gate status
3. Updates `PIPELINE-STATUS-DASHBOARD.md`
4. Updates `metrics-summary.json` (if jq available)

**When to run:**
- After completing major tasks
- Before/after work sessions
- When checking overall progress

**Output:**
- Updates dashboard with current phase, completion percentage, and gate status
- Updates metrics file with machine-readable data

---

### 2. check-phase-gates.sh

**Purpose:** Validates entry/exit criteria for a phase and shows what's blocking progress.

**Usage:**
```bash
# Check exit gate for Phase 5
./check-phase-gates.sh 5 exit

# Check entry gate for Phase 6
./check-phase-gates.sh 6 entry

# Check both entry and exit gates
./check-phase-gates.sh 5
```

**What it does:**
1. Reads phase tracker file
2. Extracts entry/exit criteria checklists
3. Counts passed vs. pending criteria
4. Shows blockers preventing gate passage

**When to run:**
- Before attempting to move to next phase
- When checking what's blocking progress
- After completing tasks (to see if gate now passes)

**Exit codes:**
- `0` - All criteria met (gate PASSED)
- `1` - Some criteria not met (gate PENDING)
- `2` - Usage error

**Example output:**
```
Phase 5 (Text) EXIT GATE STATUS:
  ✅ All chapters written (21/21)
  ✅ Word count met (87,234 words)
  ✅ Pass 2 NQ validation passed (4.86/5.0)
  ✅ Zero chapters flagged for refinement
  ⏸ Copyedit complete [BLOCKER]
  ⏸ Manuscript formatted [BLOCKER]

EXIT GATE STATUS:
  ℹ️ Total criteria: 6
  ✅ Passed: 4
  ⏸ Pending: 2
  ℹ️ Completion: 67%

⏸ RESULT: EXIT GATE PENDING
  2 criteria still pending.

BLOCKERS:
  - Copyedit complete
  - Manuscript formatted
```

---

### 3. generate-pipeline-report.sh

**Purpose:** Creates a comprehensive, human-readable status report of the entire pipeline.

**Usage:**
```bash
# Print to screen
./generate-pipeline-report.sh

# Save to file
./generate-pipeline-report.sh my-status-report.md
```

**What it does:**
1. Extracts data from `metrics-summary.json`
2. Generates formatted markdown report
3. Shows phase-by-phase status
4. Provides quick action commands

**When to run:**
- Before/after major work sessions
- When preparing project updates
- When sharing progress with collaborators

**Example output:**
- Executive summary with overall completion
- Phase-by-phase breakdown
- Critical path analysis
- Quick action commands

---

### 4. get-ai-tasks.sh

**Purpose:** Lists all tasks requiring AI assistance (Claude or other AI) for a phase.

**Usage:**
```bash
# Get AI tasks for Phase 6
./get-ai-tasks.sh 6

# Get AI tasks for current phase
./get-ai-tasks.sh
```

**What it does:**
1. Reads phase tracker's "AI-DRIVEN Tasks" section
2. Lists all pending AI tasks
3. Shows estimated time
4. Provides next steps

**When to run:**
- Before starting a Claude session
- When planning AI-assisted work
- To see what tasks need AI help

**Author workflow:**
1. Run `./get-ai-tasks.sh 6` to see what needs AI
2. Start Claude session with task list
3. Work through tasks with AI assistance
4. Mark complete: `./mark-task-complete.sh 6 <task-id>`

---

### 5. get-manual-tasks.sh

**Purpose:** Lists tasks the author can complete independently without AI.

**Usage:**
```bash
# Get manual tasks for Phase 6
./get-manual-tasks.sh 6

# Get manual tasks for current phase
./get-manual-tasks.sh
```

**What it does:**
1. Reads phase tracker's "MANUAL Tasks" section
2. Lists all pending manual tasks
3. Shows estimated time
4. Emphasizes independence (no AI needed)

**When to run:**
- When planning independent work time
- To see what can be done without AI
- Between AI sessions

**Author workflow:**
1. Run `./get-manual-tasks.sh 6` to see independent work
2. Complete tasks without AI assistance
3. Mark complete: `./mark-task-complete.sh 6 <task-id>`

**Example use case (Phase 5-6 transition):**
```bash
# Phase 5 exit blocked by copyedit and formatting
./get-manual-tasks.sh 5

# Output shows:
#   - Complete copyedit (2-4 hours, MANUAL)
#   - Format manuscript (1-2 hours, MANUAL)

# Author completes these independently (no AI needed)
# Marks complete when done
./mark-task-complete.sh 5 copyedit
./mark-task-complete.sh 5 format

# Phase 5 exit gate now passes, Phase 6 unblocked!
```

---

### 6. mark-task-complete.sh

**Purpose:** Marks a task as complete in the phase tracker by updating the checkbox.

**Usage:**
```bash
# Mark copyedit complete in Phase 5
./mark-task-complete.sh 5 copyedit

# Mark narration guide complete in Phase 6
./mark-task-complete.sh 6 narration
```

**What it does:**
1. Searches phase tracker for task matching keyword
2. Changes `[ ]` to `[x]` for that task
3. Updates tracker file
4. Suggests next steps

**When to run:**
- After completing any task in a phase tracker
- To update progress in real-time

**Note:** You can also manually edit tracker files instead of using this script.

---

### 7. update-chapter-metrics.sh

**Purpose:** Scans chapter files for word counts and updates metrics.

**Usage:**
```bash
./update-chapter-metrics.sh
```

**What it does:**
1. Scans `5-text/chapters/` directory
2. Counts words in each chapter file
3. Calculates total word count
4. Updates `metrics-summary.json`

**When to run:**
- After writing or editing chapters
- Before checking Phase 5 exit gate
- When tracking writing progress

**Output:**
```
Found 21 chapter files

  chapter-01.md                4,234 words
  chapter-02.md                3,987 words
  ...
  chapter-21.md                3,645 words

========================================
TOTAL: 87,234 words across 21 chapters
TARGET: 85,000 words across 21 chapters
========================================

Word count progress: 100%
```

---

### 8. validate-gate-criteria.sh

**Purpose:** Checks if phase exit gate can be passed using actual project data.

**Usage:**
```bash
# Validate Phase 5 exit gate criteria
./validate-gate-criteria.sh 5
```

**What it does:**
1. Reads metrics from `metrics-summary.json`
2. Validates criteria against thresholds
3. Shows PASS/FAIL for each criterion
4. Identifies blockers

**When to run:**
- Before running `check-phase-gates.sh`
- To see if automated criteria are met
- When debugging gate failures

**Currently supported:**
- Phase 5 (Text): Word count, chapter count, validation scores

**Note:** This is complementary to `check-phase-gates.sh`. Use both for complete validation.

---

## 🎯 Common Workflows

### Starting a New Phase

```bash
# 1. Check if previous phase exit gate passed
./check-phase-gates.sh 4 exit

# 2. Check if new phase entry gate can pass
./check-phase-gates.sh 5 entry

# 3. If entry gate passes, get AI tasks
./get-ai-tasks.sh 5

# 4. Get manual tasks
./get-manual-tasks.sh 5
```

---

### Checking Phase 5 Exit (Text Complete)

```bash
# 1. Update chapter metrics
./update-chapter-metrics.sh

# 2. Validate gate criteria (automated)
./validate-gate-criteria.sh 5

# 3. Check full gate status (manual + automated)
./check-phase-gates.sh 5 exit

# 4. If blockers present, check manual tasks
./get-manual-tasks.sh 5

# 5. Complete blockers, mark complete
./mark-task-complete.sh 5 copyedit
./mark-task-complete.sh 5 format

# 6. Re-check gate
./check-phase-gates.sh 5 exit
```

---

### Daily Progress Check

```bash
# Update pipeline status
./update-pipeline-status.sh

# Generate full report
./generate-pipeline-report.sh

# Check current phase exit gate
./check-phase-gates.sh <current-phase> exit
```

---

### Before/After Claude Session

**Before:**
```bash
# Get AI tasks for current phase
./get-ai-tasks.sh
```

**After:**
```bash
# Mark AI tasks complete
./mark-task-complete.sh <phase> <task>

# Update pipeline status
./update-pipeline-status.sh

# Check if phase gate now passes
./check-phase-gates.sh <phase> exit
```

---

## 🛠️ Troubleshooting

### Scripts won't run

**Problem:** `Permission denied`

**Solution:** Make scripts executable
```bash
chmod +x *.sh
```

---

### jq not found warnings

**Problem:** `jq not found, skipping JSON update`

**Solution:** Install jq (optional but recommended)
```bash
# Ubuntu/Debian
sudo apt-get install jq

# Mac
brew install jq

# Or continue without jq (limited functionality)
```

---

### Phase tracker not found

**Problem:** `Phase tracker not found`

**Solution:** Ensure phase trackers exist in `operations/phase-tracking/`
```bash
ls ../../phase-tracking/Phase-*.md
```

---

### Metrics file missing

**Problem:** `metrics-summary.json not found`

**Solution:** Ensure validation system is initialized
```bash
ls ../../validation/quality-metrics/metrics-summary.json
```

---

## 🔧 Customization

### Adding New Scripts

1. Create new script in `scripts/` directory
2. Add shebang: `#!/bin/bash`
3. Source config: `source "${SCRIPT_DIR}/config.sh"`
4. Make executable: `chmod +x your-script.sh`
5. Document in this README

### Modifying Existing Scripts

- Scripts are designed to be readable and modifiable
- Add custom logic as needed for your project
- Use `config.sh` variables for portability
- Test changes on a copy first

---

## 📊 Example: Complete Phase 5-6 Transition

Here's a real-world example workflow for completing Phase 5 and starting Phase 6:

```bash
# ========================================
# PHASE 5 EXIT: Check Status
# ========================================

$ ./update-chapter-metrics.sh
# Output: 87,234 words, 21 chapters

$ ./validate-gate-criteria.sh 5
# Output: Word count ✅, Chapters ✅, Validation ✅

$ ./check-phase-gates.sh 5 exit
# Output: 4/6 criteria met
# BLOCKERS: Copyedit, Formatting

$ ./get-manual-tasks.sh 5
# Output:
#   - Complete copyedit (2-4 hours)
#   - Format manuscript (1-2 hours)

# ========================================
# AUTHOR COMPLETES MANUAL TASKS
# ========================================

# ... author does copyedit (2-4 hours) ...
$ ./mark-task-complete.sh 5 copyedit
# ✅ Task marked complete

# ... author does formatting (1-2 hours) ...
$ ./mark-task-complete.sh 5 format
# ✅ Task marked complete

# ========================================
# PHASE 5 EXIT: Re-check
# ========================================

$ ./check-phase-gates.sh 5 exit
# Output: 6/6 criteria met
# ✅ RESULT: EXIT GATE PASSED

# ========================================
# PHASE 6 ENTRY: Check
# ========================================

$ ./check-phase-gates.sh 6 entry
# Output: 5/5 criteria met
# ✅ RESULT: ENTRY GATE PASSED

$ ./get-ai-tasks.sh 6
# Output: AI tasks ready
#   1. Generate narration guide
#   2. Create chapter summaries
#   3. Identify pronunciations
#   4. Generate audiobook marketing

# ========================================
# START PHASE 6
# ========================================

# ... start Claude session, work through AI tasks ...
# ... mark each complete as done ...

$ ./update-pipeline-status.sh
# ✅ Pipeline updated: Phase 6 in progress
```

---

## 🔗 Related Documents

- [config.sh](./config.sh) - Script configuration
- [Pipeline Dashboard](../PIPELINE-STATUS-DASHBOARD.md) - Overall status
- [Stage-Gate Reference](../STAGE-GATES-REFERENCE.md) - Gate definitions
- [Phase Trackers](../../phase-tracking/) - Individual phase status

---

**These scripts automate routine pipeline tasks, saving time and reducing tracking overhead.**

**Questions? Check the main operations README or individual script comments.**
