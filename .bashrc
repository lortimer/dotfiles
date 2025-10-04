# Add to the end of ~/.bashrc to load bashprofile file in new terminals

if [ -f $HOME/.bash_profile ]; then
	. $HOME/.bash_profile
	echo "loaded bash profile"
fi