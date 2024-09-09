echo 'RUN THIS SCRIPT WITH YOUR GITHUB USERNAME AND EMAIL AS ARGUMENTS'
apt update 
apt install ncat
echo Host github.com >> ~/.ssh/config
echo '        Hostname ssh.github.com' >> ~/.ssh/config
echo '        Port 443' >> ~/.ssh/config
echo '        ProxyCommand ncat --proxy-type http --proxy bmiproxyp.chmcres.cchmc.org:80 %h %p' >> ~/.ssh/config 
gituser=$1 
gitemail=$2
echo $gitemail
git config --global user.name $gituser
git config --global user.email $gitemail
ssh-keygen '-t' ed25519 '-C' $gitemail
cat ~/.ssh/id_ed25519.pub
chown root ~/.ssh/config
chmod 600 ~/.ssh/config
echo "Copy the above key to GITHUB and try ssh -T git@github.com"