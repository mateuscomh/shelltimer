#!/usr/bin/env bash

if [ -n "$1" ]; then
    tempo_minutos="$1"
else
    read -p "Insira o tempo em minutos para a contagem regressiva: " tempo_minutos
fi
read -p "Informe o titulo do timer caso queira: " motivo

tempo_minutos=$((tempo_minutos * 60))

while [ $tempo_minutos -ge 0 ]
do
    echo "Tempo restante: $((tempo_minutos / 60)) minutos e $((tempo_minutos % 60)) segundos" 
    notify-send -t 999 "Contagem Regressiva: $motivo" "Tempo restante: $((tempo_minutos / 60)) minutos e $((tempo_minutos % 60)) segundos"
    sleep 1
    ((tempo_minutos--))
done

# Emite 10 bips seguidos ao final da contagem regressiva
for i in {1..10}
do
    echo -e "\a" 
    sleep 0.2
done
notify-send -t 10000 "Contagem: $motivo Encerrada:"
exit 0
