
#include <stdio.h>

extern void say_hello();

//void say_hello()
//{
//  printf( "Hello from C!" );
//}

int main( int argc, const char* argv[] )
{
  printf("Hello! \n");
  
  say_hello();

  return 1;
}