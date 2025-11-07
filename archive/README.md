# archive/

**Purpose:** Project-wide archive for cross-phase materials and major restructuring

---

## 📋 Overview

This is the **root archive** for project-wide archival needs. Each pipeline phase also has its own `archive/` subdirectory for phase-specific archiving.

### Archive Strategy

**Phase-specific archives (Recommended for most files):**
- `1-ideation/archive/` - Old concept docs
- `2-research/archive/` - Outdated research
- `3-preparation/archive/` - Old prep doc versions
- `4-utilities/archive/` - Deprecated tools/templates
- `5-text/archive/` - Old chapter versions
- `6-audio/archive/` - Previous audio versions
- `7-video/archive/` - Old video edits
- `8-publication/archive/` - Previous publication files
- `9-marketing/archive/` - Old marketing materials

**Root archive (This directory - for special cases):**
- Major project restructuring backups
- Complete directory snapshots
- Cross-phase historical backups
- Entire phase archives (when phase is complete)
- Large-scale cleanup operations

**Rule of thumb:** Use phase-specific archives for normal work. Use root archive for major project events.

---

## 📂 Organization Strategy

### By Date (Recommended)
```
archive/
├── 2025-11-04-cleanup/
│   ├── README.md
│   ├── old-files/
│   └── backups/
├── 2025-10-15-chapter-drafts/
└── 2025-09-01-prep-v10/
```

### By Type (Alternative)
```
archive/
├── old-chapters/
├── deprecated-prep-docs/
├── previous-versions/
└── backups/
```

### By Phase (Alternative)
```
archive/
├── phase-1-ideation-archive/
├── phase-3-prep-archive/
└── phase-5-text-archive/
```

**Choose the organization that best fits your workflow.**

---

## 🗂️ What to Archive

### Regularly Archive
- **Old versions** - Previous drafts after major revisions
- **Completed session files** - Operations files >30 days old
- **Deprecated documents** - Replaced or consolidated files
- **Experiment files** - Failed approaches or alternative versions
- **Backups** - System backups of entire directory structures

### Keep Active (Don't Archive)
- Current working files
- Active reference documents
- Templates still in use
- Recent validation reports (<30 days)

---

## 📝 Archive Checklist

Before archiving files:

- [ ] Create dated folder (YYYY-MM-DD-description)
- [ ] Add README.md explaining what was archived and why
- [ ] List original file locations for easy reference
- [ ] Update any links in active documents
- [ ] Verify files are no longer actively needed
- [ ] Compress large files if appropriate

---

## 📋 Archive README Template

Create a README.md in each archive folder:

```markdown
# Archive - [Date] - [Description]

**Date:** [YYYY-MM-DD]
**Archived By:** [Name/Session]
**Reason:** [Why these files were archived]

## Contents

### Folder 1: [Name]
- **Source:** [Original location]
- **Contents:** [Description]
- **Reason:** [Why archived]

### Folder 2: [Name]
- **Source:** [Original location]
- **Contents:** [Description]
- **Reason:** [Why archived]

## Notes
[Any additional context or important information]

## Restoration
If needed, files can be restored to:
- [Original location 1]
- [Original location 2]
```

---

## 🔄 Archive Workflow

### When to Archive
- End of major phase (e.g., completed all prep docs)
- After significant restructuring
- Monthly cleanup of operations/history/
- Before major version changes
- When files haven't been accessed in 60+ days

### How to Archive
1. **Create archive folder:** `YYYY-MM-DD-description/`
2. **Move files:** Copy (don't move) until verified
3. **Document:** Create README.md in archive folder
4. **Verify:** Check that active work still functions
5. **Clean up:** Delete source files after verification
6. **Update:** Note in MASTER-DASHBOARD.md or session notes

---

## 🎯 Best Practices

1. **Date everything** - Use YYYY-MM-DD format
2. **Document thoroughly** - Future you will thank present you
3. **Preserve structure** - Keep original folder hierarchy
4. **Regular cleanup** - Archive monthly, not yearly
5. **Compress wisely** - Zip large archives, keep small ones accessible
6. **Test restoration** - Occasionally verify you can retrieve files

---

## 🔍 Search and Retrieval

### Finding Archived Files
1. Check archive folder README.md files
2. Use date-based organization for time-based searches
3. Search by original file names
4. Review archive logs in operations/

### Restoring Files
1. Locate the archive folder
2. Review README.md for original location
3. Copy (don't move) back to active location
4. Update as needed for current project state
5. Document restoration in session notes

---

## 💾 Backup Strategy

### Archive ≠ Backup
- **Archive** - Old working files you might need later
- **Backup** - Redundant copies for disaster recovery

**Recommendation:** Keep archives backed up separately
- Cloud storage (Google Drive, Dropbox)
- External hard drive
- Git repository (for text files)

---

## 📊 Archive Metrics

Track archival activity:
- Last archive date
- Total archived size
- Number of archive folders
- Most recent restoration (if any)

Include in operations/current/SESSION-PROGRESS-TRACKER.md when archiving significant content.

---

## 🗑️ Deletion Policy

**When to delete from archive:**
- File confirmed corrupted/unusable
- Content completely superseded and verified unnecessary
- After 2+ years with no access
- Duplicates of files stored elsewhere

**Rule of thumb:** If in doubt, keep it. Storage is cheap, lost work is expensive.

---

## 📚 Related Directories

- [../operations/history/](../operations/history/) - Recent operational files (archive these regularly)
- [../operations/](../operations/) - Active operational files
- [../metrics/archive/](../metrics/archive/) - Archived metrics and trackers

---

**The archive preserves your project's history and protects against data loss.**
