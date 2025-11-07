#!/bin/bash

#############################################################################
# SYNTHAI Example Data Cleanup Script
#############################################################################
#
# Purpose: Remove all SYNTHAI example data to create a pure template
# Usage:   bash cleanup-synthai-examples.sh
# Time:    ~2 minutes
#
# This script will:
# 1. Create backup of current state
# 2. Delete example files (-EXAMPLE.md)
# 3. Remove SYNTHAI sections from documentation
# 4. Reset metrics to template state
# 5. Update pipeline status to 0%
#
#############################################################################

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory and repository root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$( cd "$SCRIPT_DIR/../../.." && pwd )"

echo -e "${BLUE}╔════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     SYNTHAI Example Data Cleanup Script                       ║${NC}"
echo -e "${BLUE}║     Converting Template + Examples → Pure Template            ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════════╝${NC}"
echo ""

#############################################################################
# Step 0: Confirmation
#############################################################################

echo -e "${YELLOW}⚠️  WARNING: This script will modify your repository${NC}"
echo ""
echo "This script will:"
echo "  • Delete 2 example files (-EXAMPLE.md)"
echo "  • Remove SYNTHAI sections from 23+ documentation files"
echo "  • Reset metrics-summary.json to template state"
echo "  • Update pipeline status to 0% complete"
echo ""
echo -e "${GREEN}A backup will be created before any changes.${NC}"
echo ""
read -p "Do you want to continue? (yes/no): " -r
echo ""

if [[ ! $REPLY =~ ^[Yy][Ee][Ss]$ ]]; then
    echo -e "${RED}❌ Cleanup cancelled by user${NC}"
    exit 0
fi

#############################################################################
# Step 1: Create Backup
#############################################################################

echo -e "${BLUE}📦 Step 1: Creating backup...${NC}"

BACKUP_DIR="$REPO_ROOT/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_NAME="synthai-backup-$TIMESTAMP"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

mkdir -p "$BACKUP_DIR"
mkdir -p "$BACKUP_PATH"

# Backup critical files
echo "  → Backing up operations/"
cp -r "$REPO_ROOT/operations" "$BACKUP_PATH/"

echo "  → Backing up 5-text/"
cp -r "$REPO_ROOT/5-text" "$BACKUP_PATH/"

echo "  → Backing up README.md"
cp "$REPO_ROOT/README.md" "$BACKUP_PATH/"

echo "  → Backing up metrics/"
cp -r "$REPO_ROOT/metrics" "$BACKUP_PATH/"

echo -e "${GREEN}✅ Backup created: $BACKUP_PATH${NC}"
echo ""

#############################################################################
# Step 2: Delete Example Files
#############################################################################

echo -e "${BLUE}🗑️  Step 2: Deleting example files...${NC}"

# Delete -EXAMPLE files
EXAMPLE_FILES=(
    "operations/validation/gate-validation/phase-5-entry-passed-EXAMPLE.md"
    "operations/validation/chapter-validation/narrative-quality/chapter-01-pass2-nq-EXAMPLE.md"
)

for file in "${EXAMPLE_FILES[@]}"; do
    filepath="$REPO_ROOT/$file"
    if [ -f "$filepath" ]; then
        rm "$filepath"
        echo -e "  ${GREEN}✓${NC} Deleted: $file"
    else
        echo -e "  ${YELLOW}⊘${NC} Not found: $file"
    fi
done

# Optional: Delete CONTINUATION-PLAN.md (move to archive)
if [ -f "$REPO_ROOT/operations/CONTINUATION-PLAN.md" ]; then
    mkdir -p "$REPO_ROOT/archive/development-history"
    mv "$REPO_ROOT/operations/CONTINUATION-PLAN.md" \
       "$REPO_ROOT/archive/development-history/CONTINUATION-PLAN.md"
    echo -e "  ${GREEN}✓${NC} Moved CONTINUATION-PLAN.md to archive/"
fi

echo -e "${GREEN}✅ Example files removed${NC}"
echo ""

#############################################################################
# Step 3: Reset Metrics JSON
#############################################################################

echo -e "${BLUE}📊 Step 3: Resetting metrics-summary.json...${NC}"

METRICS_FILE="$REPO_ROOT/operations/validation/quality-metrics/metrics-summary.json"

# Remove example_data section (lines with "example_data" through closing brace)
# This is a safe approach that preserves JSON structure
if [ -f "$METRICS_FILE" ]; then
    # Create a temp file without the example_data section
    python3 -c "
import json
import sys

with open('$METRICS_FILE', 'r') as f:
    data = json.load(f)

# Remove example_data section if it exists
if 'example_data' in data:
    del data['example_data']

# Write back with pretty formatting
with open('$METRICS_FILE', 'w') as f:
    json.dump(data, f, indent=2)
    f.write('\n')
" 2>/dev/null

    if [ $? -eq 0 ]; then
        echo -e "  ${GREEN}✓${NC} Removed example_data section from metrics-summary.json"
    else
        echo -e "  ${YELLOW}⚠${NC}  Python not available, using sed fallback"
        # Fallback to sed (less precise)
        sed -i '/^  "example_data":/,/^  }$/d' "$METRICS_FILE"
        # Fix trailing comma
        sed -i '$ s/,$//' "$METRICS_FILE"
        echo -e "  ${GREEN}✓${NC} Removed example_data using sed"
    fi
else
    echo -e "  ${YELLOW}⚠${NC}  metrics-summary.json not found"
fi

echo -e "${GREEN}✅ Metrics reset to template state${NC}"
echo ""

#############################################################################
# Step 4: Clean Documentation Files
#############################################################################

echo -e "${BLUE}📝 Step 4: Cleaning documentation files...${NC}"

# Function to remove SYNTHAI example sections
remove_synthai_sections() {
    local file="$1"
    local description="$2"

    if [ ! -f "$file" ]; then
        echo -e "  ${YELLOW}⊘${NC} Not found: $description"
        return
    fi

    # Remove lines containing SYNTHAI/synthai/Raj/"The Offering"
    # Keep original if no matches found
    if grep -q "SYNTHAI\|synthai\|Raj\|The Offering" "$file"; then
        # Create temp file with SYNTHAI references removed
        grep -v "SYNTHAI\|synthai\|Raj\|The Offering" "$file" > "$file.tmp"
        mv "$file.tmp" "$file"
        echo -e "  ${GREEN}✓${NC} Cleaned: $description"
    else
        echo -e "  ${BLUE}○${NC} No changes: $description"
    fi
}

# Clean README files
echo "  → Cleaning root README.md..."
remove_synthai_sections "$REPO_ROOT/README.md" "README.md"

echo "  → Cleaning metrics README..."
remove_synthai_sections "$REPO_ROOT/metrics/README.md" "metrics/README.md"

echo "  → Cleaning phase README files..."
remove_synthai_sections "$REPO_ROOT/1-ideation/README.md" "1-ideation/README.md"
remove_synthai_sections "$REPO_ROOT/2-research/README.md" "2-research/README.md"
remove_synthai_sections "$REPO_ROOT/3-preparation/README.md" "3-preparation/README.md"

# Clean preparation subdirectories
PREP_DIRS=(masters quality-frameworks references blueprints guides architectures)
for dir in "${PREP_DIRS[@]}"; do
    remove_synthai_sections "$REPO_ROOT/3-preparation/$dir/README.md" "3-preparation/$dir/README.md"
done

# Clean 5-text files
echo "  → Cleaning Phase 5 files..."
TEXT_FILES=(ENTRY-CRITERIA-CHECKLIST.md EXIT-CRITERIA-CHECKLIST.md
            AI-TASKS.md MANUAL-TASKS.md DELIVERABLES-CHECKLIST.md PHASE-OVERVIEW.md)
for file in "${TEXT_FILES[@]}"; do
    remove_synthai_sections "$REPO_ROOT/5-text/$file" "5-text/$file"
done

# Clean operations files
echo "  → Cleaning operations files..."
remove_synthai_sections "$REPO_ROOT/operations/validation/README.md" "validation/README.md"

# Clean pipeline hub files
echo "  → Cleaning pipeline hub files..."
remove_synthai_sections "$REPO_ROOT/operations/pipeline/STAGE-GATES-REFERENCE.md" "STAGE-GATES-REFERENCE.md"
remove_synthai_sections "$REPO_ROOT/operations/pipeline/CRITICAL-PATH-TRACKER.md" "CRITICAL-PATH-TRACKER.md"
remove_synthai_sections "$REPO_ROOT/operations/pipeline/DECISION-LOG.md" "DECISION-LOG.md"

# Clean phase trackers
echo "  → Cleaning phase trackers..."
for i in {1..9}; do
    TRACKER_FILE="$REPO_ROOT/operations/phase-tracking/Phase-$i-*.md"
    for file in $TRACKER_FILE; do
        if [ -f "$file" ]; then
            remove_synthai_sections "$file" "$(basename "$file")"
        fi
    done
done

echo -e "${GREEN}✅ Documentation cleaned${NC}"
echo ""

#############################################################################
# Step 5: Special handling for Phase 5 Tracker
#############################################################################

echo -e "${BLUE}📄 Step 5: Resetting Phase 5 Tracker to template state...${NC}"

PHASE5_TRACKER="$REPO_ROOT/operations/phase-tracking/Phase-5-Text-TRACKER.md"

if [ -f "$PHASE5_TRACKER" ]; then
    # This file is heavily SYNTHAI-populated, so we'll create a clean template version
    cat > "$PHASE5_TRACKER" << 'EOF'
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

- [ ] Draft chapters using templates and prompts
- [ ] Refine chapters based on validation
- [ ] Conduct Pass 2 NQ validation
- [ ] Address validation feedback
- [ ] Generate chapter summaries
- [ ] Cross-reference consistency checks

**Total AI Time:** [Estimate: 160-400 hours]

---

### [MANUAL] Tasks

- [ ] Review and approve chapters
- [ ] Provide feedback for refinement
- [ ] Validate character consistency
- [ ] Verify plot continuity
- [ ] Complete final copyedit (2-4 hours)
- [ ] Format manuscript (1-2 hours)

**Total Manual Time:** [Estimate: 40-80 hours]

---

## 📈 Quality Metrics

### Validation Summary

**Pass 2 Narrative Quality (NQ) Scores:**
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
EOF

    echo -e "  ${GREEN}✓${NC} Phase 5 Tracker reset to template"
else
    echo -e "  ${YELLOW}⊘${NC} Phase 5 Tracker not found"
fi

echo -e "${GREEN}✅ Phase 5 Tracker reset${NC}"
echo ""

#############################################################################
# Step 6: Update Pipeline Status
#############################################################################

echo -e "${BLUE}🔄 Step 6: Updating pipeline status...${NC}"

cd "$SCRIPT_DIR"

if [ -f "./update-pipeline-status.sh" ]; then
    ./update-pipeline-status.sh > /dev/null 2>&1
    echo -e "  ${GREEN}✓${NC} Pipeline status updated to 0% complete"
else
    echo -e "  ${YELLOW}⚠${NC}  update-pipeline-status.sh not found, skipping"
fi

echo -e "${GREEN}✅ Pipeline status updated${NC}"
echo ""

#############################################################################
# Step 7: Verification
#############################################################################

echo -e "${BLUE}🔍 Step 7: Verifying cleanup...${NC}"

# Count remaining SYNTHAI references (excluding this script and the guide)
REMAINING=$(grep -r "SYNTHAI\|synthai" \
    --include="*.md" \
    --include="*.json" \
    --exclude="cleanup-synthai-examples.sh" \
    --exclude="TEMPLATE-CLEANUP-GUIDE.md" \
    "$REPO_ROOT" 2>/dev/null | wc -l)

if [ "$REMAINING" -eq 0 ]; then
    echo -e "  ${GREEN}✓${NC} No SYNTHAI references found (excluding cleanup docs)"
else
    echo -e "  ${YELLOW}⚠${NC}  Found $REMAINING remaining SYNTHAI references"
    echo "  Run this to see them:"
    echo "    grep -r 'SYNTHAI' --include='*.md' ."
fi

# Check pipeline status
if [ -f "$REPO_ROOT/operations/pipeline/PIPELINE-STATUS-DASHBOARD.md" ]; then
    COMPLETION=$(grep "Overall Completion:" "$REPO_ROOT/operations/pipeline/PIPELINE-STATUS-DASHBOARD.md" | head -1)
    echo -e "  ${GREEN}✓${NC} Pipeline status: $COMPLETION"
fi

echo -e "${GREEN}✅ Verification complete${NC}"
echo ""

#############################################################################
# Summary
#############################################################################

echo -e "${BLUE}╔════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                    🎉 CLEANUP COMPLETE! 🎉                    ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}✅ SYNTHAI example data removed successfully${NC}"
echo ""
echo "What was done:"
echo "  • Deleted 2 example files"
echo "  • Cleaned 23+ documentation files"
echo "  • Reset metrics to template state"
echo "  • Reset Phase 5 Tracker to template"
echo "  • Updated pipeline to 0% complete"
echo ""
echo "Backup location:"
echo "  📦 $BACKUP_PATH"
echo ""
echo "Next steps:"
echo "  1. Review TEMPLATE-CLEANUP-GUIDE.md for customization tips"
echo "  2. Update project metadata in metrics-summary.json"
echo "  3. Define your chapter structure in 5-text/"
echo "  4. Start Phase 1: Begin ideation work"
echo ""
echo "To start your project:"
echo "  cd operations/pipeline/scripts"
echo "  ./get-manual-tasks.sh 1  # See what to do first"
echo ""
echo -e "${GREEN}Your template is ready! Happy writing! 📚✨${NC}"
echo ""
