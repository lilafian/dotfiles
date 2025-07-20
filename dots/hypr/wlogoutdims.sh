#!/bin/bash

MON_INDEX=$(hyprctl activewindow -j | jq -r '.monitor')

if [[ -z "$MON_INDEX" || "$MON_INDEX" == "null" ]]; then
    MON_INDEX=$(hyprctl monitors -j | jq '.[] | select(.focused == true) | .id')
fi

if [[ -z "$MON_INDEX" || "$MON_INDEX" == "null" ]]; then
    echo "Could not determine current monitor index."
    exit 1
fi

MON_NAME=$(hyprctl monitors -j | jq -r --argjson idx "$MON_INDEX" '.[] | select(.id==$idx) | .name')

if [[ -z "$MON_NAME" || "$MON_NAME" == "null" ]]; then
    echo "Could not determine current monitor name."
    exit 2
fi

read WIDTH HEIGHT <<<$(hyprctl monitors -j | jq -r --arg mon "$MON_NAME" '.[] | select(.name==$mon) | "\(.width) \(.height)"')

if [[ -z "$WIDTH" || -z "$HEIGHT" ]]; then
    echo "Failed to extract monitor width/height."
    exit 3
fi

L=$((WIDTH / 2.5))
R=$((WIDTH / 2.5))
T=$((HEIGHT / 2.5))
B=$((HEIGHT / 2.5))

wlogout -b 1 -r 5 -L "$L" -R "$R" -T "$T" -B "$B"
