#Les actions de ce script doivent être effectuées en root

#Supprimer les clés
rm /etc/proftpd/ssl/proftpd_key.pem
rm /etc/proftpd/ssl/proftpd_rsa.pem

#Restaurer les valeurs de départ de la machine virtuelle
apt-get remove proftpd-*
apt-get purge proftpd-*
