#!/bin/bash
echo "=== Docker Test ==="

# Docker CLI確認
docker --version && echo "✅ CLI OK" || echo "❌ CLI failed"

# Docker daemon接続確認
docker info >/dev/null 2>&1 && echo "✅ Daemon OK" || echo "❌ Daemon failed"

# 基本機能テスト
docker ps >/dev/null 2>&1 && echo "✅ Containers OK" || echo "❌ Containers failed"

echo "=== Done ==="
