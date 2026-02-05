#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SPEC_DIR="$SCRIPT_DIR/spec"
TEMP_DIR="$SCRIPT_DIR/.temp-ftl"

# FTL repository
FTL_REPO="https://github.com/pi-hole/FTL.git"
SPECS_PATH="src/api/docs/content/specs"

echo "📥 Downloading FTL OpenAPI specs (sparse checkout)..."
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

# Shallow clone with sparse checkout (only specs directory)
git clone --depth 1 --filter=blob:none --sparse "$FTL_REPO" "$TEMP_DIR"
cd "$TEMP_DIR"
git sparse-checkout set "$SPECS_PATH"
cd "$SCRIPT_DIR"

echo "📦 Bundling specs into single file..."
pnpm dlx @redocly/cli bundle "$TEMP_DIR/$SPECS_PATH/main.yaml" -o "$SPEC_DIR/upstream-bundled.yaml"

echo "🧹 Cleaning up..."
rm -rf "$TEMP_DIR"

# Diff check
if [ -f "$SPEC_DIR/bundled.yaml" ]; then
    echo ""
    echo "📊 Diff between current and upstream:"
    diff -u "$SPEC_DIR/bundled.yaml" "$SPEC_DIR/upstream-bundled.yaml" || true
    echo ""
    echo "⚠️  Review the diff above. If acceptable, run:"
    echo "   cp $SPEC_DIR/upstream-bundled.yaml $SPEC_DIR/bundled.yaml"
else
    echo "📝 No existing bundled.yaml. Creating initial version..."
    cp "$SPEC_DIR/upstream-bundled.yaml" "$SPEC_DIR/bundled.yaml"
    echo "✅ Created $SPEC_DIR/bundled.yaml"
fi
