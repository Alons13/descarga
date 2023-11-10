#!/bin/bash

# Función
esLaborable() {
  fecha="$1"
  semana=$(date -d "$fecha" +%u)

  # Verificar
  if [ $semana -eq 6 ] || [ $semana -eq 7 ]; then
    echo "El Dia =$fecha es fin de semana => NO ES LABORABLE"
    return 1
  fi

  #FERIADOS
  feriados=("01-01:Año Nuevo" "02-20:Carnaval" "02-21:Carnaval" "03-24:Día Nacional de la Memoria por la Verdad y la Justicia" "03-23: Viernes Santo" "04-02: Día del Veterano y de los Caídos en la Guerra de Malvinas" "05-01: Día del Trabajo" "05-25: Día de la Revolución de Mayo" "06-20: Paso a la Inmortalidad del General D. Manuel Belgrano" "07-09: Día de la Independencia" "08-17: Paso a la Inmortalidad del General D. José de San Martín" "10-12: Día del Respeto a la Diversidad Cultural" "11-20: Día de la Soberanía Nacional" "12-08: Día de la Inmaculada Concepción de María" "12-25: Navidad")

  # Verificar si es un feriado
  for feriado in "${feriados[@]}"; do
    fechaFeriado="${feriados%%:*}"
    explicacion="${feriado#*:}"

    if [ "$fecha" == "$fechaFeriado" ]; then
      echo "La fecha $fecha es un feriado. No es laborable. Porque $explicacion."
      return 1
    fi
  done

  # Laborable
  echo "La fecha $fecha es laborable."
  return 0
}