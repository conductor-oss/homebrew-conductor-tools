# homebrew-conductor

Homebrew tap for Conductor developer tools and utilities.

[Conductor](https://www.conductor-oss.org/) is the leading open-source orchestration platform for
building highly scalable distributed applications.

## Install

```bash
brew install conductor-oss/conductor/conductor
```

Then verify:

```bash
conductor --version
```

> [!IMPORTANT]
> Always install using the **fully-qualified** name `conductor-oss/conductor/conductor`.
>
> A different, unrelated package named `conductor` exists in `homebrew/cask` — the Conductor.app
> desktop tool from conductor.build. Homebrew resolves unqualified names against `homebrew/core`
> and `homebrew/cask` **before** third-party taps, so a bare `brew install conductor` installs that
> app instead of this CLI. Running `brew tap conductor-oss/conductor` first does **not** change
> this.
>
> When it happens, Homebrew prints `Warning: Treating conductor as a cask`, installs a ~200 MB GUI
> application, and places no `conductor` binary on your `PATH` — so `conductor --version` fails
> with `command not found` even though `brew install` reported success.

### Recovering if you installed the cask by mistake

Installing the formula afterwards is **not sufficient on its own**. Homebrew refuses to link a
formula while a cask of the same name is installed, and reports:

```
==> conductor cask is installed, skipping link.
```

The formula lands in `Cellar/` but no symlink is created in `$(brew --prefix)/bin`, so the CLI
stays off your `PATH` and the original error persists. Pick one of the following.

**Keep both packages** — install the formula, then link it explicitly:

```bash
brew install conductor-oss/conductor/conductor
brew link conductor
```

**Keep only the CLI** — remove the cask first, then install normally:

```bash
brew uninstall --cask conductor
brew install conductor-oss/conductor/conductor
```

Either way, confirm the result:

```bash
which conductor        # e.g. /opt/homebrew/bin/conductor
conductor --version
```

## Formulae

| Formula | Installs | Status |
|---------|----------|--------|
| `conductor` | `conductor` — the Conductor CLI | Current |
| `orkes` | `orkes` — the same CLI under its former name | Deprecated |

The CLI was renamed from `orkes` to `conductor`. The `orkes` formula is retained for existing
users and is pinned to the last release published under that name; it receives no updates. New
installations should use `conductor`.

To migrate:

```bash
brew uninstall conductor-oss/conductor/orkes
brew install conductor-oss/conductor/conductor
```

## Upgrading

```bash
brew update
brew upgrade conductor-oss/conductor/conductor
```

The CLI can also update itself with `conductor update`, which replaces the binary in place. When
the CLI is managed by Homebrew, prefer `brew upgrade` so Homebrew's metadata stays consistent.

## Uninstall

```bash
brew uninstall conductor-oss/conductor/conductor
brew untap conductor-oss/conductor
```

## Other installation methods

This tap is one of several options. See the
[conductor-cli README](https://github.com/conductor-oss/conductor-cli#installation) for npm, the
`install.sh` / `install.ps1` scripts, and direct binary downloads.

## Links

- CLI source and issues: https://github.com/conductor-oss/conductor-cli
- Conductor documentation: https://conductor.io/content
- Conductor OSS: https://github.com/conductor-oss/conductor
