# IRE-Labs Homebrew Tap

Internal Homebrew tap for IRE-Labs / Streams platform tooling.

## Install

```bash
brew tap ire-labs/tap git@github.com:IRE-Labs/homebrew-tap.git
brew install ire-labs/tap/streams
```

## Formulae

| Formula | Description |
|---|---|
| `streams` | Streams platform CLI — login (nexus-auth OIDC), data vault push, studio smart cards & pipelines (MCP), feedback, super-admin impersonation. Source: `nexus-core/studio-cli` |

## Interim release process (until CI/CD)

Binaries are built locally and committed to `bin/` — the formula installs the
prebuilt binary matching your CPU. To cut a new version:

```bash
cd nexus-core/studio-cli
V=v0.x.y
for arch in arm64 amd64; do
  CGO_ENABLED=0 GOOS=darwin GOARCH=$arch \
    go build -ldflags "-X main.version=$V -w -s" \
    -o bin/streams-$V-darwin-$arch ./cmd/streams
done
cp bin/streams-$V-darwin-* ../../homebrew-tap/bin/
shasum -a 256 ../../homebrew-tap/bin/streams-$V-darwin-*
# update Formula/streams.rb (version, urls, sha256s), commit, push
```

Upgrade with `brew update && brew upgrade streams` (or `brew reinstall streams`
after a re-tag of the same version).
