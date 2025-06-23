#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#==================================================
# PACKAGE MANAGER WRAPPER
#==================================================
_pkg_manager() {
	local cmd="$1"
	shift

	case "$1" in
		-i|--install)
			if [ $# -lt 2 ]; then
				echo "Error: -i requires a package name"
				echo "Usage: ${FUNCNAME[1]} -i <package_name>"
				return 1
			fi
			shift
			$cmd -S --noconfirm --needed "$@"
			;;
		-u|--update)
			shift
			if [ $# -eq 0 ]; then
				$cmd -Syu --noconfirm
			else
				$cmd -U --noconfirm --needed "$@"
			fi
			;;
		-s|--search)
			if [ $# -lt 2 ]; then
				echo "Error: -s requires a search term"
				echo "Usage: ${FUNCNAME[1]} -s <search_term>"
				return 1
			fi
			shift
			$cmd -Ss "$@"
			;;
		-r|--remove)
			if [ $# -lt 2 ]; then
				echo "Error: -r requires a package name"
				echo "Usage: ${FUNCNAME[1]} -r <package_name>"
				return 1
			fi
			shift
			$cmd -Runs --noconfirm "$@"
			;;
		*)
			echo "Usage: ${FUNCNAME[1]} {-i|--install|-u|--update|-s|--search|-r|--remove} [package_name]"
			echo "  -i, --install   Install package(s)"
			echo "  -u, --update    Update all packages or specific package(s)"
			echo "  -s, --search    Search for package(s)"
			echo "  -r, --remove    Remove package(s)"
			;;
	esac
}

#==================================================
# PACMAN
#==================================================
pac() {
	_pkg_manager "sudo pacman" "$@"
}

#==================================================
# YAY
#==================================================
ya() {
	_pkg_manager "yay" "$@"
}

#==================================================
# VENCORD
#==================================================
alias vencord='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'

#==================================================
# BARE GIT REPO
#==================================================
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
