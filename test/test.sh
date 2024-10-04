#!/bin/bash

# Simular entrada de nombres de estudiantes, asignaturas y calificaciones
input_data=$(cat <<EOF
Juan Perez
Pedro Ruiz
Maria Gomez
Luis Tapia
Sofia Lopez
Algebra Lineal
Fisica Aplicada
Quimica General
8.5
9.0
7.5
6.5
6.0
5.0
9.0
8.5
9.5
4.5
5.0
3.0
7.0
8.0
6.5
EOF
)

# Ejecutar el programa calificaciones y pasar la entrada simulada
# La salida del programa se redirige al archivo output.txt
echo "$input_data" | ./main > output.txt

# Verificar las salidas clave
error=0

# Verificar si el promedio por estudiante aparece
if ! grep -q "Promedio por Estudiante" output.txt; then
    echo "Error: No se generó el promedio por estudiante."
    error=1
fi

# Verificar si el promedio por asignatura aparece
if ! grep -q "Promedio por Asignatura" output.txt; then
    echo "Error: No se generó el promedio por asignatura."
    error=1
fi

# Verificar si las calificaciones más altas y bajas por estudiante aparecen
if ! grep -q "Calificación Más Alta y Más Baja por Estudiante" output.txt; then
    echo "Error: No se generaron las calificaciones más altas y bajas por estudiante."
    error=1
fi

# Verificar si los aprobados y reprobados por asignatura aparecen
if ! grep -q "Aprobados y Reprobados por Asignatura" output.txt; then
    echo "Error: No se generaron los aprobados y reprobados por asignatura."
    error=1
fi

# Verificar valores específicos de los promedios
if ! grep -q "8.33" output.txt; then
    echo "Error: El promedio de Juan no es correcto."
    error=1
fi

if ! grep -q "5.83" output.txt; then
    echo "Error: El promedio de Pedro no es correcto."
    error=1
fi

# Mostrar el resultado final
if [ $error -eq 0 ]; then
    echo "Prueba pasada exitosamente."
    exit 0
else
    echo "Prueba fallida."
    exit 1
fi
