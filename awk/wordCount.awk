#/usr/bin/gawk -f
#


BEGIN{
	# FPAT é uma variável que faz a definição do que é uma palavra
	# aqui vamos definir que uma palavra pode ser dividida em dois grupos:
	# 	* As que contém apóstrofe;
	#	* As que não contém apóstrofe;
	# Para que nossa expressão englobe essas duas possibilidades, nosso regex deve conter uma lógica condicional or:
	# [a-zA-Z0-9]+'[a-zA-Z0-9] -> qualquer carcactere alfanumérico uma ou mais vezes seguide de ' seguido de qualquer carcactere #alfanumérico uma ou mais vezes (casa com palavras com apóstrofe)
	# OU
	# [a-zA-Z0-9]+ -> qualquer caractere alfanmérico uma ou mais vezes (casa com palavras sem apóstrofe)

	FPAT = "[a-zA-Z0-9]+'[a-zA-Z0-9]+|[a-zA-Z0-9]+";
}

#main
{
	$0 = tolower($0);
	for(i = 1; i < NF + 1; i++){
		if($i != ""){
			#print($i);
			vetorDePalavras[$i]++;
		}
	}
}


END{
	for(i in vetorDePalavras){
		print(i ": " vetorDePalavras[i]);
	}
}