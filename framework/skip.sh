#This is a script for running your test case
#Removing the old pyc code is always a good idea as it will run the current python code
#Level of the display messages in the increasing order:
#   debug
#   info
#   warning
#   error
#   critical

find testdir -name "*.pyc" -exec rm {} \;
if [ $# = 1 ] ; then
    DEBUG_LEVEL=$1
else
    DEBUG_LEVEL='INFO'
fi
echo ${DEBUG_LEVEL} > debug.txt
python -B src/iontester.py -t skip.cfg -o testreport/result -r testdir/skiptest -n "Example code for conditional skip of a test case" -d -l debug
rm debug.txt