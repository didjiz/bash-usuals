# bash-usuals
Parce que ça me gonfle de refaire ma conf à chaque nouvelle machine.

# La base

```bash
sudo apt-get -y install vim
sudo apt-get -y install git
```


# Changer l'application switcher :
```bash
gnome-shell-extension-prefs `
```

Définir AlternateTab = Oui

# Ajouter les raccourcis 

```bash
cd ~
git clone https://github.com/didjiz/bash-usuals.git
rm .bashrc
ln -s bash-usuals/.bashrc
touch .bashrc_extends
source .bashrc
```
