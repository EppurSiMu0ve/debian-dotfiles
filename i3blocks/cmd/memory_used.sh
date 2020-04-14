#!/usr/bin/env bash
# -------------------------------------------------------------------------
# Script		: memory_used
# Descrição		: << descrição breve de sua funcionalidade >>
# Versão		: 0.1-beta
# Autor			: Eppur Si Muove
# Contato		: eppur.si.muove@keemail.me
# Criação		: 09/04/2020
# Modificação	:
# Licença		: GNU/GPL v3.0
# -------------------------------------------------------------------------
# Uso:
#
# -------------------------------------------------------------------------

# Define cores para os estados de uso do CPU
readonly DE0A25="'#2BEE2F'"     # verde
readonly DE25A50="'#E8F760'"    # amarelo
readonly DE50A75="'#EE8B2B'"    # laranja
readonly DE75A100="'#EE2B2D'"   # vermelho

# Variável que define o valor da cor
COR=''

# Obtem uma fotografia do estado atual de memória físca (em Mb)
memRam=$(free -m | grep -i mem | sed s/" * "/" "/g)

# Obtem quantidade de memória física usada no momento (em Mb)
usoEmMb=$(cut -d" " -f3 <<< $memRam)

# Obtém quantidade de memória física total (em Mb)
totEmMb=$(cut -d" " -f2 <<< $memRam)

# Calcula a porcentagem de RAM utilizada
usoEmPerc=$(python -c\
	"import sys;\
	print(\"%.2f\" % ((float(sys.argv[1])*100)/float(sys.argv[2])))"\
	$usoEmMb $totEmMb)

# Estrutura test "[[" no bash compara somente inteiros
memUsoBash=$(python -c\
	"import sys;\
	print str(int(float(sys.argv[1]) * 100))"\
	$usoEmPerc)

# Decide a cor do texto
if [[ $memUsoBash -lt 2501 ]]; then
	COR=$DE0A25
elif [[ $memUsoBash -lt 5001 ]]; then
	COR=$DE25A50
elif [[ $memUsoBash -lt 7501 ]]; then
	COR=$DE50A75
else
	COR=$DE75A100
fi

echo "<span bgcolor='#1C1C26' fgcolor=$COR>MEM $usoEmPerc%</span>"
