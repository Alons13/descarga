#!/bin/bash

#Proceso a monitorear
proceso="nombre_del_proceso"

#Verificar si el proceso está en ejecución
if pgrep -x "$proceso" > /dev/null; then
  echo "El proceso $proceso está en ejecución."
else
  echo "El proceso $proceso no está en ejecución. Enviando correo a root..."

#Banner
  mensaje="El proceso $proceso no está en ejecución en el servidor."

#Enviar un correo a root
  echo "$mensaje" | mail -s "¡AVISO!: EL Proceso $proceso no está en ejecución" root
fi
