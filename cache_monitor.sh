#!/bin/bash
# shout out to Swartz
usage() {
	cat << EOM

Script monitors CACHE_DIR for gif's with width GIF_WIDTH
Copies them to a directed <name> (passed as argument to
script). When script is interrupted (ctrl+c) it then
creates a <name>.pdf and <name>.html

Examples:

  usage: $0 <name>

Linux Firefox example:

  usage: CACHE_DIR=~/.cache/mozilla GIF_WIDTH=760 $0 <name>

OSX Chrome example:

  usage: CACHE_DIR=~/Library/Caches/Google/Chrome/ GIF_WIDTH=760 $0 <name>

current enviornment settings:
CACHE_DIR = ${CACHE_DIR}
GIF_WIDTH = ${GIF_WIDTH}

EOM
exit 1
}

if [ -z "${CACHE_DIR}" ]; then
	if [ `uname` == "Linux" ]; then
		CACHE_DIR="$HOME/.cache/mozilla/firefox/*.default"
	elif [ `uname` == 'Darwin' ]; then
		CACHE_DIR="$HOME/Library/Caches/Google/Chrome/"
	else
		CACHE_DIR="set CACHE_DIR manually"
	fi
fi
if [ -z "${GIF_WIDTH}" ]; then
	GIF_WIDTH=760
fi
if [ $# -eq 0 ]; then
	usage
fi


STORE_NAME="$1"
STORE_DIR=`pwd`/$STORE_NAME
mkdir $STORE_DIR
echo "Monitoring CACHE_DIR: ${CACHE_DIR}"
echo "Will store all GIF's with width GIF_WIDTH: ${GIF_WIDTH} in"
echo "$STORE_DIR"
cd $CACHE_DIR

halt () {
	echo "*** stop ***"

	if [ $(command -v convert 2>/dev/null ) ]; then
		echo "*** creating ${STORE_NAME}.pdf ***"
		echo "convert $STORE_DIR/*.gif $STORE_DIR/${STORE_NAME}.pdf"
		convert "$STORE_DIR/*.gif" "$STORE_DIR/${STORE_NAME}.pdf"
	else
		echo "convert tool from imagemagick required to create pdf"
	fi

	echo "*** creating ${STORE_NAME}.html ***"
	echo "<html><head><title>JsToR archive - ${STORE_NAME}</title></head><body>" > $STORE_DIR/${STORE_NAME}.html
	for gif in `ls $STORE_DIR/*.gif`; do
		echo "<img src=\"${gif}\"><br>" >> $STORE_DIR/${STORE_NAME}.html
	done
	echo "</body></html" >> $STORE_DIR/${STORE_NAME}.html

	exit $?
}
trap halt SIGINT


while [ 1 ]; do
	files=$(find . -type f -newer $STORE_DIR -exec file {} \; | grep GIF | grep 760 | awk '{print $1}')
	for file in $files; do
		# get rid of : from mime string
		filepath=${file%?}
		filename=$(basename $filepath)
		if [ ! -e "$STORE_DIR/*_$filename*" ]; then
			echo "cp $filepath $STORE_DIR/$(date +%H%M%S)_${filename}.gif"
			# copy file to HHMMSS_<id>.gif
			cp $filepath $STORE_DIR/$(date +%H%M%S)_${filename}.gif
		fi
	done
	sleep 4
done

sleep 1;
