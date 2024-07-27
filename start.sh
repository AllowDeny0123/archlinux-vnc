#!/bin/sh


while getopts "p:w:h" OPTION; do
    case "$OPTION" in
        p)
		echo "$OPTARG" && \
		./setupvnc.sh $OPTARG
                ;;
        w)
		password=$(pwgen -s 8 1) && \
		echo "$password" && \
		echo "$OPTARG" && \
		curl -H "Content-Type: application/json" -d "{\"content\": \"$HOSTNAME:$password\"}" $OPTARG && \
		./setupvnc.sh $password
		;;
    h)
	    echo "script usage: $(basename $0) [-h] [-p PASSWORD] [-w WEBHOOK_URL]"
	    ;;
    esac
done

shift "$((OPTIND - 1))"
