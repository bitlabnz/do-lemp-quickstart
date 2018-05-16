# Run Updates
apt-get update

# Secure the mysql config
mysql_secure_installation

# Shell script to init new server shell
adduser $1
usermod -aG sudo $1

#Switch to new user
su $1

# Generate SSH keys
ssh-keygen

# Add me as authorized from all the same SSH keys, and take ownership
sudo cp /root/.ssh/authorized_keys ~/.ssh/authorized_keys
sudo chown $USER:$USER ~/.ssh/authorized_keys

# Install git-aware-prompt
mkdir ~/.bash
cd ~/.bash
git clone git://github.com/jimeh/git-aware-prompt.git

# Add to ~/.bashrc
echo "export GITAWAREPROMPT=~/.bash/git-aware-prompt" >> ~/.bashrc
echo 'source "${GITAWAREPROMPT}/main.sh"' >>  ~/.bashrc
echo 'export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "' >> ~/.bashrc

# bash history autocompletion
echo '## arrow up' >> ~/.inputrc
echo '"\e[A":history-search-backward' >> ~/.inputrc
echo '## arrow down' >> ~/.inputrc
echo '"\e[B":history-search-forward' >> ~/.inputrc

# Install unattended-upgrades
sudo apt-get install unattended-upgrades
sudo dpkg-reconfigure unattended-upgrades

# Install virtualhost helper
cd /usr/local/bin
sudo wget -O vhost https://raw.githubusercontent.com/thrasherht/virtualhost/master/virtualhost-nginx.sh
sudo chmod +x vhost
