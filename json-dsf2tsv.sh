#!/usr/bin/env sh
function convCall() {
	BN="$1"
	FT="$2"
	echo "BN $BN"
	echo "FT $FT"
	case $FT in
		Endpoint)
			if grep -E 'resourceType": ?"Endpoint' "$BN.json" > /dev/null ; then
				json-endpoint2tsv.jq < "$BN.json" > "$BN.tsv"
				touch -r "$BN.json" "$BN.tsv"
			else
				echo "fount no resourceType Endpoint"
			fi
			;;
		OrganizationAffiliation)
			if grep -E 'resourceType": ?"OrganizationAffiliation' "$BN.json" > /dev/null ; then
				json-affiliation2tsv.jq < "$BN.json" > "$BN.tsv"
				touch -r "$BN.json" "$BN.tsv"
			else
				echo "fount no resourceType OrganizationAffiliation"
			fi
			;;
		Organization)
			if grep -E 'resourceType": ?"Organization' "$BN.json" > /dev/null ; then
				json-organization2tsv.jq < "$BN.json" > "$BN.tsv"
				touch -r "$BN.json" "$BN.tsv"
			else
				echo "fount no resourceType Organization"
			fi
			;;
		Task)
			if grep -E 'resourceType": ?"Task' "$BN.json" > /dev/null ; then
				json-task2tsv.jq < "$BN.json" > "$BN.tsv"
				touch -r "$BN.json" "$BN.tsv"
			else
				echo "fount no resourceType Task"
			fi
			;;
		*)
			echo "unknown type $FT"
			;;
	esac

}

function convert() {
	for F in "$@" ; do
		echo "check F=$F"
		BN=$(basename "$F" .json)
		echo "check BN=$BN"
		ls -1 "$BN"*
		cnt=$(ls -1 "$BN".json "$BN".tsv 2>/dev/null | wc -l)
		echo "found $cnt"
		if [ $cnt -eq 2 ] ; then
			echo "skip"
		else
			echo "convert"
			#json-task2tsv.jq < "$BN.json" > "$BN.tsv"
			FT=$(echo "$BN" | sed -Ee 's#_.*##g')
			# if FT empty grep for resourceType
			if [ -z "$FT" ] ; then
				FT=$(grep -E '"resourceType" ?: ?"[^"]+"' "$F" | \
				  sed -Ee 's/.*"resourceType": ?"([^"]+)".*/\1/g')
			fi
			echo "FT=$FT"
			case $FT in
				Endpoint|OrganizationAffiliation|Organization|Task)
					convCall "$BN" "$FT"
					;;
				*)
					echo "unknown type $FT -> grep in file for resourceType"
					FT=$(grep -E '"resourceType" ?: ?"[^"]+"' "$F" | \
				  	  sed -Ee 's/.*"resourceType": ?"([^"]+)".*/\1/g')
					convCall "$BN" "$FT"
					;;
			esac
			ls -1 "$BN"*
		fi
		echo
	done
}

# if [ "$#" -gt 0 ] ; then
#     convert "$@"
# else
# 	for F in $(ls -1 {Endpoint,OrganizationAffiliation,Organization}*.json | gawk '!seen[$0]++' ) ; do
# 		convert "$F"
# 	done
# fi

STARTDIR="."
EXTENSION="json"
MAXDEPTH=1
FI_RT="-regextype posix-extended"
FI_IREG_NF="(Endpoint|OrganizationAffiliation|Organization).*"
FI_IREG=".*${FI_IREG_NF}\.${EXTENSION}"

# 
# take file names from 
# * commandline or 
# * pipe and call for each file 
# * or find files in STARTDIR with EXTENSION and call for each file
if [ "$#" -gt 0 ] ; then
    for FILE in "$@" ; do
        echo "FILE $FILE"
        convert "$FILE"
    done
elif [ ! -t 0 ] ; then
    while IFS= read -r FILE; do
        echo "FILE $FILE"
        convert "$FILE"
    done
else
    for FILE in $(find "$STARTDIR" ${FI_RT[@]} -maxdepth "$MAXDEPTH" -type f -iregex "$FI_IREG") ; do
        echo "FILE $FILE"
       convert "$FILE"
    done
fi


