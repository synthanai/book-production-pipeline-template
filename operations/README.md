# operations/

**Purpose:** Project management, workflows, and operational systems

---

## 📋 Overview

This directory contains all operational and workflow management files for your book project. It serves as the command center for session tracking, quality assurance, validation, and project coordination.

**Key principle:** Infrastructure, not content. Everything here supports the production pipeline but isn't part of the final book deliverables.

---

## 📂 Typical Subdirectories

### current/
**Active session files and working documents**
- SESSION-HANDOFF-PROMPT.md - Template for session transitions
- SESSION-PROGRESS-TRACKER.md - Daily work log
- CHAPTER-PROGRESS-TRACKER.md - Chapter-by-chapter status
- STATISTICS-DASHBOARD.md - Real-time project stats
- Current task lists and quick references

### validation/
**Validation reports and quality checks**
- Chapter validation reports
- Act-level validation summaries
- Cross-reference validation
- Narrative quality assessments
- Tier-based validation results (Pass 1, Pass 2, etc.)

### QA-System/
**Quality assurance protocols and frameworks**
- QA-System-Complete-Reference.md
- Validation checklists
- Quality frameworks
- Testing protocols
- Review guidelines

### analysis/
**Project analysis and research documents**
- Document analysis reports
- Structural analysis
- Statistics and metrics analysis
- Research findings
- Comparative studies

### doc-analysis/
**Specific document-level analysis**
- Individual document reviews
- Documentation quality checks
- Structural assessments

### plan/
**Project planning documents**
- Phase plans
- Migration plans
- Restructure plans
- Strategic planning docs

### status/
**Status reports and summaries**
- Session summaries
- Phase completion reports
- Milestone status updates
- Progress snapshots

### report/
**Comprehensive reports**
- Validation reports
- Completion reports
- Analysis reports
- Review summaries

### history/
**Historical session files (archive regularly)**
- Old session summaries
- Previous validation reports
- Historical tracking documents
- *Note: Move to archive/ when no longer actively referenced*

---

## 🔄 Workflow Integration

### Session Start
1. Review current/SESSION-HANDOFF-PROMPT.md
2. Update current/SESSION-PROGRESS-TRACKER.md with goals
3. Check current/CHAPTER-PROGRESS-TRACKER.md for status

### During Session
1. Update trackers in real-time
2. Create validation reports in validation/
3. Document analysis in analysis/

### Session End
1. Update SESSION-PROGRESS-TRACKER.md with results
2. Update STATISTICS-DASHBOARD.md
3. Create session summary in status/
4. Archive old files from history/ if needed

---

## 📝 Key Templates

### SESSION-PROGRESS-TRACKER.md
```markdown
# Session Progress Tracker

**Session:** [Number]
**Date:** [Date]
**Focus:** [Primary goals]

## Goals
- [ ] Goal 1
- [ ] Goal 2

## Completed
- [x] Task 1
- [x] Task 2

## Next Session
- Plan for next session
```

### CHAPTER-PROGRESS-TRACKER.md
```markdown
# Chapter Progress Tracker

| Chapter | Status | Word Count | Validation | Notes |
|---------|--------|------------|------------|-------|
| Ch 01   | ✅     | 4,500      | Pass 2     | Complete |
| Ch 02   | 🔄     | 3,200      | Pass 1     | In progress |
```

---

## 🎯 Best Practices

1. **Keep it current** - Archive old files regularly
2. **One source of truth** - Don't duplicate trackers
3. **Update in real-time** - Don't batch updates
4. **Clear naming** - Use descriptive file names with dates
5. **Regular cleanup** - Move history/ files to archive/ monthly

---

## 🔗 Related Directories

- [../metrics/](../metrics/) - Higher-level progress tracking and analytics
- [../archive/](../archive/) - Long-term storage of old operational files
- [../3-preparation/quality-frameworks/](../3-preparation/quality-frameworks/) - Quality standards and frameworks

---

**This directory keeps your project organized and on track.**
