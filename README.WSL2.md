# Get a system running in WSL2

## Manjaro

- Install from https://github.com/sileshn/ManjaroWSL2
- Add pamac: `pacman -Syu pamac-cli`
- create .Xauthority (https://stackoverflow.com/questions/66768148/how-to-setup-vcxsrv-for-use-with-wsl2/66768217#66768217)
- install these dotfiles

## VcXsrv

- Install VcXsrv (https://sourceforge.net/projects/vcxsrv/)
- Launch VcXsrv with vcxsrv.exe -auth "%USERPROFILE%\.Xauthority" -clipboard -wgl -keyhook -emulate3buttons -nowinkill

## Launch i3

- wslg --shell-type login -d Manjaro --cd "~" -- DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0 i3
