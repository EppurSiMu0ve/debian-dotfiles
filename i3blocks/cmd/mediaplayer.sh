#!/usr/bin/env bash
# -------------------------------------------------------------------------
# Script		: mediaplayer.sh
# Descrição		: << descrição breve de sua funcionalidade >>
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

case $BLOCK_BUTTON in
	1) mpc next ;;
	2) x-terminal-emulator -e ncmpcpp -s visualizer & ;;
	3) mpc toggle ;;
	4) mpc seekthrough +5 ;;
	5) mpc seekthrough -5 ;;
esac

echo "<span fgcolor='#3584E4' bgcolor='#1C1C26' weight='bold'> 🙛 $(mpc current) 🙙 </span>"
