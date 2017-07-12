# bash-usuals
Parce que ça me gonfle de refaire ma conf à chaque nouvelle machine.

### Installations standards

```bash
sudo apt-get -y install vim
sudo apt-get -y install git
sudo apt-get -y install composer 
```

### Phpstorm

```bash
wget http://download.jetbrains.com/webide/PhpStorm-9.0.3.tar.gz
```

Si lien KO : https://confluence.jetbrains.com/display/PhpStorm/Previous+PhpStorm+Releases (v9 working)

Licence : https://gist.github.com/esilvajr/e3440020ce17e95f56bd

Si JDK non installé :

```bash
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
```

### Git

```bash
git config --global user.name "M.Gilles"
git config --global user.email "-- Replace this --"
git config --global core.editor vim
```

Se souvenir de la passphrase : http://stackoverflow.com/questions/10032461/git-keeps-asking-me-for-my-ssh-key-passphrase#answer-10032655


### Changer l'application switcher :
```bash
gnome-shell-extension-prefs 
```

Définir AlternateTab = Oui

### Ajouter ma config 

```bash
cd ~
git clone https://github.com/didjiz/bash-usuals.git
mv .bashrc .bashrc_native
ln -s bash-usuals/.bashrc .bashrc
touch .bashrc_extends
source .bashrc
rm -f .vimrc
ln -s bash-usuals/.vimrc .vimrc
git config --global include.path ~/bash-usuals/.gitconfig_global_include
ln -s bash-usuals/.gitignore_global .gitignore_global
```

### Mysql

```bash
sudo apt-get install -y mysql-workbench
```
