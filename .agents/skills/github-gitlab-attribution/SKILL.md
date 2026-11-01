---
name: github-gitlab-attribution
description: Use whenever drafting, creating, or editing GitHub or GitLab pull requests, merge requests, issues, tickets, comments, or reviews on Dafnik's behalf. Add visible attribution naming the acting AI model and version.
---

# GitHub and GitLab attribution

When an AI agent writes on Dafnik's behalf on GitHub or GitLab, append a plain-text attribution as the last paragraph of the description, comment, or review body:

```text
<Action> by <Model> <version> on behalf of Dafnik.
```

Choose the action that describes the contribution:

- `Created` for new issues, tickets, pull requests, and merge requests.
- `Updated` when editing an existing description or post.
- `Commented` for comments and discussion replies.
- `Reviewed` for review submissions and review comments.
- `Done` for other authored activity that has a text body.

Use the actual model and version identified by the active session's trusted runtime information. Prefer the model name over the application or harness name, such as Codex or Claude Code. For example, `gpt-6.1-sol` becomes `Sol 6.1`. Use `Fable` or `Opus` when that is the acting model, with its reported version. Do not infer identity from a default setting, an available-model list, or an earlier agent's signature.

For a session identified as `gpt-6.1-sol`, a new issue ends with:

```text
Created by Sol 6.1 on behalf of Dafnik.
```

Never invent a model or version. If only the model is known, use `<Model>, version unavailable`. If neither is available, use `AI agent, model/version unavailable` in place of `<Model> <version>`.

Include the footer in drafts shown for approval. Preserve repository templates and put the attribution after the substantive content, outside code blocks and HTML comments. On edits, replace the existing agent-attribution footer with the current action and identity instead of accumulating duplicate footers. Preserve credits within the substantive content.

Apply this to authored GitHub and GitLab communication, including self-hosted instances. Read-only operations need no attribution. Metadata-only actions, such as changing labels or assignees, do not require an extra comment. Do not add this footer to titles, source files, or commit messages unless requested.

This skill does not authorize posting or require additional approval. Follow the user's existing authorization and any requested review before submission.
