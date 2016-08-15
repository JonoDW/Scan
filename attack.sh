#download an address file
#read each line
#send a single ping to each line in rapid succession

#!/bin/bash
rm -f ipadds
wget http://www.lancaster.ac.uk/pg/weekes/ipadds
host=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
cat ipadds |  while read var
do
	if [ "$var" != "$host" ]
	then
		echo "$var" > test
		ping -c 1 $var &
		
	fi 	 	
done


#  if [ "$var" != "$host" ]
#  then
#  	ping -c 3 $var &
#  fi
#done < "$input"
