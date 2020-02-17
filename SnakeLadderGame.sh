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

option=$(($(($RANDOM%3))+1))
case $option in

1) echo $PlayerPosition
   ;;

2) PlayerPosition = $(( $PlayerPosition ))
  echo " player position :$PlayerPosition"
   ;;

3) PlayerPosition = $(( $PlayerPosition ))
   echo player position is $PlayerPosition
   ;;
esac
