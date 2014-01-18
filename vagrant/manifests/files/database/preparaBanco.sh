#!/bin/bash
###########
# Prepara o Banco de dados na máquina virtual, criando um usuário, se não existir e um banco de dados do mesmo nome se não existir
# Recebe como parâmetros um nome, que sera o nome do banco e do usuario e uma senha
###########
if [ "$1" ] ; then
    export usuario="$1"
fi
export senha=$usuario
if [ "$2" ] ; then
    export senha="$2"
fi

sql1="select count(1) from pg_catalog.pg_database where datname = '$usuario';"
sql2="CREATE DATABASE $usuario WITH OWNER $usuario ENCODING 'utf8' TEMPLATE template0;"
sql3="SELECT count(1) FROM pg_user WHERE usename = '$usuario';"
sql4="CREATE USER $usuario WITH PASSWORD '$senha';"

cmd="psql -t -c \"$sql3\""

user_exists=`eval $cmd`

if [ $user_exists -eq 0 ] ; then
    cmd="psql -t -c \"$sql4\" > /dev/null 2>&1"
    eval $cmd
fi

cmd="psql -t -c \"$sql1\""
db_exists=`eval $cmd`

if [ $db_exists -eq 0 ] ; then
    cmd="psql -t -c \"$sql2\" > /dev/null 2>&1"
    eval $cmd
fi

exit 0
