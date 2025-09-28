#!/bin/bash
set -e

LOKI_DIR="./loki-data"

echo "[INFO] Deteniendo contenedor Loki..."
docker stop loki || true

echo "[INFO] Eliminando datos antiguos en $LOKI_DIR"
rm -rf $LOKI_DIR/index $LOKI_DIR/cache $LOKI_DIR/chunks $LOKI_DIR/compactor $LOKI_DIR/wal

echo "[INFO] Recreando estructura de directorios..."
mkdir -p $LOKI_DIR/{index,cache,chunks,compactor,wal}
chmod -R 777 $LOKI_DIR

echo "[INFO] Reiniciando Loki..."
docker start loki || docker compose up -d loki

echo "[INFO] Limpieza completada. Loki está corriendo con almacenamiento vacío."
