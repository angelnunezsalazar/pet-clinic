#!/bin/bash
pip install -U robotframework-pabot
robotenv=$(env  | grep robotenv | grep -oe '[^=]*$')
testtarget=$(env  | grep testtarget | grep -oe '[^=]*$')
echo "**Setup testing parameter for $robotenv**"
echo "**Test Target: $testtarget**"
echo "Calling script to create virtual display"
chmod +x src/test/selenium-robot/Xvfb.sh
sh src/test/selenium-robot/Xvfb.sh start
cd src/test/selenium-robot
export DISPLAY=:99
echo "Result-Start"
pabot "PetclinicTestCases"
echo "Result-End"
