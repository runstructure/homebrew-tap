# The Homebrew tap — layout and doctrine

This directory IS the tap repository's content, kept in-tree so the install
path is reviewed like everything else. When a tap repo exists (see "the two
open identities" below), publishing syncs this directory to it — the tap repo
itself never carries hand-edited state.

```
tools/tap/
  README.md          this file — becomes the tap repo's README
  structure.rb.tmpl  the formula skeleton bin/release_tap.ts renders
  Formula/
    structure.rb     RENDERED by bin/release.sh per release — gitignored here,
                     committed only in the tap repo, by the publish step
```

## The install line

```sh
brew install <org>/tap/structure
```

It installs one binary under two names: `structure` (the command) and
`runstructure` (its second name).

The asset names carry no version: the version is the release tag
(`build-<version>`), and the formula names it.

## Why a tap is first

The install doctrine (adopted 2026-08-08, scoreboard addendum §3): install
offerings ranked `brew install <tap>/structure` → single signed binary from
Releases → AUR/nix → no-install trial → build from source → `curl | sh` last
or not at all. No `curl | sh` installer exists in this repo, deliberately.

## How the formula is produced

`bin/release.sh` builds `structure-<os>-<arch>.tar.gz` (a single
`deno compile` binary, `structure`, with the cockpit dist embedded), emits its release
assets (checksum · sigstore · SBOM — bin/release_assets.ts), then calls
`bin/release_tap.ts`, which:

1. reads each artifact's **published** `.sha256` (never recomputing — the
   formula must quote the statement a downloader will check, so a stale
   checksum file is caught rather than papered over);
2. renders `Formula/structure.rb` from `structure.rb.tmpl`, one `on_macos` /
   `on_linux` block per artifact actually built — a platform with no artifact
   gets no block, never a dead URL;
3. verifies the render **with the consuming tool**: `brew style` lints it,
   and a scratch-tap round trip (`brew tap-new` → `brew fetch` → `brew
   install` → `structure --version` → `brew test` → uninstall → untap, and
   its download removed from Homebrew's cache) proves the whole install path against the local artifacts. Emitting is not
   verifying; brew's verdict is the one that counts.
4. on `--publish` with `STRUCTURE_TAP_REPO` set, clones the tap repo, writes
   the formula and this README (one layout, the one the round trip
   verified), commits and pushes. With it unset, the honest
   state is printed: rendered, NOT pushed.

## The two open identities (Michael's calls, deliberately not baked)

- **Which repo hosts the releases.** The formula's download URLs point at
  `https://github.com/<slug>/releases/download/<tag>/<asset>`. `<slug>` comes
  from `STRUCTURE_RELEASE_REPO` — a public, releases-only repo (e.g.
  `runstructure/structure`) — falling back to the `origin` remote of the
  checkout building the release. `bin/release.sh --publish` creates the
  release in that same repo (every `gh release` call names it), so the URLs
  and the uploads cannot disagree; it refuses a release repo that is private
  or empty, and the tag targets that repo's own head, with the source commit
  named in the release body. An env knob, not a constant.
- **Where the tap lives.** `STRUCTURE_TAP_REPO` (e.g.
  `runstructure/homebrew-tap`, giving `brew install runstructure/tap/structure`
  — the line the site prints, sites/studies/brand.js).
  Unset until ruled.

Everything here is USPTO-gated for publication (docs/naming.md): build and
verify everything, publish nothing, until formal clearance.
