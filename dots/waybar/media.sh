TITLE=$(playerctl metadata title)
if [ "$?" != 0 ]; then
    echo "No media playing"
    exit
fi
ARTIST=$(playerctl metadata artist)
RADIO=$(playerctl metadata rhythmbox:streamTitle)

if [[ $TITLE == *"&"* ]]; then
    TITLE=$(sed "s/\&/\&amp\;/g")
fi

if [[ $ARTIST == *"&"* ]]; then
    ARTIST=$(sed "s/\&/\&amp\;/g")
fi

if [[ $RADIO == *"&"* ]]; then
    RADIO=$(sed "s/\&/\&amp\;/g")
fi

if [ -n "$ARTIST" ]; then
    echo "$TITLE - $ARTIST"
    exit
fi

if [ -n "$RADIO" ]; then
    echo "$TITLE ($RADIO)"
    exit
fi

echo "$TITLE"
