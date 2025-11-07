# operations/validation/

**Purpose:** Validation reports and quality check results

---

## 📋 Overview

This directory stores all validation reports for chapters and content. Reports are organized by chapter and validation pass level.

---

## 📂 File Organization

### Naming Convention

```
chapter-[XX]-pass[1/2/3].md          # Individual pass reports
chapter-[XX]-validation-complete.md   # Final validation summary
act-[X]-validation-summary.md         # Act-level summaries
```

### Example Structure

```
validation/
├── chapter-01-pass1.md
├── chapter-01-pass2.md
├── chapter-01-pass3.md
├── chapter-01-validation-complete.md
├── chapter-02-pass1.md
├── chapter-02-pass2.md
├── act-1-validation-summary.md
└── README.md
```

---

## 🔍 Validation Pass Levels

### Pass 1: Structural Validation
- Basic structure and completeness
- Technical formatting
- Scene presence and transitions
- Files: `chapter-XX-pass1.md`

### Pass 2: Content Validation
- Narrative quality
- Character consistency
- Plot coherence
- Pacing and flow
- Files: `chapter-XX-pass2.md`

### Pass 3: Polish Validation
- Prose quality
- Grammar and mechanics
- Final polish
- Publication readiness
- Files: `chapter-XX-pass3.md`

---

## 📝 Report Templates

Use the template from [QA-System-Complete-Reference.md](../QA-System/QA-System-Complete-Reference.md) for all validation reports.

---

## 🎯 Usage Guidelines

### Creating Validation Reports

1. Complete chapter/content
2. Run appropriate validation pass
3. Document findings in report
4. Store in this directory
5. Update CHAPTER-PROGRESS-TRACKER.md

### Report Contents

All reports should include:
- Overall assessment and score
- Dimension scores (structure, characters, etc.)
- Checklist results
- Issues identified (critical, major, minor)
- Strengths and improvements
- Recommendations

---

## 📊 Tracking Validation

Track validation status in:
- [../current/CHAPTER-PROGRESS-TRACKER.md](../current/CHAPTER-PROGRESS-TRACKER.md)
- [../current/STATISTICS-DASHBOARD.md](../current/STATISTICS-DASHBOARD.md)

---

## 🔗 Related Documents

- [../QA-System/QA-System-Complete-Reference.md](../QA-System/QA-System-Complete-Reference.md) - Complete QA system documentation
- [../../3-preparation/quality-frameworks/](../../3-preparation/quality-frameworks/) - Quality standards

---

**Keep validation reports for reference and quality tracking.**
