# Applications
    alias mou="open -a Mou"

# Identity Access Management 
# List all mmembers of a group
# https://superuser.com/questions/279891/list-all-members-of-a-group-mac-os-x
members () { dscl . -list /Users | while read user; do printf "$user "; \
    dsmemberutil checkmembership -U "$user" -G "$*"; done | grep "is a member" | cut -d " " -f 1; };
