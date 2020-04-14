#!/usr/bin/env bash
# -------------------------------------------------------------------------
# Script		: volume
# Descrição		: obtem o volume da saída principal para uso no i3blocks
# Versão		: 0.1-beta
# Autor			: Eppur Si Muove
# Contato		: eppur.si.muove@keemail.me
# Criação		: 03/04/2020
# Modificação	:
# Licença		: GNU/GPL v3.0
# -------------------------------------------------------------------------
# Uso:
#
# -------------------------------------------------------------------------

# Habilita o scroll do mouse para aumentar ou diminuir o volume.
# Habilita o botão direito do mouse para desabilitar o som.
case $BLOCK_BUTTON in
	1) pavucontrol ;; # left click, pulseaudio control
	3) pactl set-sink-mute 1 toggle ;;  # right click, mute/unmute
	4) pactl set-sink-volume 1 +2% ;; # scroll up, increase
	5) pactl set-sink-volume 1 -2% ;; # scroll down, decrease
esac

#Obtém estado do mixer, ligado ou desligado (muted)
state=$(amixer get Master | grep -Eo "\[on\]|\[off\]" -m1)

#Mostra o volume do mixer Master ativo no momento
if [[ $state = "[on]" ]]; then
	vol=$(amixer get Master | grep -Eo "1?[0-9][0-9]%" -m1)
	echo "<span fgcolor='#3CBD0F' bgcolor='#1C1C26'>🔊 $vol </span>] "
else
	echo "<span fgcolor='#3CBD0F' bgcolor='#1C1C26'>🔊 ${state^^} </span>] "
fi
