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

2) Ladder $PlayerPosition
  echo " player position :$PlayerPosition"
   ;;

3) Snake $PlayerPosition
   echo player position is $PlayerPosition
   ;;
esac

done

