#!/bin/bash

# ============================================================================
# update-chapter-metrics.sh
# ============================================================================
#
# Scans chapter files for word counts and updates chapter progress metrics.
#
# Usage:
#   ./update-chapter-metrics.sh
#
# What it does:
#   1. Scans all files in 5-text/chapters/ directory
#   2. Counts words in each chapter file
#   3. Updates metrics-summary.json with totals
#   4. Optionally updates chapter progress tracker
#
# ============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/config.sh"

cd "${PROJECT_ROOT}" || exit 1

echo "========================================"
echo " Update Chapter Metrics"
echo "========================================"
echo ""

CHAPTERS_PATH="${PROJECT_ROOT}/${CHAPTERS_DIR}"

if [ ! -d "$CHAPTERS_PATH" ]; then
  echo "${EMOJI_WARNING} Chapters directory not found: $CHAPTERS_PATH"
  echo "Chapters directory will be created when you start writing (Phase 5)."
  exit 0
fi

echo "Scanning chapters in: $CHAPTERS_PATH"
echo ""

# Count chapter files
chapter_files=$(find "$CHAPTERS_PATH" -type f \( -name "*.md" -o -name "*.txt" \) | sort)
chapter_count=$(echo "$chapter_files" | grep -c .)

if [ "$chapter_count" -eq 0 ]; then
  echo "${EMOJI_INFO} No chapter files found yet."
  echo "Chapter files will appear here when you start writing."
  exit 0
fi

echo "${EMOJI_INFO} Found $chapter_count chapter files"
echo ""

# Calculate total word count
total_words=0

while IFS= read -r file; do
  if [ -f "$file" ]; then
    words=$(wc -w < "$file")
    total_words=$((total_words + words))
    filename=$(basename "$file")
    printf "  %-30s %8d words\n" "$filename" "$words"
  fi
done <<< "$chapter_files"

echo ""
echo "========================================"
echo "TOTAL: $total_words words across $chapter_count chapters"
echo "TARGET: $TARGET_WORD_COUNT words across $TARGET_CHAPTER_COUNT chapters"
echo "========================================"
echo ""

# Calculate completion percentage
if [ "$TARGET_WORD_COUNT" -gt 0 ]; then
  completion_pct=$((total_words * 100 / TARGET_WORD_COUNT))
  if [ "$completion_pct" -gt 100 ]; then
    completion_pct=100
  fi
  echo "${EMOJI_INFO} Word count progress: ${completion_pct}%"
else
  completion_pct=0
fi

# Update metrics-summary.json
if [ -f "${PROJECT_ROOT}/${METRICS_SUMMARY}" ] && command -v jq &> /dev/null; then
  echo ""
  echo "Updating ${METRICS_SUMMARY}..."

  tmp_file=$(mktemp)
  jq ".quality_summary.text_production.total_word_count = $total_words | \
      .quality_summary.text_production.chapters_complete = $chapter_count" \
    "${PROJECT_ROOT}/${METRICS_SUMMARY}" > "$tmp_file"
  mv "$tmp_file" "${PROJECT_ROOT}/${METRICS_SUMMARY}"

  echo "  ${EMOJI_CHECK} Metrics updated"
else
  echo "  ${EMOJI_WARNING} jq not found or metrics file missing"
fi

echo ""
echo "${EMOJI_SUCCESS} Chapter metrics updated!"
echo ""
