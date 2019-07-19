#!/bin/bash

# Clean up previous test run
rm -rf monorepo single-package

# Prepare dummy package
mkdir single-package && cd single-package
cp ../sample.pdf .
git init
npm init -y
git add .
git commit -m "add pdf"

# Prepare monorepo
cd ..
mkdir monorepo && cd monorepo
git init
lerna init
git add .
git commit -m "init monorepo"

# Import original repo
lerna import -y --flatten ../single-package

# Go and check ./monorepo/packages/single-package/sample.pdf"
