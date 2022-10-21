#Les actions de ce script doivent être réalisées en root (en utilisant su)

#Créer les users Merry & Pippin
sudo adduser --force-badname Merry && sudo adduser --force-badname Pippin
echo "Merry:kalimac" | sudo chpasswd
echo "Pippin:secondbreakfast" | sudo chpasswd 

#En étant en root, installer le paquet sudo
apt install sudo
#Les fichiers conf seront récupérés avec git, installer le paquet GIT
sudo apt install git
#Installer le paquet proftpd
sudo apt install proftpd-*

#Mettre à jour les paquets
apt-get update && apt-get upgrade

#Cloner le dossier GIT afin de récupérer les fichiers de configuration
git clone https://github.com/tara-lecoz/FTP.git

#Se déplacer dans /etc afin de cloner le dossier FTP pour récupérer les fichiers .conf
cd /etc

#Récupérer les dossiers de configuration et les remplacer dans ceux installés
mv /etc/FTP/proftpd.conf /etc/proftpd/proftpd.conf
mv /etc/FTP/tls.conf /etc/proftpd/tls.conf
mv /etc/FTP/modules.conf /etc/proftpd/modules.conf

#Installer le paquet openssl
sudo apt install openssl

#Créer un dossier ssl
mkdir /etc/proftpd/ssl

#Générer des clés ssl
sudo echo -en "\n\n\n\n\n\n\n" | openssl req -new -x509 -days 365 -nodes -out /etc/proftpd/ssl/proftpd_rsa.pem -keyout /etc/proftpd/ssl/proftpd_key.pem

#Modifier les droits de la clé proftpd.key.pem
chmod 600 /etc/proftpd/ssl/proftpd_key.pem

#Redémarrer le système 
sudo systemctl restart
