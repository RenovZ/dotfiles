day=$(date '+%j')

head -n $day `pwd`/TheOneWidget.widget/solar-system.widget/mercury.txt | tail -n 1
head -n $day `pwd`/TheOneWidget.widget/solar-system.widget/venus.txt | tail -n 1
head -n $day `pwd`/TheOneWidget.widget/solar-system.widget/earth.txt | tail -n 1
head -n $day `pwd`/TheOneWidget.widget/solar-system.widget/mars.txt | tail -n 1
head -n $day `pwd`/TheOneWidget.widget/solar-system.widget/jupiter.txt | tail -n 1
head -n $day `pwd`/TheOneWidget.widget/solar-system.widget/saturn.txt | tail -n 1
head -n $day `pwd`/TheOneWidget.widget/solar-system.widget/uranus.txt | tail -n 1
head -n $day `pwd`/TheOneWidget.widget/solar-system.widget/neptune.txt | tail -n 1