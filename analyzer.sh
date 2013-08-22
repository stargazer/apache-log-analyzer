
# * COMMAND LINE OPTION ANALYSIS
# There are 3 command line options, i, s, and o. They all require arguments.
# -i <input size, in lines>
# -s <sort method>
ivalue=1000
svalue=
while getopts "i:s:" opt; 
	do
		case $opt in
		i)
			ivalue="$OPTARG"
			;;
		s)
			svalue="$OPTARG"
			;;
		\?) 	echo "Usage: ./analyzer.sh [OPTION] LOGFILE"
	  	     	echo "Valid options are:" >&2
	  	     	echo "  -i NUM	   Number of input lines" >&2
	  	     	echo "  -s <sort method> Sort method" >&2
			exit 1;;
		esac
	done

# * VALIDATION CHECKS
# Check whether the option ``-i`` is an integer.
if [ ! -z $ivalue ]; then
	re='^[0-9]+$'
	if ! [[ $ivalue =~ $re ]] ; then
	   echo "Option -i expects an integer" >&2; exit 1
	fi
fi
# Check whether the parameter ``-s`` contains a valid value.
sort=""
if [ ! -z $svalue ] ; then
	if [ "$svalue" == "ascsize" ] ; then
		sort="sort -h -k4"
	elif [ "$svalue" == "dessize" ] ; then
		sort="sort -h -r -k4"
	else
		printf "Option -s expects either value of 'ascsize' or 'dessize'";
		exit 1
	fi
fi

# Get the remaining parameters, which is the name of the logfile
shift $(($OPTIND -1))
logfile="$*"

if [[ -z $logfile ]] ; then
	echo "No LOGFILE given"
	echo "Usage: ./analyzer.sh [OPTION] LOGFILE"
	exit 1
fi	


# * COMMAND CONSTRUCTION
# Costruct the basic command
command="tail -n $ivalue $logfile | awk {'print \$4, \$6, \$7, \$10'} | sed 's/\[//g' | sed 's/\"//g'"

# Has sorting been asked? If yes, we append it
if [[ ! -z $sort ]]; then
	command="$command | $sort"	
fi	

# echo "$command"

# Execute the command
eval $command



#tail -n 40000 log/access | awk {'print $4, $6, $7, $10'} | sed 's/\[//g' | sed 's/\"//g' | sort -h -r -k4 | more    
