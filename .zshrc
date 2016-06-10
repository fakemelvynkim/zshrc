SYSTEM_OS=$(uname | env LANG=C LC_ALL=C LC_CTYPE=C tr '[:upper:]' '[:lower:]')
ZSH_HOME_DIRECTORY="${HOME}/.dotfiles/zshrc.git"
VIM_HOME_DIRECTORY="${HOME}/.dotfiles/vimrc.git"
SHARED_DIRECTORY="" # to be defined in main
PUBLIC_DROPBOX_HOME_DIRECTORY="" # to be defined in main
PUBLIC_GOOGLE_DRIVE_HOME_DIRECTORY="" # to be defined in main

check_requirements() {
	if ! test -d "${ZSH_HOME_DIRECTORY}"; then
		die "zsh is not found at ${ZSH_HOME_DIRECTORY}"
	fi

}

init_shared_directory() {
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
}

init_sync_directory() {
    if [ "${SHARED_DIRECTORY}" = "" ]; then
        die "SHARED_DIRECTORY cannot be null; Check `.zshrc` configuration."
    else 
        PUBLIC_DROPBOX_HOME_DIRECTORY="${SHARED_DIRECTORY}/sync/dropbox/"
        PUBLIC_GOOGLE_DRIVE_HOME_DIRECTORY="${SHARED_DIRECTORY}/sync/google-drive/"
    fi
}

source_zshrc() {
	local FILE_VIMRC=""

	if ! test -d "${ZSH_HOME_DIRECTORY}/zshrc.d/$1"; then
		die "${ZSH_HOME_DIRECTORY}/zshrc.d/$1 is not found. Can't source zshrc files."
	else
		for FILE_ZSHRC in ${ZSH_HOME_DIRECTORY}/zshrc.d/$1/*.zshrc
		do
			case "$FILE_ZSHRC" in
                *encrypted*)
                    # exclude encrypted file to be sourced
                    ;;
                *)
                    . "$FILE_ZSHRC"
                    ;;
            esac

		done
	fi
}

die() {
    echo "ERROR: $1"
}

#
# main
#
check_requirements
init_shared_directory
init_sync_directory
source_zshrc "common"