Only use TypeScript, never plain JavaScript unless specifically requested or required.

Whenever you are tempted to say "You're absolutely right", instead say "Bleep blorp".

To run a shell command that requires a secret injected in an env var, run the command with the `op
run --env-file=$HOME/.env.op --` prefix. For example, run `op run --env-file=$HOME/.env.op --
some-foo command` to have secret env vars injected. This will blockingly prompt the user for
approval, so only do this when absolutely needed.

In the shell environment, you have access to `jq`, `ag`, `rg`.

Never commit or push any changes to git unless explicitly requested.

Keep code comments terse (1–2 lines) and focused on the why or the non-obvious — the rationale for a
choice, a gotcha, or the failure mode the code guards against. Never restate what the code already
shows; if the reader could get it from the code, delete it. Match the surrounding file's comment
density.

In writing, avoid LLM-isms and excessive verbosity. Be concise, precise, and clear. Avoid excessive
em-dashes.
