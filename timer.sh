echo Sincronismo de Repositório automatico Iniciado $(date)
while true; do
	sleep 2;
	#Efetuando commit para master 12:00
	if [[ $(date) == *"12:00:"* ]]; then
	  git add . && git commit -m "Antonio Rosario - $(date)" && git push origin master > $1 >> /dev/null
	  echo Commit Automatico efetuado $(date) com sucesso!
	  sleep 60;
	fi
	
	#Efetuando commit para master 15:00
	if [[ $(date) == *"15:00:"* ]]; then
		git add . && git commit -m "Antonio Rosario - $(date)" && git push origin master >> /dev/null
		echo Commit Automatico efetuado $(date) com sucesso!
		sleep 60;
	fi
	
	#Efetuando commit para master 17:00
	if [[ $(date) == *"17:00:"* ]]; then	
		git add . && git commit -m "Antonio Rosario - $(date)" && git push origin master >> /dev/null
		echo Commit Automatico efetuado $(date) com sucesso!
		sleep 60;
		fi
done
