#!/bin/bash
vim="$HOME/.vimrc"                                #1
zsh="$HOME/.zshrc"                                #2
bash="$HOME/.bashrc"                              #3
tmux="$HOME/.tmux.conf"                           #4
lvm="$HOME/.config/lvim/config.lua"               #5
terminale="$HOME/.config/terminator/config"       #6
comando="$HOME/copia.sh"                          #7
comandoOneDrive="$HOME/salva.sh"                  #8

# if [ ! -d "$HOME/Documenti" ]
# then
#   echo "cartella Documenti NON raggiungibile... intervenire!"
#   exit 1
# fi
fCopia()
{
  mkdir $destinazione
  for x in "${elenco[@]}" 
  do
    cp $x $destinazione
    echo "copiato il fle $x ..."
    sleep 1
  done
  cd $destinazione
  ls -a
  sleep 1
  find . -iname ".*" -type f -exec realpath {} \; | rename 's/\.(.*)/$1/'
  sleep 2
  echo
  clear
  for file in $(ls *)
  do
    echo "abbiamo copiato il file:...................... $file"
    sleep 1
  done
  echo "------------------------------------------------------------------------"
  sleep 3
  echo "il processo ha generato ${#elenco[@]} elementi"
  echo "------------------------------------------------------------------------"
  echo
  sleep 1
  echo "procedura eseguita con successo!"
  echo "ho copiato i files richiesti nella cartella $destinazione"
}

# funzeone di copia nella cartella DOCUMENTI 
fCopiaInDocumenti ()
{
local destinazione="$HOME/Documenti/configFile/"
clear
echo "inizio procedura cartella INTERNA..."
sleep 5
echo "inizio la procedura di salvataggio dei file config..."
echo "lavoro sulla cartella $destinazione"
sleep 3

#Ciclo sull'array dei files da salvare e li metto nella cartella appena creata
if [ -d $destinazione ]
then
  sleep 3
  echo "cartella già presente...eliminarla prima di procedere..."
  read -n 1 -s -p "vuoi cancellare la cartella? [y/n] " risposta
  if [[ "$risposta" == y ]] 
  then
    rm -rf $destinazione
    sleep 1
    clear
    echo "ho cancellato la cartella $destinazione"
    echo "proseguo con la creazione della NUOVA cartella"
    sleep 1
    fCopia
  else
    clear
    echo "NON eseguo la procedura..."
  fi 
else
  echo "cartella NON presente... la creo!"
  sleep 2
  fCopia

fi
}




# funzione di copia nella cartella esterna DATI
fCopiaInDati ()
{
clear
echo "inizio procedura cartella ESTERNA..."
sleep 5
local destinazione="/media/andrea/DATI/configFile"
if [ ! -d "/media/andrea/DATI/" ]
then
  echo "cartella Documenti NON raggiungibile... intervenire!"
  exit 1
fi

echo "inizio la procedura di salvataggio dei file config..."
echo "lavoro sulla cartella $destinazione"
sleep 3
#Ciclo sull'array dei files da salvare e li metto nella cartella appena creata
if [ -d $destinazione ]
then
  echo "cartella già presente...eliminarla prima di procedere..."
  read -n 1 -s -p "vuoi cancellare la cartella? [y/n] " risposta
  if [[ "$risposta" == y ]] 
  then
    rm -rf $destinazione
    sleep 1
    clear
    echo "ho cancellato la cartella $destinazione"
    echo "proseguo con la creazione della NUOVA cartella"
    sleep 1
    fCopia
  else
    clear
    echo "NON eseguo la procedura..."
  fi 
else
  echo "cartella NON presente... la creo!"
  sleep 2
  fCopia
fi
}


# array dei file da copiare nella cartella di salvataggio
elenco=(
  $vim
  $zsh 
  $bash 
  $tmux 
  $lvm 
  $terminale 
  $comando
  $comandoOneDrive
)

fCopiaInDocumenti


fCopiaInDati
