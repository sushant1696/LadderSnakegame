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