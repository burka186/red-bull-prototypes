class TextField{

PFont arialNarrow;
String msg;
int xPos;
int yPos;
int fontSize;
int fontColor;

  public TextField(String inMsg, int x, int y,int fSize,int clr)
  {
    arialNarrow = loadFont("ArialNarrow-48.vlw");
    msg = inMsg;
    xPos = x;
    yPos = y;
    fontSize = fSize;
    fontColor = clr;
  }
  void setMsg(String inMsg)
  {
    msg = inMsg;
  }
  void setFontSize(int size)
  {
    fontSize = size;
  }
  void setFontColor(int clr)
  {
    fontColor = clr;
  }
  void display()
  {
    textFont(arialNarrow,fontSize);
    textAlign(CENTER);
    text(msg,xPos,yPos);
    fill(fontColor);
  } 
}
