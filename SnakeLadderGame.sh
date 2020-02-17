count=0
count2=0
PositionOf1stUser=0
PositionOf2ndUser=0
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
userTurn1(){
position=$(($RANDOM%3+1))
echo option check for user 1 is :$position

#cash of ching option is start from here
  case $position in
    1) echo "position : $PositionOf1stUser"
       ;;

    2) Ladder $PositionOf1stUser
       PositionOf1stUser=$?
       echo "position : $PositionOf1stUser"
       ;;

    3) Snake $PositionOf1stUser
       PositionOf1stUser=$?
       echo "position : $PositionOf1stUser"
       ;;

    *)echo error
  esac
  count=$(($count+1))

}
userTurn1
userTurn2(){
position=$(($RANDOM%3+1))
echo option for 2nd user is : $position

#case is starting for here
  case $position in
   1) echo "position : $PositionOf2ndUser"
      ;;

   2) Ladder $PositionOf2ndUser
      PositionOf2ndUser=$?
      echo "position : $PositionOf2ndUser"
      ;;

   3) Snake $PositionOf2ndUser
      PositionOf2ndUser=$?
      echo "position : $PositionOf2ndUser"
      ;;

    *)echo error
  esac
  count2=$(($count2+1))
}
 win(){

    if [ $PositionOf2ndUser -eq 100 ] || [ $PositionOf1stUser -eq 100 ]
    then
    echo User one score : $PositionOf1stUser 
    echo User two score : $PositionOf2ndUser 
    
        if(($PositionOf2ndUser==100))
        then
        echo user 2 wins
        fi

        if(($PositionOf1stUser==100))
        then
        echo user 1 wins
        fi

       exit 
    fi
}
Win