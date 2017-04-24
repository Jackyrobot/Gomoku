int xSize = 20;
int ySize = 20;
int gridSize = 50; 
int[][]board = new int [ySize][xSize]; //2D array creating the gameboard
int player = 1; 

void setup() 
{
  size(950,950); 
  ellipseMode(CORNER); 
}
int piece(int y, int x) 
{   
    return board[y][x];
}
int getWinner() //determine winner if 5 in a row vert, horizontal, or diagonal
{ 
  //check row 
  for(int y = 0; y < ySize; y++)
    for(int x = 0; x < xSize; x++)
      if (piece(y,x) !=0 && piece(y,x) == piece(y,x+1) 
                     && piece(y,x) == piece(y,x+2)
                     && piece(y,x) == piece(y,x+3)
                     && piece(y,x) == piece(y,x+4))
         return piece(y,x);  

  // check column
  for(int y = 0; y < ySize; y++)
    for(int x = 0; x < xSize; x++)
      if(piece(y,x) !=0 && piece(y,x)==piece(y+1,x) 
                    && piece(y,x)==piece(y+2,x)
                    &&piece(y,x)==piece(y+3,x)
                    && piece(y,x)==piece(y+4,x))
         return piece(y,x); 
    
  // check diagonal
  for(int y = 0; y < ySize; y++)
    for(int x = 0; x < xSize; x++) 
      for (int d = -1; d <= 1; d+=2)
         if(piece(y,x) !=0  && piece(y,x) == piece(y+1*d,x+1) 
                      && piece(y,x) == piece(y+2*d,x+2) 
                      && piece(y,x) == piece(y+3*d,x+3) 
                      && piece(y,x) == piece(y+4*d,x+4))
          return piece(y,x);   
    
  //check tie
  for(int y = 0; y < ySize; y++)
    for(int x=0; x < xSize; x++)
      if (piece(y,x)==0) 
        return 0; //winner 
      return -1; // tie
}
void mousePressed()
{
  int x = mouseX/gridSize;
  int y = mouseY/gridSize; 
  if(y >= 0)
  {
    board[y][x] = player; 
    if(player == 1)
      player = 2;
    else
      player = 1;
 }
}
void draw() 
{
  if(getWinner() ==0){
    for(int j = 0; j < ySize; j++) 
       for(int i = 0; i < xSize; i++){  
         fill(182, 155, 76); //wood color
         rect(i * gridSize, j * gridSize, gridSize, gridSize); // create lines as graphics for gameboard

  if(board [j][i] > 0)
    {
     if(board[j][i] == 1)
       fill(255);
     else
       fill(0);
     ellipse (i * gridSize, j * gridSize, gridSize, gridSize);
     }
    }
  } 
  else // end game
   {
    background(255); 
    fill(0);  
    if(getWinner() == 1)
    {
      textSize(60);
      text("White Wins!!!", width/2-130, height/2);
    }
    if(getWinner() == 2)
    {
      textSize(60);
      text("Black Wins!!!", width/2-130, height/2);
    }
    if(getWinner() == -1)
    {
       textSize(60);
       text("Tie :(", width/2, height/2);
    }
   if(keyPressed && key == ' ') //function to restart game
   {
      player = 1;
      for(int y = 0; y < ySize; y++)
        for(int x= 0 ; x < xSize; x++) 
          board [y][x] = 0; 
   }
 }
}
