


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

PlayerPosition=0
DiceRoll(){
 DiceOutput=$(($(($RANDOM%6))+1))
return $DiceOutput
}
DiceRoll
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


option=$(($(($RANDOM%3))+1))
case $option in
PlayerPosition=0
DiceRoll(){
 DiceOutput=$(($(($RANDOM%6))+1))
return $DiceOutput
}
DiceRoll



function Ladder(){

DiceRoll
DiceOutput=$?
echo dice value is $DiceOutput
case $DiceOutput in
1)PlayerPosition=$(($PlayerPosition+1)) 

        return $PlayerPosition
        ;;
  2) if [$PlayerPosition -eq 99 ]
	then
         return $PlayerPosition
	else
	PlayerPosition=$(($PlayerPosition+2))
       return $PlayerPosition
	fi
        ;;
3) if [ $PlayerPosition -eq 99 ] || [ $PlayerPosition -eq 98 ]
	then
         return $PlayerPosition
	else
	PlayerPosition=$(($PlayerPosition+3))
       return $PlayerPosition
	fi
        ;;
4) if [ $PlayerPosition -eq 99 ] || [$PlayerPosition -eq 98 ] || [ $PlayerPosition -eq 97 ]
	then
         return $PlayerPosition
	else
	PlayerPosition=$(($PlayerPosition+4))
       return $PlayerPosition
	fi
        ;;
5) if [ $PlayerPosition -eq 99 ] || [ $PlayerPosition -eq 98 ] || [ $PlayerPosition -eq 97 ] || [ $PlayerPosition -eq 96 ]
	then
         return $PlayerPosition
	else
	PlayerPosition=$(($PlayerPosition+5))
       return $PlayerPosition
	fi
        ;;
6) if [ $PlayerPosition -eq 99 ] || [ $PlayerPosition -eq 98 ] || [ $PlayerPosition -eq 97 ] || [ $PlayerPosition -eq 96 ] || [ $PlayerPosition -eq 95 ]
	then
         return $PlayerPosition
	else
	PlayerPosition=$(($PlayerPosition+6))
       return $PlayerPosition
	fi
        ;;
esac
}
Ladder

Snake(){
echo

DiceRoll
 DiceOutput=$?
echo dice value is $DiceOutput

   case $option in
     1) if [ $PlayerPosition -eq 0 ]
	then
	return $PlayerPosition
	else
	PlayerPosition=$(($PlayerPosition-1))
	echo
        return $PlayerPosition
	fi
        ;;

     2) if [ $PlayerPosition -eq 1 ] || [ $PlayerPosition -eq 0 ]
	then
         return $PlayerPosition
	else
	PlayerPosition=$(($PlayerPosition-2))
	echo
        return $PlayerPosition
	fi
        ;;

     3) if [ $PlayerPosition -eq 1 ] || [ $PlayerPosition -eq 2 ] || [ $PlayerPosition -eq 0 ]
	then
	echo
	return $PlayerPosition
	else
	PlayerPosition=$(($PlayerPosition-3))
	echo
        return $PlayerPosition
	fi
        ;;

     4) if [ $PlayerPosition -eq 1 ] || [ $PlayerPosition -eq 2 ] || [ $PlayerPosition -eq 3 ] || [ $PlayerPosition -eq 0 ]
	then
	echo
	return $PlayerPosition
	else
	PlayerPosition=$(($PlayerPosition-4))
	echo
        return $PlayerPosition
	fi
        ;;

      5)if [ $PlayerPosition -eq 1 ] || [ $PlayerPosition -eq 2 ] || [ $PlayerPosition -eq 3 ] || [ $PlayerPosition -eq 3 ] || [ $PlayerPosition -eq 0 ]
	then
	echo
	return $PlayerPosition
	else
	PlayerPosition=$(($PlayerPosition-5))
	echo
        return $PlayerPosition
	fi
        ;;

      6)if [ $PlayerPosition -eq 1 ] || [ $PlayerPosition -eq 2 ] || [ $PlayerPosition -eq 3 ] || [ $PlayerPosition -eq 3 ] || [ $PlayerPosition -eq 5 ] || [ $PlayerPosition -eq 0 ]
	then
	echo
	return $PlayerPosition
	else
	PlayerPosition=$(($PlayerPosition-6))
	echo
        return $PlayerPosition
	fi
        ;;

   *) echo error
   esac

}
echo "choose option you want to go lader or snak or no play"
while(($PlayerPosition!=100))
do
echo 1 for No play
echo 2 for ladder
echo 3 for snak
echo enter any option if you want to play again
read option
case $option in


1) echo $PlayerPosition
   ;;


2) PlayerPosition = $(( $PlayerPosition ))
  echo " player position :$PlayerPosition"
   ;;

3) PlayerPosition = $(( $PlayerPosition ))

2) Ladder $PlayerPosition
  echo " player position :$PlayerPosition"
   ;;

3) Snake $PlayerPosition

   echo player position is $PlayerPosition
   ;;
esac


done


