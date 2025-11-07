#!/bin/bash

# ============================================================================
# Pipeline Automation Scripts Configuration
# ============================================================================
#
# This configuration file contains all customizable variables for the
# pipeline automation scripts. Modify these values to match your project.
#
# Usage: Scripts automatically source this file when run
# ============================================================================

# ----------------------------------------------------------------------------
# PROJECT CONFIGURATION
# ----------------------------------------------------------------------------

# Project root directory (absolute path)
# Default: Auto-detect based on script location
PROJECT_ROOT="${PROJECT_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)}"

# Project name (used in reports)
PROJECT_NAME="${PROJECT_NAME:-Book Production Pipeline}"

# ----------------------------------------------------------------------------
# DIRECTORY PATHS (relative to PROJECT_ROOT)
# ----------------------------------------------------------------------------

# Operations directories
OPERATIONS_DIR="${OPERATIONS_DIR:-operations}"
PIPELINE_DIR="${PIPELINE_DIR:-${OPERATIONS_DIR}/pipeline}"
PHASE_TRACKING_DIR="${PHASE_TRACKING_DIR:-${OPERATIONS_DIR}/phase-tracking}"
VALIDATION_DIR="${VALIDATION_DIR:-${OPERATIONS_DIR}/validation}"

# Phase directories (1-9)
PHASE_1_DIR="${PHASE_1_DIR:-1-ideation}"
PHASE_2_DIR="${PHASE_2_DIR:-2-research}"
PHASE_3_DIR="${PHASE_3_DIR:-3-preparation}"
PHASE_4_DIR="${PHASE_4_DIR:-4-utilities}"
PHASE_5_DIR="${PHASE_5_DIR:-5-text}"
PHASE_6_DIR="${PHASE_6_DIR:-6-audio}"
PHASE_7_DIR="${PHASE_7_DIR:-7-video}"
PHASE_8_DIR="${PHASE_8_DIR:-8-publication}"
PHASE_9_DIR="${PHASE_9_DIR:-9-marketing}"

# Chapter directory (for text production)
CHAPTERS_DIR="${CHAPTERS_DIR:-${PHASE_5_DIR}/chapters}"

# Validation subdirectories
CHAPTER_VALIDATION_DIR="${CHAPTER_VALIDATION_DIR:-${VALIDATION_DIR}/chapter-validation}"
GATE_VALIDATION_DIR="${GATE_VALIDATION_DIR:-${VALIDATION_DIR}/gate-validation}"
QUALITY_METRICS_DIR="${QUALITY_METRICS_DIR:-${VALIDATION_DIR}/quality-metrics}"

# ----------------------------------------------------------------------------
# FILE PATHS (relative to PROJECT_ROOT)
# ----------------------------------------------------------------------------

# Pipeline hub files
PIPELINE_DASHBOARD="${PIPELINE_DASHBOARD:-${PIPELINE_DIR}/PIPELINE-STATUS-DASHBOARD.md}"
STAGE_GATES_REFERENCE="${STAGE_GATES_REFERENCE:-${PIPELINE_DIR}/STAGE-GATES-REFERENCE.md}"
DECISION_LOG="${DECISION_LOG:-${PIPELINE_DIR}/DECISION-LOG.md}"
CRITICAL_PATH_TRACKER="${CRITICAL_PATH_TRACKER:-${PIPELINE_DIR}/CRITICAL-PATH-TRACKER.md}"

# Metrics file
METRICS_SUMMARY="${METRICS_SUMMARY:-${QUALITY_METRICS_DIR}/metrics-summary.json}"

# Phase tracker file template
PHASE_TRACKER_TEMPLATE="${PHASE_TRACKER_TEMPLATE:-${PHASE_TRACKING_DIR}/Phase-%d-%s-TRACKER.md}"

# ----------------------------------------------------------------------------
# PHASE CONFIGURATION
# ----------------------------------------------------------------------------

# Total number of phases
TOTAL_PHASES=9

# Phase names (must match directory names)
declare -A PHASE_NAMES=(
  [1]="Ideation"
  [2]="Research"
  [3]="Preparation"
  [4]="Utilities"
  [5]="Text"
  [6]="Audio"
  [7]="Video"
  [8]="Publication"
  [9]="Marketing"
)

# Phase directories (for direct access)
declare -A PHASE_DIRS=(
  [1]="${PHASE_1_DIR}"
  [2]="${PHASE_2_DIR}"
  [3]="${PHASE_3_DIR}"
  [4]="${PHASE_4_DIR}"
  [5]="${PHASE_5_DIR}"
  [6]="${PHASE_6_DIR}"
  [7]="${PHASE_7_DIR}"
  [8]="${PHASE_8_DIR}"
  [9]="${PHASE_9_DIR}"
)

# Optional phases (can be skipped)
OPTIONAL_PHASES=(6 7)

# ----------------------------------------------------------------------------
# QUALITY METRICS CONFIGURATION
# ----------------------------------------------------------------------------

# Text production metrics
TARGET_WORD_COUNT="${TARGET_WORD_COUNT:-85000}"
TARGET_CHAPTER_COUNT="${TARGET_CHAPTER_COUNT:-21}"
MIN_CHAPTER_WORD_COUNT="${MIN_CHAPTER_WORD_COUNT:-3000}"
MAX_CHAPTER_WORD_COUNT="${MAX_CHAPTER_WORD_COUNT:-5000}"

# Validation thresholds
VALIDATION_THRESHOLD="${VALIDATION_THRESHOLD:-4.5}"
MIN_VALIDATION_SCORE="${MIN_VALIDATION_SCORE:-4.0}"

# Pass 2 NQ dimensions (8 dimensions)
declare -a NQ_DIMENSIONS=(
  "Character Development"
  "Plot Coherence"
  "Pacing"
  "Dialogue Quality"
  "Descriptive Quality"
  "Emotional Impact"
  "Thematic Consistency"
  "Overall Engagement"
)

# ----------------------------------------------------------------------------
# GATE CONFIGURATION
# ----------------------------------------------------------------------------

# Total gates
TOTAL_GATES=45
ENTRY_GATES=9
EXIT_GATES=9
QUALITY_GATES=27
VALIDATION_GATES=6

# ----------------------------------------------------------------------------
# SCRIPT BEHAVIOR
# ----------------------------------------------------------------------------

# Enable/disable features
ENABLE_AUTO_UPDATE="${ENABLE_AUTO_UPDATE:-true}"
ENABLE_NOTIFICATIONS="${ENABLE_NOTIFICATIONS:-false}"
ENABLE_VERBOSE_OUTPUT="${ENABLE_VERBOSE_OUTPUT:-false}"

# Output formatting
USE_COLOR="${USE_COLOR:-true}"
USE_EMOJI="${USE_EMOJI:-true}"

# Timestamp format (for reports)
TIMESTAMP_FORMAT="${TIMESTAMP_FORMAT:-%Y-%m-%d %H:%M:%S}"

# ----------------------------------------------------------------------------
# COLOR CODES (for terminal output)
# ----------------------------------------------------------------------------

if [ "$USE_COLOR" = "true" ]; then
  COLOR_RESET="\033[0m"
  COLOR_RED="\033[31m"
  COLOR_GREEN="\033[32m"
  COLOR_YELLOW="\033[33m"
  COLOR_BLUE="\033[34m"
  COLOR_MAGENTA="\033[35m"
  COLOR_CYAN="\033[36m"
  COLOR_BOLD="\033[1m"
else
  COLOR_RESET=""
  COLOR_RED=""
  COLOR_GREEN=""
  COLOR_YELLOW=""
  COLOR_BLUE=""
  COLOR_MAGENTA=""
  COLOR_CYAN=""
  COLOR_BOLD=""
fi

# ----------------------------------------------------------------------------
# EMOJI CODES (for reports)
# ----------------------------------------------------------------------------

if [ "$USE_EMOJI" = "true" ]; then
  EMOJI_CHECK="✅"
  EMOJI_CROSS="❌"
  EMOJI_PENDING="⏸"
  EMOJI_IN_PROGRESS="🔄"
  EMOJI_NOT_STARTED="⚪"
  EMOJI_BLOCKED="🚫"
  EMOJI_WARNING="⚠️"
  EMOJI_INFO="ℹ️"
  EMOJI_SUCCESS="🎉"
  EMOJI_ERROR="❌"
else
  EMOJI_CHECK="[✓]"
  EMOJI_CROSS="[✗]"
  EMOJI_PENDING="[...]"
  EMOJI_IN_PROGRESS="[>]"
  EMOJI_NOT_STARTED="[ ]"
  EMOJI_BLOCKED="[!]"
  EMOJI_WARNING="[!]"
  EMOJI_INFO="[i]"
  EMOJI_SUCCESS="[✓]"
  EMOJI_ERROR="[✗]"
fi

# ----------------------------------------------------------------------------
# HELPER FUNCTIONS
# ----------------------------------------------------------------------------

# Get phase name by number
get_phase_name() {
  local phase_num=$1
  echo "${PHASE_NAMES[$phase_num]}"
}

# Get phase directory by number
get_phase_dir() {
  local phase_num=$1
  echo "${PHASE_DIRS[$phase_num]}"
}

# Get phase tracker file path
get_phase_tracker() {
  local phase_num=$1
  local phase_name=$(get_phase_name $phase_num)
  printf "${PHASE_TRACKER_TEMPLATE}" "$phase_num" "$phase_name"
}

# Check if phase is optional
is_phase_optional() {
  local phase_num=$1
  for opt_phase in "${OPTIONAL_PHASES[@]}"; do
    if [ "$opt_phase" -eq "$phase_num" ]; then
      return 0
    fi
  done
  return 1
}

# Format timestamp
format_timestamp() {
  date +"${TIMESTAMP_FORMAT}"
}

# Print colored message
print_colored() {
  local color=$1
  local message=$2
  echo -e "${color}${message}${COLOR_RESET}"
}

# Print status with emoji
print_status() {
  local emoji=$1
  local message=$2
  echo -e "${emoji} ${message}"
}

# ----------------------------------------------------------------------------
# VALIDATION
# ----------------------------------------------------------------------------

# Validate configuration on source
if [ ! -d "${PROJECT_ROOT}" ]; then
  echo "ERROR: PROJECT_ROOT does not exist: ${PROJECT_ROOT}"
  echo "Please update config.sh with correct paths."
  exit 1
fi

# Export all variables for use in other scripts
export PROJECT_ROOT PROJECT_NAME
export OPERATIONS_DIR PIPELINE_DIR PHASE_TRACKING_DIR VALIDATION_DIR
export CHAPTERS_DIR CHAPTER_VALIDATION_DIR GATE_VALIDATION_DIR QUALITY_METRICS_DIR
export PIPELINE_DASHBOARD STAGE_GATES_REFERENCE DECISION_LOG CRITICAL_PATH_TRACKER
export METRICS_SUMMARY
export TOTAL_PHASES TARGET_WORD_COUNT TARGET_CHAPTER_COUNT
export VALIDATION_THRESHOLD MIN_VALIDATION_SCORE
export ENABLE_AUTO_UPDATE ENABLE_NOTIFICATIONS ENABLE_VERBOSE_OUTPUT
export USE_COLOR USE_EMOJI

# Configuration loaded successfully
if [ "$ENABLE_VERBOSE_OUTPUT" = "true" ]; then
  echo "✓ Configuration loaded from config.sh"
  echo "  Project root: ${PROJECT_ROOT}"
  echo "  Project name: ${PROJECT_NAME}"
fi
