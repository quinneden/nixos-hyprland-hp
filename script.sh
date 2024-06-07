#!/usr/bin/env bash

rsync -a wallpapers/wallpaper.png qeden@10.0.0.242:/home/qeden/Pictures/wallpapers
rsync -a wallpapers/otherWallpaper/catppuccin/* qeden@10.0.0.242:/home/qeden/Pictures/wallpapers/others/
rsync -a wallpapers/otherWallpaper/nixos/* qeden@10.0.0.242:/home/qeden/Pictures/wallpapers/others/
rsync -a ./wallpapers/otherWallpaper/others/* qeden@10.0.0.242:/home/qeden/Pictures/wallpapers/others/
