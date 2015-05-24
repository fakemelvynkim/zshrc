SYSTEM_OS=$(uname | env LANG=C LC_ALL=C LC_CTYPE=C tr '[:upper:]' '[:lower:]')
ZSH_HOME_DIRECTORY="${HOME}/.dotfiles/zshrc.git"
VIM_HOME_DIRECTORY="${HOME}/.dotfiles/vimrc.git"
SHARED_DIRECTORY="" # to be defined in main

check_requirements() {
	if ! test -d "${ZSH_HOME_DIRECTORY}"; then
		die "zsh is not found at ${ZSH_HOME_DIRECTORY}"
	fi

}

source_zshrc() {
	local FILE_VIMRC=""

	if ! test -d "${ZSH_HOME_DIRECTORY}/zshrc.d/$1"; then
		die "${ZSH_HOME_DIRECTORY}/zshrc.d/$1 is not found. Can't source zshrc files."
	else
		for FILE_ZSHRC in ${ZSH_HOME_DIRECTORY}/zshrc.d/$1/*.zshrc
		do
			. "$FILE_ZSHRC"
		done
	fi
}

die() {
    echo "ERROR: $1"
}

# main
check_requirements
case ${SYSTEM_OS} in
	*linux*)
		SHARED_DIRECTORY="/home/Public"
		source_zshrc "linux"
		;;
	*darwin*)
		SHARED_DIRECTORY="/Users/Shared"
		source_zshrc "darwin"
		;;
	*)
		die "Operating system not recognized."
		;;
esac
source_zshrc "common"

export PATH="$PATH:$HOME/.rvm/bin":/Users/Shared/Library/sdk/gradle/gradle-2.4 # Add RVM to PATH for scripting
