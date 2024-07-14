#!/bin/zsh
# yt-dlp
dl-yt () {
    if [[ $# -lt 3 ]] || [[ "$1" == "-h" ]]; then
        echo "Usage: dl-yt [ resolution ] [ type v | p ] [url..]"
        echo "Types:"
        echo "\tv = video"
        echo "\tp = playlist"
        return 1
    fi

    local resolution=$1
    local vtype=$2
    local format="bestvideo[height<=${resolution}][ext=mp4]+bestaudio[ext=m4a]"

    if [[ $vtype == "p" ]]; then
        yt-dlp -f "$format" -o "%(playlist)s/%(title)s.%(ext)s" "$3"
    else
        yt-dlp -f "$format" -o "%(title)s.%(ext)s" "$3"
    fi
}
_dl-yt(){
    local state
    local -a line

    _arguments \
        '1:resolution:(360 480 720 1080)' \
        '2:type:(v p)' \
        '3:url:_urls'
}
compdef _dl-yt dl-yt


# call neovide
vv(){
    neovide $@ & disown
}


# Extract any archive
extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1    ;;
            *.tar.gz)    tar xzf $1    ;;
            *.bz2)       bunzip2 $1    ;;
            *.rar)       unrar x $1    ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xf $1     ;;
            *.tbz2)      tar xjf $1    ;;
            *.tgz)       tar xzf $1    ;;
            *.zip)       unzip $1      ;;
            *.Z)         uncompress $1 ;;
            *.7z)        7z x $1       ;;
            *)           echo "'$1'cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}


# Get size of folders / files in current dir
ffsize () {
    du -sh * | sort -h
}

calc() {
  echo "$*" | bc -l;
}
