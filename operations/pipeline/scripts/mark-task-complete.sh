#!/bin/bash

# ============================================================================
# mark-task-complete.sh
# ============================================================================
#
# Updates phase tracker when a task is completed by marking the checkbox.
#
# Usage:
#   ./mark-task-complete.sh <phase> <task-keyword>
#
# Examples:
#   ./mark-task-complete.sh 5 copyedit        # Mark copyedit complete
#   ./mark-task-complete.sh 6 narration       # Mark narration complete
#
# Note: This is a helper script. You can also manually edit the tracker file.
#
# ============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/config.sh"

cd "${PROJECT_ROOT}" || exit 1

# Usage
if [ $# -lt 2 ]; then
  echo "Usage: $0 <phase-number> <task-keyword>"
  echo ""
  echo "Examples:"
  echo "  $0 5 copyedit    # Mark copyedit task complete in Phase 5"
  echo "  $0 6 recording   # Mark recording task complete in Phase 6"
  echo ""
  echo "The script will search for the task keyword in the phase tracker"
  echo "and mark its checkbox as complete [ ] -> [x]"
  exit 1
fi

PHASE_NUM=$1
TASK_KEYWORD=$2

# Validate phase
if [ "$PHASE_NUM" -lt 1 ] || [ "$PHASE_NUM" -gt "$TOTAL_PHASES" ]; then
  echo "${EMOJI_ERROR} Invalid phase number: $PHASE_NUM"
  exit 1
fi

PHASE_NAME=$(get_phase_name $PHASE_NUM)
TRACKER_FILE="${PROJECT_ROOT}/$(get_phase_tracker $PHASE_NUM)"

if [ ! -f "$TRACKER_FILE" ]; then
  echo "${EMOJI_ERROR} Phase tracker not found: $TRACKER_FILE"
  exit 1
fi

echo "Searching for task containing '${TASK_KEYWORD}' in Phase ${PHASE_NUM} (${PHASE_NAME})..."
echo ""

# Find matching task
matching_line=$(grep -i "^\- \[ \].*${TASK_KEYWORD}" "$TRACKER_FILE" | head -1)

if [ -z "$matching_line" ]; then
  echo "${EMOJI_WARNING} No pending task found matching '${TASK_KEYWORD}'"
  echo ""
  echo "Either the task is already complete, or the keyword doesn't match any task."
  echo "Check the tracker file: $TRACKER_FILE"
  exit 1
fi

echo "Found task:"
echo "  $matching_line"
echo ""

# Mark as complete
# Replace first occurrence of [ ] with [x] for this task
sed -i "0,/\[ \].*${TASK_KEYWORD}/s/\[ \]/[x]/" "$TRACKER_FILE"

echo "${EMOJI_SUCCESS} Task marked as complete!"
echo ""
echo "Updated tracker: $TRACKER_FILE"
echo ""
echo "Next steps:"
echo "  1. Check if phase exit gate can pass: ./check-phase-gates.sh $PHASE_NUM exit"
echo "  2. Update pipeline status: ./update-pipeline-status.sh"
echo ""
