LoadPackage( "Conley" );

F2 := HomalgRingOfIntegers( 2 );

phi := DynamicalSystem( [1,2,3], [[3,2],[2,1]], [0,1,1], F2 );

M := MorseDecomposition( phi );

P := UnderlyingPoset( M );
