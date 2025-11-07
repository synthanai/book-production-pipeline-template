#!/bin/bash

# ============================================================================
# validate-gate-criteria.sh
# ============================================================================
#
# Checks if a phase exit gate can be passed by validating criteria against
# actual project data (word counts, validation scores, etc.).
#
# Usage:
#   ./validate-gate-criteria.sh <phase-number>
#
# Examples:
#   ./validate-gate-criteria.sh 5    # Validate Phase 5 exit criteria
#
# Returns:
#   - PASS if all criteria can be met
#   - FAIL with blockers if criteria not met
#
# ============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/config.sh"

cd "${PROJECT_ROOT}" || exit 1

# Usage
if [ $# -lt 1 ]; then
  echo "Usage: $0 <phase-number>"
  echo ""
  echo "Example: $0 5    # Validate Phase 5 exit gate"
  exit 1
fi

PHASE_NUM=$1

if [ "$PHASE_NUM" -lt 1 ] || [ "$PHASE_NUM" -gt "$TOTAL_PHASES" ]; then
  echo "${EMOJI_ERROR} Invalid phase number: $PHASE_NUM"
  exit 1
fi

PHASE_NAME=$(get_phase_name $PHASE_NUM)

echo "========================================"
echo " Validate Phase ${PHASE_NUM} (${PHASE_NAME})"
echo " Exit Gate Criteria"
echo "========================================"
echo ""

# Phase-specific validation logic
case $PHASE_NUM in
  5)
    # Phase 5: Text Production
    echo "Validating Phase 5 (Text) exit criteria..."
    echo ""

    # Check word count
    if [ -f "${PROJECT_ROOT}/${METRICS_SUMMARY}" ] && command -v jq &> /dev/null; then
      total_words=$(jq -r '.quality_summary.text_production.total_word_count // 0' "${PROJECT_ROOT}/${METRICS_SUMMARY}")
      chapters_complete=$(jq -r '.quality_summary.text_production.chapters_complete // 0' "${PROJECT_ROOT}/${METRICS_SUMMARY}")
      avg_score=$(jq -r '.quality_summary.text_production.avg_validation_score // null' "${PROJECT_ROOT}/${METRICS_SUMMARY}")

      echo "1. Word Count Target:"
      if [ "$total_words" -ge "$TARGET_WORD_COUNT" ]; then
        echo "   ${EMOJI_CHECK} PASS: $total_words words (target: $TARGET_WORD_COUNT)"
      else
        echo "   ${EMOJI_CROSS} FAIL: $total_words words (target: $TARGET_WORD_COUNT)"
        echo "   ${EMOJI_WARNING} Need $((TARGET_WORD_COUNT - total_words)) more words"
      fi

      echo ""
      echo "2. Chapter Count:"
      if [ "$chapters_complete" -ge "$TARGET_CHAPTER_COUNT" ]; then
        echo "   ${EMOJI_CHECK} PASS: $chapters_complete chapters (target: $TARGET_CHAPTER_COUNT)"
      else
        echo "   ${EMOJI_CROSS} FAIL: $chapters_complete chapters (target: $TARGET_CHAPTER_COUNT)"
        echo "   ${EMOJI_WARNING} Need $((TARGET_CHAPTER_COUNT - chapters_complete)) more chapters"
      fi

      echo ""
      echo "3. Validation Score:"
      if [ "$avg_score" != "null" ] && [ "$(echo "$avg_score >= $VALIDATION_THRESHOLD" | bc -l 2>/dev/null || echo 0)" -eq 1 ]; then
        echo "   ${EMOJI_CHECK} PASS: $avg_score (threshold: $VALIDATION_THRESHOLD)"
      elif [ "$avg_score" = "null" ]; then
        echo "   ${EMOJI_PENDING} PENDING: No validation data yet"
        echo "   ${EMOJI_INFO} Run validation on chapters to populate scores"
      else
        echo "   ${EMOJI_CROSS} FAIL: $avg_score (threshold: $VALIDATION_THRESHOLD)"
        echo "   ${EMOJI_WARNING} Some chapters need refinement"
      fi
    else
      echo "${EMOJI_WARNING} Cannot validate - metrics file missing or jq not installed"
      echo ""
      echo "Install jq for automatic validation:"
      echo "  Ubuntu/Debian: sudo apt-get install jq"
      echo "  Mac: brew install jq"
    fi
    ;;

  *)
    echo "${EMOJI_INFO} Automated validation not yet implemented for Phase $PHASE_NUM"
    echo ""
    echo "Use manual validation instead:"
    echo "  ./check-phase-gates.sh $PHASE_NUM exit"
    ;;
esac

echo ""
echo "========================================"
echo ""
echo "For complete gate status, run:"
echo "  ./check-phase-gates.sh $PHASE_NUM exit"
echo ""
