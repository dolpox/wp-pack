#!/bin/bash  
echo 'Downloading packages...'
composer install
echo 'Done.'

echo 'Enter project name: '
read PROJECT

PROJECT=${PROJECT//[^a-zA-Z0-9]/-}
mv my-project $PROJECT

THEME_PATH=$PROJECT/wp-content/themes

echo 'Enter theme name: '
read THEME

THEME=${THEME//[^a-zA-Z0-9]/-}
mv $THEME_PATH/sage $THEME_PATH/$THEME

echo 'Downloading npm packages...'
cd $THEME_PATH/$THEME/
npm install g

echo 'Installing bower packages'
bower install

echo 'Done.'

cat << "EOF"
               _                                   
              | |                                  
 __      _____| |__   ___  _ __   __ _  __ _  __ _ 
 \ \ /\ / / _ \ '_ \ / _ \| '_ \ / _` |/ _` |/ _` |
  \ V  V /  __/ |_) | (_) | | | | (_| | (_| | (_| |
   \_/\_/ \___|_.__/ \___/|_| |_|\__, |\__, |\__,_|
                                  __/ | __/ |      
                                 |___/ |___/       

EOF
