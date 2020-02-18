PositionOfPlayer1=0
PositionOfPlayer2=0
PlayerPosition=0

DiceRoll(){
 DiceOutput=$(($(($RANDOM%6))+1))
return $DiceOutput
}
DiceRoll

function Ladder(){

DiceRoll
DiceOutput=$?
echo ladder dice value is $DiceOutput
case $DiceOutput in
1)PlayerPosition=$(($PlayerPosition+1)) 

        return $PlayerPosition
        ;;
  2) if [ $PlayerPosition -eq 99 ]
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
4) if [ $PlayerPosition -eq 99 ] || [ $PlayerPosition -eq 98 ] || [ $PlayerPosition -eq 97 ]
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
DiceRoll
 DiceOutput=$?
echo snake dice value is $DiceOutput

   case $DiceOutput in
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
Snake

Player1Turn(){
position=$(($RANDOM%3+1))
  case $position in
    1) echo "position Of player1 is $PositionOfPlayer1"
       ;;

    2) Ladder $PositionOfPlayer1
       PositionOfPlayer1=$?
       echo "position of player1 $PositionOfPlayer1"
       ;;

    3) Snake $PositionOfPlayer1
       PositionOfPlayer1=$?
       echo "position of player1 is $PositionOfPlayer1"
       ;;

    *)echo error
  esac 
}
Player1Turn

Player2Turn(){
position=$(($(($RANDOM%3))+1))


  case $position in
   1) echo "position of of player2 $PositionOfPlayer2"
      ;;

   2) Ladder $PositionOfPlayer2
     PositionOfPlayer2=$?
      echo "position of player2 is $PositionOfPlayer2"
      ;;

   3) Snake $PositionOfPlayer2
      PositionOfPlayer2=$?
      echo "position of player2 is $PositionOfPlayer2"
      ;;

    *)echo error
  esac
}
Player2Turn

 Win(){

    if [ $PositionOfPlayer2 -eq 100 ] || [ $PositionOfPlayer1 -eq 100 ]
    then
    echo player1 score : $PositionOfPlayer1 
    echo player2 score : $PositionOfPlayer2 
    
        if(($PositionOfPlayer2==100))
        then
        echo "player 2 wins"
        fi

        if(($PositionOfPlayer1==100))
        then
        echo "player 1 wins"
        fi

       exit
    fi
}
Win
play=1
while(($play!=0))
do
Player1Turn
Win
Player2Turn
Win
done
