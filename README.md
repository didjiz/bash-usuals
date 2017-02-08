# bash-usuals
Parce que ça me gonfle de refaire ma conf à chaque nouvelle machine.

### Installations

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

### Git

```bash
git config --global user.name "M.Gilles"
git config --global user.email "-- Replace this --"
git config --global core.editor vim
```

Se souvenir de la passphrase : http://stackoverflow.com/questions/10032461/git-keeps-asking-me-for-my-ssh-key-passphrase#answer-10032655


### Changer l'application switcher :
```bash
gnome-shell-extension-prefs `
```

Définir AlternateTab = Oui

### Ajouter ma config 

```bash
cd ~
git clone https://github.com/didjiz/bash-usuals.git
rm .bashrc
ln -s bash-usuals/.bashrc
touch .bashrc_extends
source .bashrc
```
