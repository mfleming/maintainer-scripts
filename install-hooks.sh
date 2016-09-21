#!/bin/bash

SCRIPTS_ROOT=$(dirname "${BASH_SOURCE[0]}")

[[  -e .git && -e Kbuild ]] || { 
	echo "Not inside kernel git directory" >&2
	exit 1
}

GIT_HOOKS="applypatch-msg commit-msg"
for g in $GIT_HOOKS; do
	cp ${SCRIPTS_ROOT}/$g .git/hooks/
done
