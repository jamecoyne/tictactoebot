//global variable to store total number of wins 
int wins = 0;

/*
This program determines every winning game of tic tac toe by essentially 
brute forcing every possible game using recursion.
The next step is to create a tree data structure to represent a path to each winning move
using the "moves" array. As well as determine the number of leaves under each branch, to determine the the move with the most winning solutions.
Furthermore, a gui will be created using processing to allow the player to interact with the game

Finally, this bot also has potential to become more efficient by using a graph data structure to chart similar games, minimizing the size of the data structure.
*/ 


void recursiveTicTacToe(int[] board, int turn, ArrayList moves){
  //boolean value to check if the board is filled
  boolean filled = true;
  
  //loop through though the empty spaces of the board
  for(int i = 0; i < board.length; i++){
      if(board[i] == 0) {
        filled = false;
        int[] newBoard = board.clone();
        ArrayList<Integer> newMoves = new ArrayList<Integer>(moves);
        //set the newboard equal to the turn
        newBoard[i] = turn;
        //add the newest change index
        newMoves.add(i);
        //make another move on that board, by using -turn the game will alternate between the two players
        recursiveTicTacToe(newBoard, -turn, newMoves);
      }
    }
    
    //if the board is all full, check if player 1 has one
    if(filled){
      //check winning logic with a big dumb if statement
      //we only check for one player's wins because checking for both players would generate identical data
      if(
      (board[0] == 1 && board[1] == 1 && board[2] == 1)||
      (board[3] == 1 && board[4] == 1 && board[5] == 1)||
      (board[6] == 1 && board[7] == 1 && board[8] == 1)||
      (board[0] == 1 && board[3] == 1 && board[6] == 1)||
      (board[1] == 1 && board[4] == 1 && board[7] == 1)||
      (board[2] == 1 && board[5] == 1 && board[8] == 1)||
      (board[0] == 1 && board[4] == 1 && board[8] == 1)||
      (board[2] == 1 && board[4] == 1 && board[6] == 1)
      ){
        //if there is a win, output the board, moves, number of wins, and a message for debug purposes
        wins++;
        println(board[0] + " " + board[1] + " " + board[2]);
        println(board[3] + " " + board[4] + " " + board[5]);
        println(board[6] + " " + board[7] + " " + board[8]);
        println(moves.toString());
        println("winning game! " + wins);
        
      }
    }
}

void setup(){
  recursiveTicTacToe(new int[9], 1, new ArrayList<Integer>());
}