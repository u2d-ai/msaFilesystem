#!/bin/sh -e
set -x

autoflake --remove-all-unused-imports --recursive --in-place msaFilesystem docs_src --exclude=__init__.py
black msaFilesystem docs_src
isort msaFilesystem docs_src
