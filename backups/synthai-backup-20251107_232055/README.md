# Book Production Pipeline Template

**Version:** 1.0
**Created:** November 7, 2025
**Purpose:** Reusable template for complete book production workflow

---

## 📖 Overview

This template provides a complete 9-phase pipeline for writing, producing, and marketing a book. It separates **infrastructure** (always-accessible operational folders) from **pipeline** (sequential production phases).

**Use this template to:**
- Start a new book project with a proven structure
- Maintain consistency across multiple book projects
- Track progress from ideation to marketing
- Organize all assets (text, audio, video, marketing)

---

## 🏗️ Structure Philosophy

### Infrastructure Directories (No Numbers)
Always accessible, used throughout the entire project lifecycle:
- **operations/** - Project management, workflows, session tracking
- **metrics/** - Progress tracking, analytics, dashboards
- **archive/** - Old versions, deprecated files, backups

### Pipeline Directories (Numbered 1-9)
Sequential phases that show clear production flow:
1. **1-ideation/** - Initial concept development
2. **2-research/** - Literature review, market analysis
3. **3-preparation/** - All documentation before writing
4. **4-utilities/** - Tools, templates, snippets, prompts
5. **5-text/** - Written content (chapters, drafts)
6. **6-audio/** - Audiobook production
7. **7-video/** - Video content and marketing
8. **8-publication/** - Final distribution formats
9. **9-marketing/** - Promotional materials

---

## 📂 Directory Guide

### Infrastructure

| Directory | Purpose | Key Contents |
|-----------|---------|--------------|
| [operations/](operations/) | Project workflows | Session files, validation, QA protocols |
| [metrics/](metrics/) | Progress tracking | Dashboards, trackers, analytics |
| [archive/](archive/) | Historical files | Old versions, backups, deprecated content |

### Pipeline Phases

| Phase | Directory | Purpose | Key Contents |
|-------|-----------|---------|--------------|
| **1** | [1-ideation/](1-ideation/) | Concept development | Framework ideas, character sketches, story arcs |
| **2** | [2-research/](2-research/) | Research & analysis | Literature reviews, comp titles, market research |
| **3** | [3-preparation/](3-preparation/) | Pre-writing docs | 28 master documents (~1.4M words) |
| **4** | [4-utilities/](4-utilities/) | Production tools | Scripts, templates, snippets, AI prompts |
| **5** | [5-text/](5-text/) | Written content | All chapters, drafts, manuscript |
| **6** | [6-audio/](6-audio/) | Audiobook | Scripts, narration guides, recordings |
| **7** | [7-video/](7-video/) | Video content | Trailers, YouTube, courses, promos |
| **8** | [8-publication/](8-publication/) | Distribution | Ebooks, print, audio formats |
| **9** | [9-marketing/](9-marketing/) | Promotion | Whitepapers, social media, press kits |

---

## 🚀 How to Use This Template

### Starting a New Book Project

**⚡ Quick Start (Recommended):**

1. **Clean the template** (removes example data)
   ```bash
   bash operations/pipeline/scripts/cleanup-synthai-examples.sh
   ```

2. **Read the quick start guide**
   - [TEMPLATE-USAGE-QUICK-START.md](TEMPLATE-USAGE-QUICK-START.md) - 5-minute overview

3. **Customize for your book** (15 minutes)
   - Set project name in `metrics-summary.json`
   - Define chapter structure in `5-text/`
   - Create chapter outline in `3-preparation/blueprints/`

4. **Start Phase 1** (begin work)
   ```bash
   cd operations/pipeline/scripts
   ./get-manual-tasks.sh 1  # See what to do first
   ```

**📚 Detailed Guides:**
- [TEMPLATE-CLEANUP-GUIDE.md](TEMPLATE-CLEANUP-GUIDE.md) - Complete cleanup instructions
- [operations/pipeline/scripts/README.md](operations/pipeline/scripts/README.md) - Script documentation
- [PIPELINE-STATUS-DASHBOARD.md](operations/pipeline/PIPELINE-STATUS-DASHBOARD.md) - Track progress

---

### Understanding This Template

**This repository contains:**
- ✅ **Template structure** - Empty framework for any book
- ✅ **SYNTHAI examples** - Populated examples showing template usage

**SYNTHAI** is example data (fictional book about AI ethics) demonstrating:
- What completed phases look like
- How validation reports are formatted
- Realistic progress metrics
- Example decisions and gate passages

**To use:** Study SYNTHAI examples to learn, then clean and replace with your data.

---

### Alternative: Manual Setup

If you prefer manual control:

1. **Copy the template**
   ```bash
   cp -r book-production-pipeline-template "My-New-Book"
   cd "My-New-Book"
   ```

2. **Remove example files**
   - Delete files with `-EXAMPLE` suffix
   - Remove SYNTHAI sections from documentation
   - Reset metrics to 0% (see cleanup guide)

3. **Follow the pipeline sequence**
   - Phase 1: Ideation (concept development)
   - Phase 2: Research (market analysis)
   - Phase 3: Preparation (world-building, characters)
   - Phase 4: Utilities (templates, prompts, tools)
   - Phase 5: Text (write manuscript) ← Longest phase
   - Phase 6: Audio (audiobook production, optional)
   - Phase 7: Video (marketing videos, optional)
   - Phase 8: Publication (publish the book)
   - Phase 9: Marketing (promotional campaigns)

---

### Key Files to Understand

**Getting Started:**
- [TEMPLATE-USAGE-QUICK-START.md](TEMPLATE-USAGE-QUICK-START.md) - Start here
- [TEMPLATE-CLEANUP-GUIDE.md](TEMPLATE-CLEANUP-GUIDE.md) - Remove examples

**Operations:**
- [operations/pipeline/PIPELINE-STATUS-DASHBOARD.md](operations/pipeline/PIPELINE-STATUS-DASHBOARD.md) - Your single source of truth
- [operations/pipeline/STAGE-GATES-REFERENCE.md](operations/pipeline/STAGE-GATES-REFERENCE.md) - All 45 gates
- [operations/QA-System/QA-System-Complete-Reference.md](operations/QA-System/QA-System-Complete-Reference.md) - Quality framework

**Phase Tracking:**
- Each directory contains README.md files explaining:
  - **Purpose** - What this phase is for
  - **Deliverables** - What to produce
  - **Entry/Exit Criteria** - When to start/finish
  - **AI vs Manual Tasks** - What needs Claude vs. independent work

---

## 📊 Metrics & Tracking

The **metrics/** directory contains tracking templates for:
- Session progress (daily work logs)
- Chapter completion (per-chapter tracking)
- Act/book progress (high-level milestones)
- Phase completion (pipeline stage tracking)

---

## 🔄 Workflow Integration

### Daily Workflow
1. Start session → Update [operations/current/SESSION-PROGRESS-TRACKER.md](operations/current/SESSION-PROGRESS-TRACKER.md)
2. Track progress → Update [metrics/trackers/](metrics/trackers/)
3. Archive completed work → Move to [archive/](archive/)

### Quality Assurance
- Validation protocols in [operations/QA-System/](operations/QA-System/)
- Validation reports in [operations/validation/](operations/validation/)
- Quality frameworks in [3-preparation/quality-frameworks/](3-preparation/quality-frameworks/)

---

## 🎯 Best Practices

### Naming Conventions
- **Infrastructure:** Descriptive names (operations, metrics, archive)
- **Pipeline:** Numbered for sequence (1-ideation, 2-research, etc.)
- **Subdirectories:** Clear, descriptive, no numbers
- **Files:** Use hyphens, not underscores (my-document.md)

### Organization Tips
1. **One source of truth** - Don't duplicate files across directories
2. **Clear ownership** - Each file belongs in one logical location
3. **Archive regularly** - Move old versions to archive/
4. **Document everything** - Update READMEs as structure evolves
5. **Track progress** - Use metrics/ to maintain visibility

### File Management
- **Active work** → Keep in pipeline directories
- **Templates/tools** → Store in 4-utilities/
- **Completed drafts** → Move to archive/
- **Reference docs** → Keep in 3-preparation/references/

---

## 📚 Example Use Cases

### Business Fiction (like SYNTHAI)
- Heavy 3-preparation/ (world-building, frameworks)
- Extensive 2-research/ (industry research, comp titles)
- Detailed 9-marketing/ (whitepapers, LinkedIn, Substack)

### Memoir or Personal Narrative
- Lighter 3-preparation/ (timeline, key events)
- Focus on 5-text/ (writing and editing)
- Emphasis on 8-publication/ and 9-marketing/

### Non-Fiction/How-To
- Moderate 3-preparation/ (chapter outlines, research)
- Extensive 7-video/ (course materials, tutorials)
- Robust 9-marketing/ (blog posts, workshops)

### Poetry or Short Story Collection
- Minimal 3-preparation/
- Primary focus on 5-text/
- Creative 7-video/ and 9-marketing/ for promotion

---

## 🔧 Customization

Feel free to modify this template:
- Add new subdirectories as needed
- Remove unused pipeline phases
- Adjust naming conventions for your workflow
- Create custom tracking documents in metrics/

**The structure is a guide, not a prison. Adapt it to your needs.**

---

## 📖 Related Documents

- [3-preparation/README.md](3-preparation/README.md) - Detailed prep docs guide
- [5-text/README.md](5-text/README.md) - Chapter writing guidelines
- [8-publication/README.md](8-publication/README.md) - Publication formats
- [9-marketing/README.md](9-marketing/README.md) - Marketing strategy

---

## ℹ️ Support

For questions or suggestions about this template structure:
1. Review individual directory README files
2. Check the [operations/](operations/) directory for workflow docs
3. Examine [metrics/](metrics/) for tracking templates

---

**Happy writing! 📝**

*This template represents a complete book production pipeline from idea to market.*
