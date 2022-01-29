./is_loaded.sh module-null-sink
if [ $? == 1 ]; then
    echo Loading Module
    pactl load-module module-null-sink
fi
comm="sox -t pulseaudio default -t pulseaudio null contrast 50 dither echo 0.8 0.5 60 0.5 trim "
N=5
if [ $# -ge 1 ]; then
	N=$1
fi
TIME=$(printf "%d * %f\n" $N 4.166  |  bc)
printf "Will run for approximantely %f minutes" $TIME
raw=$(./a.out $N)
readarray -t y <<<"$raw"

for i in "${!y[@]}"; do
  comm="${comm} ${y[i]}"
done

eval "$comm"
