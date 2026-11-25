# strip-co-authored-by

Git `commit-msg` hook that removes all `Co-authored-by:` trailers from commit messages
(case-insensitive) and trims trailing blank lines.

## Install

Into the current repository:

```sh
/path/to/strip-co-authored-by/install.sh
```

Globally, for all repositories (sets `core.hooksPath` to `~/.git-hooks`):

```sh
/path/to/strip-co-authored-by/install.sh --global
```

> Note: `core.hooksPath` replaces per-repo `.git/hooks`, so other hooks in those repos won't run
> unless you put them into `~/.git-hooks` too.

One-liner without cloning:

```sh
curl -fsSL https://raw.githubusercontent.com/badamn/strip-co-authored-by/main/hooks/commit-msg \
  -o .git/hooks/commit-msg && chmod +x .git/hooks/commit-msg
```

## Limitations

- Bypassed by `git commit --no-verify`.
- Does not rewrite existing history and does not affect commits made via the GitHub web UI.
