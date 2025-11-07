#!/bin/bash

# ============================================================================
# update-pipeline-status.sh
# ============================================================================
#
# Scans phase trackers for completion status and updates the pipeline
# dashboard with current metrics.
#
# Usage:
#   ./update-pipeline-status.sh
#
# What it does:
#   1. Reads all phase tracker files
#   2. Extracts completion percentages and gate status
#   3. Updates PIPELINE-STATUS-DASHBOARD.md
#   4. Updates metrics-summary.json
#
# ============================================================================

# Load configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/config.sh"

# Change to project root
cd "${PROJECT_ROOT}" || exit 1

echo "========================================"
echo " Update Pipeline Status"
echo "========================================"
echo ""

# Initialize counters
total_phases=$TOTAL_PHASES
phases_complete=0
phases_in_progress=0
phases_blocked=0
phases_not_started=0
current_phase=1

# Function to extract status from phase tracker
extract_phase_status() {
  local phase_num=$1
  local tracker_file="${PROJECT_ROOT}/$(get_phase_tracker $phase_num)"

  if [ ! -f "$tracker_file" ]; then
    echo "NOT_STARTED"
    return
  fi

  # Extract status from tracker (example: **Phase Status:** 🔄 In Progress)
  local status=$(grep "^\*\*Phase Status:\*\*" "$tracker_file" | head -1)

  if echo "$status" | grep -q "✅.*Complete"; then
    echo "COMPLETE"
  elif echo "$status" | grep -q "🔄.*In Progress"; then
    echo "IN_PROGRESS"
  elif echo "$status" | grep -q "❌.*Blocked"; then
    echo "BLOCKED"
  elif echo "$status" | grep -q "⚪.*Not Started"; then
    echo "NOT_STARTED"
  else
    echo "NOT_STARTED"
  fi
}

# Function to extract completion percentage from phase tracker
extract_completion() {
  local phase_num=$1
  local tracker_file="${PROJECT_ROOT}/$(get_phase_tracker $phase_num)"

  if [ ! -f "$tracker_file" ]; then
    echo "0"
    return
  fi

  # Extract completion (example: **Completion:** 95%)
  local completion=$(grep "^\*\*Completion:\*\*" "$tracker_file" | head -1 | grep -oP '\d+(?=%)')

  if [ -z "$completion" ]; then
    echo "0"
  else
    echo "$completion"
  fi
}

echo "Scanning phase trackers..."
echo ""

# Scan all phases
for phase in $(seq 1 $total_phases); do
  phase_name=$(get_phase_name $phase)
  status=$(extract_phase_status $phase)
  completion=$(extract_completion $phase)

  echo "Phase $phase ($phase_name): $status ($completion%)"

  case "$status" in
    COMPLETE)
      phases_complete=$((phases_complete + 1))
      ;;
    IN_PROGRESS)
      phases_in_progress=$((phases_in_progress + 1))
      if [ $phase -gt $current_phase ]; then
        current_phase=$phase
      fi
      ;;
    BLOCKED)
      phases_blocked=$((phases_blocked + 1))
      ;;
    NOT_STARTED)
      phases_not_started=$((phases_not_started + 1))
      ;;
  esac
done

echo ""
echo "Summary:"
echo "  Complete: $phases_complete/$total_phases"
echo "  In Progress: $phases_in_progress"
echo "  Blocked: $phases_blocked"
echo "  Not Started: $phases_not_started"
echo "  Current Phase: Phase $current_phase ($(get_phase_name $current_phase))"
echo ""

# Calculate overall completion
overall_completion=$((phases_complete * 100 / total_phases))

# Update metrics-summary.json
if [ -f "${PROJECT_ROOT}/${METRICS_SUMMARY}" ]; then
  echo "Updating ${METRICS_SUMMARY}..."

  # Use jq if available, otherwise manual update
  if command -v jq &> /dev/null; then
    # Update using jq
    tmp_file=$(mktemp)
    jq ".pipeline.overall_completion = $overall_completion | \
        .pipeline.current_phase = $current_phase | \
        .pipeline.current_phase_name = \"$(get_phase_name $current_phase)\" | \
        .pipeline.phases_complete = $phases_complete | \
        .pipeline.phases_remaining = $((total_phases - phases_complete))" \
      "${PROJECT_ROOT}/${METRICS_SUMMARY}" > "$tmp_file"
    mv "$tmp_file" "${PROJECT_ROOT}/${METRICS_SUMMARY}"
    echo "  ${EMOJI_CHECK} metrics-summary.json updated"
  else
    echo "  ${EMOJI_WARNING} jq not found, skipping JSON update (install jq for automatic updates)"
  fi
else
  echo "  ${EMOJI_WARNING} ${METRICS_SUMMARY} not found, skipping"
fi

# Update PIPELINE-STATUS-DASHBOARD.md
if [ -f "${PROJECT_ROOT}/${PIPELINE_DASHBOARD}" ]; then
  echo "Updating ${PIPELINE_DASHBOARD}..."

  # Update timestamp
  timestamp=$(format_timestamp)
  sed -i "s/\*\*Last Updated:\*\*.*/\*\*Last Updated:\*\* $timestamp/" "${PROJECT_ROOT}/${PIPELINE_DASHBOARD}"

  # Update overall completion
  sed -i "s/\*\*Overall Completion:\*\*.*/\*\*Overall Completion:\*\* ${overall_completion}% (${phases_complete}\/${total_phases} phases complete)/" "${PROJECT_ROOT}/${PIPELINE_DASHBOARD}"

  # Update current phase
  sed -i "s/\*\*Current Phase:\*\*.*/\*\*Current Phase:\*\* Phase ${current_phase} - $(get_phase_name $current_phase)/" "${PROJECT_ROOT}/${PIPELINE_DASHBOARD}"

  echo "  ${EMOJI_CHECK} Pipeline dashboard updated"
else
  echo "  ${EMOJI_WARNING} ${PIPELINE_DASHBOARD} not found, skipping"
fi

echo ""
echo "${EMOJI_SUCCESS} Pipeline status updated successfully!"
echo ""
echo "View updated dashboard:"
echo "  ${PROJECT_ROOT}/${PIPELINE_DASHBOARD}"
echo ""
