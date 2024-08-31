#! /usr/bin/bash 
  
a=$1
b=$2
ch=$3
res='Error'

case $ch in
  '+')res=`echo $a + $b | bc`
  ;; 
  '-')res=`echo $a - $b | bc`
  ;; 
  'x')res=`echo $a \* $b | bc`
  ;; 
  '/')res=`echo "scale=3; $a / $b" | bc` 
  ;; 
  '^')res=`echo $a ^ $b | bc`
  ;;
  '%')res=`echo $a % $b | bc`
  ;;
esac
echo "Result: $res"