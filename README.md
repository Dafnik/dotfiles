# Dotfiles

## Skills

`skills-lock.json` in this directory tracks all externally installed skills.
Update them from the dotfiles root:

```sh
cd ~/dotfiles
npx skills update --project
```

Add skills from the same directory without `--global`:

```sh
npx skills add <owner/repo> --skill <skill-name>
```

Skills live in `.agents/skills`. The existing `~/.agents` symlink points to
`~/dotfiles/.agents`, so these skills are also available globally.
Locally authored skills such as `github-gitlab-attribution` stay in that directory
without an upstream lock entry.

The CLI uses different lock formats for project and global installs. Its global
state file, `.agents/.skill-lock.json`, is ignored if the CLI recreates it for
preferences. Use the project commands above to keep skill tracking in the root
lock file.
