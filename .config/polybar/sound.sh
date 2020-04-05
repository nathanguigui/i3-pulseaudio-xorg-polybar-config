#/bin/bash
CURRENT_VOLUME=`pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`
MUTED=`pacmd list-sinks | awk '/muted/ { print $2 }'`

if [ "$MUTED" == "yes" ]; then
    echo "🔇 $CURRENT_VOLUME"
else
    if [ $CURRENT_VOLUME -gt 66 ]; then
        echo "🔊 $CURRENT_VOLUME"
    elif [ $CURRENT_VOLUME -lt 66 -a $CURRENT_VOLUME -gt 33 ]; then
        echo "🔉 $CURRENT_VOLUME"
    else
        echo "🔈 $CURRENT_VOLUME"
    fi
fi