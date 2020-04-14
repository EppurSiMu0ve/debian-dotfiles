#!/usr/bin/env bash
# -------------------------------------------------------------------------
# Script		: keyindicator.sh
# Descrição		: << descrição breve de sua funcionalidade >>
# Versão		: 0.1-beta
# Autor			: Eppur Si Muove
# Contato		: eppur.si.muove@keemail.me
# Criação		: 04/04/2020
# Modificação	:
# Licença		: GNU/GPL v3.0
# -------------------------------------------------------------------------
# Uso:
#
# -------------------------------------------------------------------------

# Estado do LED
readonly CAPS_APENAS=1
readonly NUML_APENAS=2
readonly CAPS_E_NUML=3
readonly SCRL_APENAS=4
readonly CAPS_E_SCRL=5
readonly NUML_E_SCRL=6
readonly TUDO_ATIVO=7

# Define cores para os estados ligado e desligado
readonly ON="'#3CBD0F'"
readonly OFF="'#4B4C4D'"

# Define estado incial
CAPS_STATUS=$OFF
SCRL_STATUS=$OFF
NUML_STATUS=$OFF

# obtém o estado atual dos LEDs
LED=$(xset -q | grep -E -o "0000000[0-9]" | tr -d 0)

case $LED in
	$CAPS_APENAS )
		CAPS_STATUS=$ON
		;;
	$NUML_APENAS )
		NUML_STATUS=$ON
		;;
	$CAPS_E_NUML )
		CAPS_STATUS=$ON
		NUML_STATUS=$ON
		;;
	$SCRL_APENAS )
		SCRL_STATUS=$ON
		;;
	$CAPS_E_SCRL )
		CAPS_STATUS=$ON
		SCRL_STATUS=$ON
		;;
	$NUML_E_SCRL )
		NUML_STATUS=$ON
		SCRL_STATUS=$ON
		;;
	$TUDO_ATIVO  )
		CAPS_STATUS=$ON
		SCRL_STATUS=$ON
		NUML_STATUS=$ON
		;;
esac

echo "[\
<span bgcolor='#1C1C26' fgcolor=$CAPS_STATUS> CAPS </span>|\
<span bgcolor='#1C1C26' fgcolor=$SCRL_STATUS> SCRL </span>|\
<span bgcolor='#1C1C26' fgcolor=$NUML_STATUS> NUML </span>"
