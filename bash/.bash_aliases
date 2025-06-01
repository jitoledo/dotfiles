function get_video_resolution() { ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 ${1}; }
function vplay() {
  w1=$(get_video_resolution ${1} | cut -dx -f1)
  w2=$(get_video_resolution ${2} | cut -dx -f1)
  if [[ $w1 == $w2 ]]; then
    echo "Both videos have the same horizontal resolution. Reproducing with vstack"
    mpv --lavfi-complex="[vid1][vid2]vstack[vo]" --external-file="${2}" --geometry=50%+0+0 ${1}
  else
    minwidth=$(($w1 < $w2 ? $w1 : $w2))
    echo "Videos with different horizontal resolution. Scaling to the smaller resolution of $minwidth and reproducing with vstack"
    mpv --lavfi-complex="[vid1]scale="$minwidth":-2[v1];[vid2]scale="$minwidth":-2[v2];[v1][v2]vstack[vo]" --external-file="${2}" --geometry=50%+0+0 ${1}
  fi
}

function hplay() {
  h1=$(get_video_resolution ${1} | cut -dx -f2)
  h2=$(get_video_resolution ${2} | cut -dx -f2)
  if [[ $h1 == $h2 ]]; then
    echo "Both videos have the same horizontal resolution. Reproducing with vstack"
    mpv --lavfi-complex="[vid1][vid2]hstack[vo]" --external-file="${2}" --geometry=x100%+0+0 ${1}
  else
    minheight=$(($h1 < $h2 ? $h1 : $h2))
    echo "Videos with different horizontal resolution. Scaling to the smaller resolution of $minheight and reproducing with hstack"
    mpv --lavfi-complex="[vid1]scale=-2:"$minheight"[v1];[vid2]scale=-2:"$minheight"[v2];[v1][v2]hstack[vo]" --external-file="${2}" --geometry=x100%+0+0 ${1}
  fi
}

alias cd="z"
alias cat=batcat
alias vimdiff='nvim -d -O'
# Aliases when using kitty
if [[ ! -z $KITTY_WINDOW_ID ]]; then
  alias icat="kitten icat --align=left"
  alias ssh="kitten ssh"
fi
