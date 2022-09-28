#!/usr/bin/env bash

set -e
set -x

mypy msaFilesystem
flake8 msaFilesystem docs_src
black msaFilesystem docs_src --check
isort msaFilesystem docs_src scripts --check-only

