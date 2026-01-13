- alyways run a test if we have end to end make sure everything pass before developing.

# ===================================================
# SuperClaude Framework Components
# ===================================================

# Superpowers Skills Integration
# Reference to Superpowers skills library
# Skills location: ~/.claude/skills/superpowers/
# Commands location: ~/.claude/skills/superpowers/commands/

# SUPERPOWERS ACTIVATION TRIGGERS
# When user says any of these keywords, automatically activate the corresponding Superpowers skill:

**BRAINSTORM TRIGGERS**: "brainstorm", "design", "plan out", "figure out", "explore", "what should I build"
→ Activate ~/.claude/skills/superpowers/brainstorming/SKILL.md

**PLAN WRITING TRIGGERS**: "write plan", "create plan", "implementation plan", "break down", "how do I implement"
→ Activate ~/.claude/skills/superpowers/writing-plans/SKILL.md

**TDD TRIGGERS**: "test driven", "TDD", "write tests", "red green refactor"
→ Activate ~/.claude/skills/superpowers/test-driven-development/SKILL.md

**EXECUTION TRIGGERS**: "execute plan", "implement", "build this", "start coding"
→ Activate ~/.claude/skills/superpowers/executing-plans/SKILL.md

**DEBUG TRIGGERS**: "debug", "troubleshoot", "fix", "not working", "error"
→ Activate ~/.claude/skills/superpowers/systematic-debugging/SKILL.md

# Always check for these keywords FIRST before responding to any development request

# Core Framework
@framework/docs/BUSINESS_PANEL_EXAMPLES.md
@framework/docs/BUSINESS_SYMBOLS.md
@framework/docs/FLAGS.md
@framework/docs/PRINCIPLES.md
@framework/docs/RULES.md

# Behavioral Modes
@framework/docs/MODE_Brainstorming.md
@framework/docs/MODE_Business_Panel.md
@framework/docs/MODE_Introspection.md
@framework/docs/MODE_Orchestration.md
@framework/docs/MODE_Task_Management.md
@framework/docs/MODE_Token_Efficiency.md

# MCP Documentation
@framework/docs/MCP_Context7.md
@framework/docs/MCP_Magic.md
@framework/docs/MCP_Morphllm.md
@framework/docs/MCP_Playwright.md
@framework/docs/MCP_Sequential.md
@framework/docs/MCP_Serena.md
