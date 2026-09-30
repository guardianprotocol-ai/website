# guardianprotocol.network

The public website for Guardian Protocol. It belongs to the project, not to any company.

## Rules

- **Neutral.** No sales copy. Companies appear only in the "Built on Guardian Protocol" directory: alphabetical, one published listing policy, everyone listed the same way.
- **No trackers.** No ad pixels or sign-up walls. Privacy-respecting analytics or none.
- **Honest.** Numbers on the page (patterns, ATLAS coverage, members) must match the registry. Placeholders stay in brackets until they're real.
- **Don't publish until the name is cleared** by the trademark attorney.
- **Brand.** Guardian blue `#2459FF` for the mark, links and buttons. Signal amber `#FFB020` only for the one lit node inside the mark, never as a general accent. Ink `#0B1020` and white. Manrope for headings, JetBrains Mono for code and labels.

## Files

| File | What |
| --- | --- |
| `index.html` | The whole site: one static page, no build step |
| `CNAME` | Tells GitHub Pages which custom domain to serve |
| `assets/` | Brand files copied from `brand/guardian-protocol`, so the site deploys on its own |
| `favicon.ico` | At the root, where browsers look for it by default |

The brand folder is the source of truth. When the mark changes, copy the files again rather than editing the copies here, and never redraw the mark.

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

## The "Protected by Guardian Protocol" badge (not built yet)

The mark already tells the story the badge needs to tell: six connected nodes forming a shield, one of them lit. A project that carries the badge is saying it is one of the nodes.

**Who may use it.** Any project that passes the scan, on the same published listing policy as the vendor directory: one rule, applied the same way to everyone, no exceptions bought or granted. Passing means the scan ran every verified pattern against the project's agent and reported the result. It does not mean the project is secure, and the badge must never be worded as though it does.

**What it would look like.** A small SVG, the mark at 16px next to "Protected by Guardian Protocol" in JetBrains Mono, on white or on ink. Two forms: one for a README, one for a footer. Both link back to the project's own scan result, not to a marketing page, so a reader can check the claim in one click.

**How it would work.**

1. The scan writes a result with the registry version it ran, the date, and the attack success rate per pattern.
2. The project publishes that result at a stable URL.
3. The badge reads it. A result older than the badge's freshness window, or one from a registry version that has since been superseded, shows as stale rather than as a pass. A badge that cannot go stale is a logo, not evidence.

**What has to be decided first.** Who hosts the results, how a project proves the result is its own, how often a badge must be refreshed, and what happens when a project fails after having passed. None of that is settled, which is why the badge is a note here and not yet on the page.

**Rules if it ships.** Never on the site's own header as decoration. Never implying certification or endorsement by the project. Never used by a company to suggest the protocol favours it: the neutrality rule at the top of this file applies to the badge exactly as it applies to the directory.
