module gwen.structures;

enum CursorType : ubyte
{
  Normal =  0,
  Beam =    1,
  SizeNS =  2,
  SizeWE =  3,
  SizeNWSE =4,
  SizeNESW =5,
  SizeAll = 6,
  No =      7,
  Wait =    8,
  Finger =  9,
  Count =   10
}

alias dstring UnicodeString;
alias string String;
alias dchar UnicodeChar;

class Margin
{
  public int top, bottom, left, right;
  this(int left_ = 0, int top_ = 0, int right_ = 0, int bottom_ = 0)
  {
    top = top_;
    bottom = bottom_;
    left = left_;
    right = right_;
  }
  T opBinary(string op)(T rhs) const
  {
    return new Margin(
      mixin("this.left "~op~" rhs.left"),
      mixin("this.top "~op~" rhs.top"),
      mixin("this.right "~op~" rhs.right"),
      mixin("this.bottom "~op~" rhs.bottom")
      );
  }
}

alias Margin Padding;

class Rect
{
  public int x,y,w,h;
  this(int x=0,int y=0,int w=0, int h=0)
  {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }
  T opBinary(string op)(T rhs) const
  {
    return new Rect(
      mixin("this.x "~op~" rhs.x"),
      mixin("this.y "~op~" rhs.y"),
      mixin("this.w "~op~" rhs.w"),
      mixin("this.h "~op~" rhs.h")
      );
  }
}

class Point
{
  public int x,y;
  this(int x=0,int y=0)
  {
    this.x=x;
    this.y=y;
  }
  T opBinary(string op)(T rhs) const
  {
    return new Rect(
      mixin("this.x "~op~" rhs.x"),
      mixin("this.y "~op~" rhs.y"),
      );
  }
}

class HSV
{
  public float h;
  public float s;
  public float v;
}

class Color
{
  public ubyte r,g,b,a;
  this(ubyte r=255,ubyte g=255,ubyte b=255,ubyte a=255)
  {
    this.r=r;
    this.g=g;
    this.b=b;
    this.a=a;
  }
  T opBinary(string op)(T rhs) const
  {
    return new Rect(
      mixin("this.r "~op~" rhs.r"),
      mixin("this.g "~op~" rhs.g"),
      mixin("this.b "~op~" rhs.b"),
      mixin("this.a "~op~" rhs.a")
      );
  }
  T opOpAssign(string op)(T rhs)
  {
    mixin("this.r "~op~"= rhs.r;");
    mixin("this.g "~op~"= rhs.g;");
    mixin("this.b "~op~"= rhs.b;");
    mixin("this.a "~op~"= rhs.a;");
    return this;
  }
}

class DnDPackage
{
public{
  void* userdata;
  bool draggable;
  String name;
  // Controls::Base drawcontrol;
  Point holdoffset;
  this()
  {
    draggable = false;
    holdoffset = new Point(0,0);
  }}
}
