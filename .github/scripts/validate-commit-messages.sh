#!/usr/bin/env sh

set -eu

base_sha="${1:?Informe o SHA base.}"
head_sha="${2:?Informe o SHA final.}"
pattern='^(feat|fix|docs|refactor|perf|test|build|ci|chore|security)\([a-z0-9][a-z0-9-]*\)!?: .+ #[0-9]+$'
failed=0

git log --format='%H%x09%s' "$base_sha..$head_sha" |
while IFS="$(printf '\t')" read -r commit_sha subject; do
    if ! printf '%s\n' "$subject" | grep -Eq "$pattern"; then
        printf 'Commit %s fora do padrao: %s\n' "$commit_sha" "$subject" >&2
        failed=1
    fi

    if [ "$failed" -ne 0 ]; then
        exit 1
    fi
done
