#include <stdio.h>
#include <stdlib.h>
int main( int argc, char ** argv )
{
    int i, l, h;
    if ( argc != 4 )
    {
        fprintf( stderr, "Usage:\n\tnumerator format low high\nexample\n\tnumerator \"ping 192.168.228.%%d\" 0 255\n");
        return 0;
    }
    l = atoi( argv[2] );
    h = atoi( argv[3] );
    for ( i = l; i < h; i++)
    {
        printf( argv[1], i );
        printf( "\n" );
    }
    return 1;
}
