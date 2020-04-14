#!/usr/bin/env bash
# -------------------------------------------------------------------------
# Script		: cpu_usage.sh
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
readonly DE0A25="'#2BEE2F'"		# verde
readonly DE25A50="'#E8F760'"	# amarelo
readonly DE50A75="'#EE8B2B'"	# laranja
readonly DE75A100="'#EE2B2D'"	# vermelho

# Variável que define o valor da cor
COR=''

# Leitura (em %) do recurso de CPU ocioso
cpuOcioso=$(mpstat 1 1 | sed -n 5p | sed s/" * "/" "/g | cut -d" " -f12)

# Calculo feito no python do CPU em uso = 100% - ocioso (o bash não trabalha com float)
cpuUso=$(python -c "import sys; print (100 - float(sys.argv[1]))" ${cpuOcioso/,/.})

# Estrutura test "[[" no bash compara somente inteiros
cpuUsoBash=$(python -c "import sys; print str(int(float(sys.argv[1]) * 100))" $cpuUso)

# Decide a cor do texto
if [[ $cpuUsoBash -lt 2501 ]]; then
	COR=$DE0A25
elif [[ $cpuUsoBash -lt 5001 ]]; then
	COR=$DE25A50
elif [[ $cpuUsoBash -lt 7501 ]]; then
	COR=$DE50A75
else
	COR=$DE75A100
fi

echo "<span bgcolor='#1C1C26' fgcolor=$COR>CPU $cpuUso%</span>"
