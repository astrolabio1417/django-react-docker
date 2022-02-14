#!/bin/sh

# FIX FOR ESBUILD ERROR
echo "ESBUILD install started"
node node_modules/esbuild/install.js
echo "ESBUILD install finished"

exec "$@"