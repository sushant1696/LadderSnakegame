#!bin/bash
declare -A board
InitBoard(){
a=1
for((i=1;i<=10;i++))
do
    if((i%2!=0))
    then
    for((j=1;j<=10;j++))
    do
         board[$i,$j]=$a
          a=$(( $a+1 ))
     done

         else
         for((j=10;j>0;j--))
         do
         board[$i,$j]=$a
         a=$(( $a+1 ))
         done
fi
done
}
InitBoard

PrintBoard(){
echo "------------------------------------------"
for((i=1;i<=10;i++))
do
for((j=1;j<=10;j++))
do
printf "| $((board[$i,$j]))"
done
printf "| \n"
echo "------------------------------------------"
done
}
PrintBoard


