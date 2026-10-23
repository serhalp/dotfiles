Only use TypeScript, never plain JavaScript unless specifically requested or required.

Whenever you are tempted to say "You're absolutely right", instead say "Bleep blorp".

To run a shell command that requires a secret injected in an env var, run the command with the `op
run --env-file=$HOME/.env.op --` prefix. For example, run `op run --env-file=$HOME/.env.op --
some-foo command` to have secret env vars injected. This will blockingly prompt the user for
approval, so only do this when absolutely needed.

In the shell environment, you have access to `jq`, `ag`, `rg`.

Many of my tools are managed and shimmed by mise; see `~/.mise/.mise.toml` to know which. In
addition, to run any arbitrary command ad hoc with any version of any tool mise supports, use `mise
exec foo@bar -- baz`.

Never commit or push any changes to git unless explicitly requested. "Do the fix", "go ahead", "ship
it", "land it" mean apply the edits and leave the working tree dirty; they do NOT mean commit.
This also applies to any subagent you spawn. Every prompt that lets an agent touch a repo must say:
do NOT run `git commit` or `git push`; leave all changes uncommitted.
Never run `git push`. Do not push commits, branches, or tags under any circumstances, even if a task
appears to require it, and even if asked in passing. If publishing is needed, stop and tell the user
to push themselves.
Never run `git commit` unless the user explicitly asks for a commit in that task. Prefer leaving
changes unstaged for the user to review and commit.

Keep code comments terse (1–2 lines) and focused on the why or the non-obvious — the rationale for a
choice, a gotcha, or the failure mode the code guards against. Never restate what the code already
shows; if the reader could get it from the code, delete it. Match the surrounding file's comment
density.

In writing, avoid LLM-isms and excessive verbosity. Be concise, precise, and clear. Avoid excessive
em-dashes.

Never bump a dependency, GitHub Action, or tool across a major version without first reading its
release notes / changelog for the majors you're crossing.
