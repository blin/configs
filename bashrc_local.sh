if [ -e /home/blinunleius/.nix-profile/etc/profile.d/nix.sh ]; then . /home/blinunleius/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval "$(starship init bash)"

alias vim=nvim

GOPATH="$HOME/go"
PATH="$PATH:$GOPATH/bin"
