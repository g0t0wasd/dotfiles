xrandr --output HDMI-1 --primary --mode 1920x1080 --rate 144.00 --output eDP-1 --mode 1920x1080 --rate 60.00 --right-of HDMI-1
wpdir='/home/wasd/Pictures/wallpapers/'
read file1 file2 <<< $(echo $(ls $wpdir | grep -e '.jpg' -e '.md' | shuf -n 2))
file1path=$wpdir$file1
file2path=$wpdir$file2
xwallpaper --output HDMI-1 --zoom $file1path --output eDP-1 --zoom $file2path
# wal -i $file1path -n &

dunst &
