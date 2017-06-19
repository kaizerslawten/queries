while true; do
	
	sleep 2;
	string=$
	if [[ $(date) == *"12:04"* ]]; then
	  #echo "It's there!"
	  git add . && git commit -m "'Antoio Rosario - '$(date)" && git push origin master
	  sleep 60;
	  fi
done
