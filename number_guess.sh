#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"
MIN=1
MAX=10 
RANDOM_NUMBER=$(( $RANDOM % (MAX - MIN + 1) + MIN ))
echo $RANDOM_NUMBER