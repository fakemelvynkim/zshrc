# environmen paths

# default PATH. Already preset.
# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

# .cabal path (e.g. for shellcheck)
export PATH="$HOME/.cabal/bin:$PATH"

# current user-specific path
export PATH="/usr/local/bin:$PATH"

# RVM 
export PATH="$HOME/.rvm/bin:$PATH"

# JAVA
export JAVA_HOME="$(/usr/libexec/java_home)"

# Maven
export M2_HOME=/usr/share/maven

#launchctl setenv JAVA_VERSION 1.7
#launchctl setenv JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home"
#JAVA_VERSION="1.7"
#JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home"

# Android-platform-tools
export PATH="/Applications/Develop/code/Android\ Studio.app/sdk/platform-tools:$PATH" #adb
export PATH="/Applications/Develop/code/Android Studio.app/sdk/build-tools/android-4.4.2:$PATH" # aapt
