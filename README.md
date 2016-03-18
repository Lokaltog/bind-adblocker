# BIND ad blocker and personal caching DNS

**BIND config that returns `NXDOMAIN` for common ad network and malware domains.**
`NXDOMAIN` responses to ad domain queries ensure that browsers won't even attempt to
contact ad servers (and e.g. download blank gifs instead of ads, common in other DNS
based ad blockers like pi-hole).

Requires BIND 9.8+ as the ad blocker requires
[RPZ](https://en.wikipedia.org/wiki/Response_policy_zone) support.

## Usage

Append `include "/path/to/trusted.view.conf";` to your `named.conf`. Run
`update-blacklist.sh` and copy `trusted-view/` to your BIND `directory`.
