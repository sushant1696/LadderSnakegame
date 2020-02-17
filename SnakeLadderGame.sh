
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

DiceOutput=$(($RANDOM%6))
return $DiceOutput
}
RollDice
echo "dice out put is $DiceOutput"

PlayerPosition=0
RollDice(){
DiceOutput=$((($RANDOM%6)+1))
return $DiceOutput
}
RollDice
echo "dice output is $DiceOutput

echo 1 for No play
echo 2 for ladder
echo 3 for snak
echo "you choose option $option"
read option
case $option in
1)echo "player not play game,player position 0"
;;
2)PlayerPosition=$(( $PlayerPosition+$DiceOutput ))
echo "player in position :$PlayerPosition"
;;
3)PlayerPosition=$(( $PlayerPosition-$DiceOutput ))
echo "player position is $PlayerPosition"
;;
esac

