#!/bin/bash

# ============================================================================
# get-manual-tasks.sh
# ============================================================================
#
# Lists all tasks the author can do independently (no AI assistance needed).
#
# Usage:
#   ./get-manual-tasks.sh [phase-number]
#
# Examples:
#   ./get-manual-tasks.sh 6    # Get manual tasks for Phase 6 (Audio)
#   ./get-manual-tasks.sh      # Get manual tasks for current phase
#
# ============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/config.sh"

cd "${PROJECT_ROOT}" || exit 1

# Get phase number
if [ $# -eq 0 ]; then
  PHASE_NUM=$(jq -r '.pipeline.current_phase // 1' "${PROJECT_ROOT}/${METRICS_SUMMARY}" 2>/dev/null || echo "1")
else
  PHASE_NUM=$1
fi

# Validate
if [ "$PHASE_NUM" -lt 1 ] || [ "$PHASE_NUM" -gt "$TOTAL_PHASES" ]; then
  echo "${EMOJI_ERROR} Invalid phase number: $PHASE_NUM"
  exit 1
fi

PHASE_NAME=$(get_phase_name $PHASE_NUM)
TRACKER_FILE="${PROJECT_ROOT}/$(get_phase_tracker $PHASE_NUM)"

echo "========================================"
echo " Phase ${PHASE_NUM}: ${PHASE_NAME}"
echo " MANUAL TASKS (Author Independent)"
echo "========================================"
echo ""

if [ ! -f "$TRACKER_FILE" ]; then
  echo "${EMOJI_ERROR} Phase tracker not found: $TRACKER_FILE"
  exit 1
fi

# Extract MANUAL tasks section
manual_tasks=$(awk '/### \[MANUAL\] Tasks/,/## 📈|## 🔗/' "$TRACKER_FILE" | \
               grep "^\- \[" | head -50)

if [ -z "$manual_tasks" ]; then
  echo "${EMOJI_INFO} No manual tasks found for this phase."
  echo ""
  echo "This phase may be AI-driven, or tasks are not yet defined."
  echo "Check the phase tracker: $TRACKER_FILE"
  exit 0
fi

# Count tasks
total_tasks=$(echo "$manual_tasks" | wc -l)
complete_tasks=$(echo "$manual_tasks" | grep -c "^\- \[x\]")
pending_tasks=$((total_tasks - complete_tasks))

echo "${EMOJI_INFO} Total manual tasks: $total_tasks"
echo "${EMOJI_CHECK} Complete: $complete_tasks"
echo "${EMOJI_PENDING} Pending: $pending_tasks"
echo ""

if [ "$pending_tasks" -eq 0 ]; then
  echo "${EMOJI_SUCCESS} All manual tasks complete!"
  echo ""
  echo "Next: Check phase exit gate with ./check-phase-gates.sh $PHASE_NUM exit"
  exit 0
fi

echo "PENDING MANUAL TASKS (No AI needed):"
echo "----------------------------------------"
echo "$manual_tasks" | grep "^\- \[ \]" | nl -w2 -s'. ' | sed 's/^/  /'

echo ""
echo "ESTIMATED TIME: Check phase tracker for time estimates"
echo ""
echo "${EMOJI_INFO} You can complete these tasks independently without AI assistance."
echo ""
echo "When done:"
echo "  ./mark-task-complete.sh $PHASE_NUM <task-id>"
echo ""
