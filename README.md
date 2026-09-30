# guardianprotocol.network

The public website for Guardian Protocol. It belongs to the project, not to any company.

## Rules

- **Neutral.** No sales copy. Companies appear only in the "Built on Guardian Protocol" directory: alphabetical, one published listing policy, everyone listed the same way.
- **No trackers.** No ad pixels or sign-up walls. Privacy-respecting analytics or none.
- **Honest.** Numbers on the page (patterns, ATLAS coverage, members) must match the registry. Placeholders stay in brackets until they're real.
- **Don't publish until the name is cleared** by the trademark attorney.

## Files

| File | What |
| --- | --- |
| `index.html` | The whole site: one static page, no build step |
| `CNAME` | Tells GitHub Pages which custom domain to serve |

Placeholders still to fill: the install commands (the `guardian-protocol` package isn't published yet), founding member logos and count, vendor listings, and the links.

## Deploy (GitHub Pages)

1. Create a public repo `guardianprotocol-ai/website` and push this folder to it.
2. In the repo: Settings, Pages, deploy from the `main` branch, root folder.
3. In the org: Settings, Pages, **verify the domain** guardianprotocol.network. This stops anyone else's GitHub Pages site from claiming it.
4. At the registrar (GoDaddy), set DNS:
   - Four `A` records for `@`: `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
   - One `CNAME` record for `www` pointing to `guardianprotocol-ai.github.io`
5. Back in the repo's Pages settings, tick **Enforce HTTPS** once the certificate is issued.

Check the current GitHub Pages docs before step 4; these addresses are GitHub's published ones but can change.

## Update

Edit `index.html`, preview it by opening the file in a browser, then commit on a branch and open a pull request. A merge to `main` deploys.
