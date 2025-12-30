#!/bin/bash

ROOT_DIR="./"
CONF_FILE="basic.conf"

# Busca todos los Observation_Navegation del árbol
find "$ROOT_DIR" -type d -name "Observation_Navegation" | while read navdir; do
    echo "⏳ Procesando carpeta: $navdir"

    # Carpeta padre (ej: 2013/2013_09)
    parent=$(dirname "$navdir")

    # Crear carpeta de salida
    outdir="$parent/Archivos_Procesados_Az_El"
    mkdir -p "$outdir"

    # Encontrar archivos .??o
    for obs in "$navdir"/*.??o; do
        
        # Verifica existencia real
        [ -e "$obs" ] || continue

        # Extraer cuerpo base (ej: lhyo2440)
        base=$(basename "$obs" .??o)

        # Año en sufijo (ej: 13)
        year_suffix=$(echo "$obs" | sed -E 's/.*\.([0-9][0-9])o/\1/')

        # Buscar navegación del mismo DOY y año
        nav="$navdir/brdc${base:4:3}0.$year_suffix"n

        if [ ! -f "$nav" ]; then
            echo "⚠ No se encontró navegación para: $obs"
            continue
        fi

        doy=${base:4:3}
        echo "➡ Día $doy Año .$year_suffix"

        salida="$outdir/${base}.pos"
        estad="$outdir/${base}.pos.stat"

        # Ejecutar RTKLIB
        rnx2rtkp -k "$CONF_FILE" "$obs" "$nav" -o "$salida" -s "$estad"

        echo "✔ Guardado: $salida"

    done

done

