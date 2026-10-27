# guardianprotocol.network

The public website for Guardian Protocol. It belongs to the project, not to any company.

## Rules

- **Neutral.** No sales copy. Companies appear only in the "Built on Guardian Protocol" directory: alphabetical, one published listing policy, everyone listed the same way.
- **No trackers.** No ad pixels or sign-up walls. Privacy-respecting analytics or none.
- **Honest.** Numbers on the page (patterns, ATLAS coverage, members) must match the registry. Placeholders stay in brackets until they're real.
- **The trademark check is still open** on the name. That is handled separately and is not a reason to hide the page: `noindex` would only keep it out of search results, and a site anyone can open is public use either way.
- **Brand.** Guardian blue `#2459FF` for the mark, links and buttons. Signal amber `#FFB020` only for the one lit node inside the mark, never as a general accent. Ink `#0B1020` and white. Manrope for headings, JetBrains Mono for code and labels.

## Files

| File | What |
| --- | --- |
| `index.html` | The whole site: one static page, no build step |
| `CNAME` | Tells GitHub Pages which custom domain to serve |
| `assets/` | Brand files copied from `brand/guardian-protocol`, so the site deploys on its own |
| `favicon.ico` | At the root, where browsers look for it by default |

The brand folder is the source of truth. When the mark changes, copy the files again rather than editing the copies here, and never redraw the mark.

Placeholders still to fill: founding member logos and count, and vendor listings. Getting started is no longer a placeholder: there is no package to install, so the hero shows the real path, which is a clone and a scripted run that costs nothing. Every link on the page resolves.

## Deploy (Firebase Hosting)

Live at https://guardian-protocol-site.web.app, Firebase project `guardian-protocol-site`.

```bash
firebase deploy --only hosting
```

`firebase.json` sets the whole folder as the public root and ignores `.git`, the README, the CNAME and the Firebase files themselves. The ignore list needs both `**/.*` and `**/.*/**`: the first alone matches dotfiles but not files inside a dot directory, so a first deploy served the entire `.git` folder publicly.

The page is indexable, deliberately. Neither `robots.txt` nor an `X-Robots-Tag` header exists, which for a while contradicted what this file claimed.

If that is ever revisited, `noindex` alone is the mechanism, as a header or a meta tag. Never `robots.txt` as well: a crawler told not to fetch the page never reads the `noindex` on it, so once anyone links to the site it can be listed as a bare URL with no way to suppress it. The two controls together are weaker than either alone.

### Custom domain

The domains are already registered with Firebase Hosting, so all that is left is DNS at the
registrar. Delete any existing `A` record on the apex and any existing `www` record first:
a registrar's default parking record will quietly win over these.

| Type | Host | Value | TTL |
| --- | --- | --- | --- |
| A | `@` | `199.36.158.100` | 600 |
| TXT | `@` | `hosting-site=guardian-protocol-site` | 600 |
| CNAME | `www` | `guardian-protocol-site.web.app` | 600 |

The TXT record is how Firebase proves you own the domain before it issues a certificate. It
stays there permanently; removing it later can invalidate the certificate.

The certificate is issued automatically once the records resolve, usually within a few hours
and up to 24. Until then the domain shows as pending and the `.web.app` address keeps working.
