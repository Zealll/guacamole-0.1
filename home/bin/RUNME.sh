#/bin/bash
# GuacaMole handyman
 
GUACA='"$\HOME/bin:$\PATH"'
MOLE='if [ -d "$\HOME/bin" ] ; then'
MOLE2='PATH="$\HOME/bin:$\PATH"'
MOLE3='fi'

confirm () {
    read -r -p "${1:-Would you like to proceed? [y/N]} " response
    case $response in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

############################################
# Begin
############################################
printf "handyman \n" && sleep 1
printf "make directory ~/bin if it doesn't already exist \n" && sleep 0.5
mkdir -v ~/bin
sleep 3

############################################
# prey 
############################################
printf "if string "$\GUACA" doesn't exist in .profile, add private bin to PATH \n\n" && sleep 1

confirm && if grep -Fxq "$GUACA" ~/.profile
then
    printf "~/bin already added to PATH \n\n"
else
    cat > $HOME/.profile << __PROFILE__

# ~/.profile: executed by the command interpreter for login shells.
# for umask for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
__PROFILE__

fi


printf ".profile written \n\n" 


############################################
# script shuffle time
# aka "wow I cant believe you made it this far"
############################################
printf "\nOMFG \n"
printf "moving scripts to ~/bin and symlinking back here \n" && sleep 1
mv ~/git/guacamole-0.1/bin/!'RUNME|README.md' ~/bin
printf ". \n" && sleep 1
cd ~/bin
printf "." && sleep 0.5 && printf ". \n" && sleep 0.5
ln -s ~/bin/* ~/git/guacamole-0.1/bin/