#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2025 OmniNode.ai Inc.
# SPDX-License-Identifier: MIT
#
# OMN-20122: every link on the org profile README must resolve for an
# unauthenticated reader. Extracts each https URL from profile/README.md,
# rewrites github.com blob links to their raw form (a 404 page on github.com
# still answers 200 for a signed-in browser, raw does not), and fails on any
# non-2xx/3xx status. No token is sent.
#
# Usage: bash profile/check-links.sh
set -uo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
README="$HERE/README.md"

urls="$(grep -oE 'https://[^) ]+' "$README" | sort -u)"
[ -n "$urls" ] || { echo "FAIL: no URLs found in $README" >&2; exit 1; }

bad=0
while IFS= read -r url; do
    probe="$url"
    if [[ "$url" =~ ^https://github\.com/([^/]+)/([^/]+)/blob/([^/]+)/(.+)$ ]]; then
        probe="https://raw.githubusercontent.com/${BASH_REMATCH[1]}/${BASH_REMATCH[2]}/${BASH_REMATCH[3]}/${BASH_REMATCH[4]}"
    fi
    code="$(curl -sS -o /dev/null -L -w '%{http_code}' -H 'User-Agent: omninode-profile-link-check' "$probe" 2>/dev/null || echo 000)"
    case "$code" in
        2*|3*) echo "ok   $code $url" ;;
        *)     echo "FAIL $code $url" ; bad=$((bad+1)) ;;
    esac
done <<< "$urls"

if [ "$bad" -gt 0 ]; then
    echo "FAIL: $bad link(s) on the org profile README do not resolve" >&2
    exit 1
fi
echo "PASS: every README link resolves"
