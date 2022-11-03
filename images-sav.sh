#!/bin/bash
echo 'Sauvegarde des images en cours...'
docker save fredmdebian > sav/fredmdebian.tar
docker save netdata > sav/netdata.tar
docker save mysql > sav/mysql.tar
docker save prestashop > sav/prestashop.tar
ls -al sav




