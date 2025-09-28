#!/bin/bash
set -e

# Ruta donde se guardarán los datos de Loki en el host
LOKI_DIR="./loki-data"

echo "[INFO] Preparando directorio de datos para Loki en $LOKI_DIR"

# Crear estructura de directorios
mkdir -p $LOKI_DIR/{index,cache,chunks,compactor,wal}

# Dar permisos amplios (puedes ajustarlos si quieres más restricción)
chmod -R 777 $LOKI_DIR

echo "[INFO] Directorio preparado con permisos correctos."
echo "[INFO] Ahora puedes arrancar el stack con: docker compose up -d loki grafana promtail"
