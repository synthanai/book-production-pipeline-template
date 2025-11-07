#!/bin/bash

# ===========================================================================
# get-ai-tasks.sh
# ===========================================================================
#
# Lists all tasks requiring AI assistance for a specified phase.
#
# Usage:
#   ./get-ai-tasks.sh [phase-number]
#
# Examples:
#   ./get-ai-tasks.sh 6    # Get AI tasks for Phase 6 (Audio)
#   ./get-ai-tasks.sh      # Get AI tasks for current phase
#
# ===========================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/config.sh"

cd "${PROJECT_ROOT}" || exit 1

# Get phase number (use current phase if not specified)
if [ $# -eq 0 ]; then
  # Extract current phase from metrics
  PHASE_NUM=$(jq -r '.pipeline.current_phase // 1' "${PROJECT_ROOT}/${METRICS_SUMMARY}" 2>/dev/null || echo "1")
else
  PHASE_NUM=$1
fi

# Validate phase number
if [ "$PHASE_NUM" -lt 1 ] || [ "$PHASE_NUM" -gt "$TOTAL_PHASES" ]; then
  echo "${EMOJI_ERROR} Invalid phase number: $PHASE_NUM"
  exit 1
fi

PHASE_NAME=$(get_phase_name $PHASE_NUM)
TRACKER_FILE="${PROJECT_ROOT}/$(get_phase_tracker $PHASE_NUM)"

echo "========================================"
echo " Phase ${PHASE_NUM}: ${PHASE_NAME}"
echo " AI-DRIVEN TASKS"
echo "========================================"
echo ""

if [ ! -f "$TRACKER_FILE" ]; then
  echo "${EMOJI_ERROR} Phase tracker not found: $TRACKER_FILE"
  exit 1
fi

# Extract AI-DRIVEN tasks section
ai_tasks=$(awk '/### \[AI-DRIVEN\] Tasks/,/### \[MANUAL\]|## 📈/' "$TRACKER_FILE" | \
           grep "^\- \[" | head -50)

if [ -z "$ai_tasks" ]; then
  echo "${EMOJI_INFO} No AI-driven tasks found for this phase."
  echo ""
  echo "This phase may be primarily manual, or tasks are not yet defined."
  echo "Check the phase tracker for details: $TRACKER_FILE"
  exit 0
fi

# Count and display tasks
total_tasks=$(echo "$ai_tasks" | wc -l)
complete_tasks=$(echo "$ai_tasks" | grep -c "^\- \[x\]")
pending_tasks=$((total_tasks - complete_tasks))

echo "${EMOJI_INFO} Total AI tasks: $total_tasks"
echo "${EMOJI_CHECK} Complete: $complete_tasks"
echo "${EMOJI_PENDING} Pending: $pending_tasks"
echo ""

if [ "$pending_tasks" -eq 0 ]; then
  echo "${EMOJI_SUCCESS} All AI tasks complete!"
  echo ""
  echo "Next: Check manual tasks with ./get-manual-tasks.sh $PHASE_NUM"
  exit 0
fi

echo "PENDING AI TASKS:"
echo "----------------------------------------"
echo "$ai_tasks" | grep "^\- \[ \]" | nl -w2 -s'. ' | sed 's/^/  /'

echo ""
echo "ESTIMATED TIME: Check phase tracker for time estimates"
echo ""
echo "To start AI session:"
echo "  1. Open Claude or your AI assistant"
echo "  2. Provide context from: ${TRACKER_FILE}"
echo "  3. Work through pending tasks above"
echo "  4. Mark complete: ./mark-task-complete.sh $PHASE_NUM <task-id>"
echo ""
