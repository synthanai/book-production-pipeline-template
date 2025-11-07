#!/bin/bash

# ============================================================================
# check-phase-gates.sh
# ============================================================================
#
# Validates all entry/exit criteria for a specified phase and returns
# PASS/FAIL/PENDING status for each gate.
#
# Usage:
#   ./check-phase-gates.sh <phase-number> [entry|exit]
#
# Examples:
#   ./check-phase-gates.sh 5 exit     # Check Phase 5 exit gate
#   ./check-phase-gates.sh 6 entry    # Check Phase 6 entry gate
#   ./check-phase-gates.sh 5          # Check both entry and exit gates
#
# Exit codes:
#   0 - All criteria met (PASS)
#   1 - Some criteria not met (FAIL)
#   2 - Usage error
#
# ============================================================================

# Load configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/config.sh"

# Change to project root
cd "${PROJECT_ROOT}" || exit 1

# Usage
usage() {
  echo "Usage: $0 <phase-number> [entry|exit]"
  echo ""
  echo "Examples:"
  echo "  $0 5 exit     # Check Phase 5 exit gate"
  echo "  $0 6 entry    # Check Phase 6 entry gate"
  echo "  $0 5          # Check both entry and exit gates"
  echo ""
  exit 2
}

# Validate arguments
if [ $# -lt 1 ]; then
  usage
fi

PHASE_NUM=$1
GATE_TYPE=${2:-both}

# Validate phase number
if [ "$PHASE_NUM" -lt 1 ] || [ "$PHASE_NUM" -gt "$TOTAL_PHASES" ]; then
  echo "${EMOJI_ERROR} Invalid phase number: $PHASE_NUM"
  echo "Phase must be between 1 and $TOTAL_PHASES"
  exit 2
fi

# Validate gate type
if [ "$GATE_TYPE" != "entry" ] && [ "$GATE_TYPE" != "exit" ] && [ "$GATE_TYPE" != "both" ]; then
  echo "${EMOJI_ERROR} Invalid gate type: $GATE_TYPE"
  echo "Gate type must be: entry, exit, or both"
  exit 2
fi

PHASE_NAME=$(get_phase_name $PHASE_NUM)
TRACKER_FILE="${PROJECT_ROOT}/$(get_phase_tracker $PHASE_NUM)"

echo "========================================"
echo " Phase ${PHASE_NUM} (${PHASE_NAME}) Gate Validation"
echo "========================================"
echo ""

if [ ! -f "$TRACKER_FILE" ]; then
  echo "${EMOJI_ERROR} Phase tracker not found: $TRACKER_FILE"
  exit 1
fi

# Function to check gate criteria
check_gate() {
  local gate_type=$1  # "entry" or "exit"
  local section_title=""

  if [ "$gate_type" = "entry" ]; then
    section_title="Entry Criteria"
  else
    section_title="Exit Criteria"
  fi

  echo "Checking ${gate_type} gate criteria..."
  echo ""

  # Extract criteria section from tracker
  criteria=$(awk "/## 🚪 ${section_title}/,/## 🎯|## 🚪/" "$TRACKER_FILE" | \
             grep "^\- \[" | head -20)

  if [ -z "$criteria" ]; then
    echo "  ${EMOJI_WARNING} No criteria found in tracker"
    return 1
  fi

  # Count total, passed, and pending criteria
  total_criteria=$(echo "$criteria" | wc -l)
  passed_criteria=$(echo "$criteria" | grep -c "^\- \[x\]")
  pending_criteria=$((total_criteria - passed_criteria))

  # Calculate percentage
  if [ "$total_criteria" -gt 0 ]; then
    percentage=$((passed_criteria * 100 / total_criteria))
  else
    percentage=0
  fi

  # Print criteria status
  echo "$criteria" | while IFS= read -r line; do
    if echo "$line" | grep -q "^\- \[x\]"; then
      # Passed criterion
      criterion=$(echo "$line" | sed 's/^- \[x\] //')
      echo "  ${EMOJI_CHECK} $criterion"
    else
      # Pending criterion
      criterion=$(echo "$line" | sed 's/^- \[ \] //')
      echo "  ${EMOJI_PENDING} $criterion"
    fi
  done

  echo ""
  echo "  ${gate_type^^} GATE STATUS:"
  echo "  ${EMOJI_INFO} Total criteria: $total_criteria"
  echo "  ${EMOJI_CHECK} Passed: $passed_criteria"
  echo "  ${EMOJI_PENDING} Pending: $pending_criteria"
  echo "  ${EMOJI_INFO} Completion: ${percentage}%"
  echo ""

  # Determine gate status
  if [ "$passed_criteria" -eq "$total_criteria" ]; then
    print_colored "$COLOR_GREEN" "  ✅ RESULT: ${gate_type^^} GATE PASSED"
    echo "  All criteria met. Gate can be marked as passed."
    return 0
  else
    print_colored "$COLOR_YELLOW" "  ⏸ RESULT: ${gate_type^^} GATE PENDING"
    echo "  ${pending_criteria} criteria still pending."
    echo ""
    echo "  BLOCKERS:"
    echo "$criteria" | grep "^\- \[ \]" | sed 's/^- \[ \] /    - /'
    return 1
  fi
}

# Check requested gates
exit_code=0

if [ "$GATE_TYPE" = "entry" ] || [ "$GATE_TYPE" = "both" ]; then
  check_gate "entry"
  if [ $? -ne 0 ]; then
    exit_code=1
  fi

  if [ "$GATE_TYPE" = "both" ]; then
    echo ""
    echo "----------------------------------------"
    echo ""
  fi
fi

if [ "$GATE_TYPE" = "exit" ] || [ "$GATE_TYPE" = "both" ]; then
  check_gate "exit"
  if [ $? -ne 0 ]; then
    exit_code=1
  fi
fi

echo ""
echo "========================================"
echo ""

if [ $exit_code -eq 0 ]; then
  echo "${EMOJI_SUCCESS} All checked gates PASSED!"
  echo ""
  echo "Next steps:"
  echo "  1. Mark gate as passed: ./mark-gate-passed.sh $PHASE_NUM $GATE_TYPE"
  echo "  2. Update decision log: ${DECISION_LOG}"
  echo "  3. Proceed to next phase"
else
  echo "${EMOJI_WARNING} Some gates PENDING - blockers present"
  echo ""
  echo "Next steps:"
  echo "  1. Complete pending criteria (see blockers above)"
  echo "  2. Re-run this script to validate: $0 $PHASE_NUM $GATE_TYPE"
  echo "  3. When all criteria met, mark gate as passed"
fi

echo ""
exit $exit_code
