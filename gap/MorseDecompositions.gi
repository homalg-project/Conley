##########################################################################
##
##  MorseDecompositions.gi         Conley package         Mohamed Barakat
##
##  Copyright 2009, Mohamed Barakat, Universität des Saarlandes
##
##  Implementations of procedures for Morse decompositions.
##
#############################################################################

####################################
#
# representations:
#
####################################

# a new representation for the GAP-category IsMorseDecomposition:

##  <#GAPDoc Label="IsMorseDecompositionRep">
##  <ManSection>
##    <Filt Type="Representation" Arg="P" Name="IsMorseDecompositionRep"/>
##    <Returns>true or false</Returns>
##    <Description>
##      The representation of Morse decompositions. <P/>
##      (It is a representation of the &GAP; category <Ref Filt="IsMorseDecomposition"/>.)
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareRepresentation( "IsMorseDecompositionRep",
        IsMorseDecomposition,
        [ "poset", "Conley_indices", "coefficient_ring" ] );

####################################
#
# families and types:
#
####################################

# a new family:
BindGlobal( "TheFamilyOfMorseDecompositions",
        NewFamily( "TheFamilyOfMorseDecompositions" ) );

# a new type:
BindGlobal( "TheTypeMorseDecomposition",
        NewType( TheFamilyOfMorseDecompositions,
                IsMorseDecompositionRep ) );

####################################
#
# methods for attributes:
#
####################################

##  <#GAPDoc Label="Length:MorseDecomp">
##  <ManSection>
##    <Attr Arg="M" Name="Length" Label="for Morse decompositions"/>
##    <Returns>a nonnegative integer</Returns>
##    <Description>
##      The cardinality of set underlying the Morse decomposition <A>M</A>.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
InstallMethod( Length,
        "for Morse decompositions",
        [ IsMorseDecomposition ],
        
  function( M )
    
    return Length( UnderlyingPoset( M ) );
    
end );

####################################
#
# methods for operations:
#
####################################

##  <#GAPDoc Label="UnderlyingPoset">
##  <ManSection>
##    <Oper Arg="M" Name="UnderlyingPoset" Label="for Morse decompositions"/>
##    <Returns>a list</Returns>
##    <Description>
##      The poset underlying the Morse decomposition <A>M</A>.
##      <Example><![CDATA[
##  gap> P := Poset( [1,2,3], [[3,2],[2,1]] );
##  <A poset on 3 points>
##  gap> F2 := HomalgRingOfIntegers( 2 );
##  GF(2)
##  gap> M := MorseDecomposition( P, [0,1,1], F2 );
##  <A Morse decomposition with 3 Morse sets>
##  gap> UnderlyingPoset( M );
##  <A poset on 3 points>
##  ]]></Example>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
InstallMethod( UnderlyingPoset,
        "for Morse decompositions",
        [ IsMorseDecomposition ],
        
  function( M )
    
    return M!.poset;
    
end );

##  <#GAPDoc Label="HomologyConleyIndices">
##  <ManSection>
##    <Oper Arg="M" Name="HomologyConleyIndices" Label="for Morse decompositions"/>
##    <Returns>a list</Returns>
##    <Description>
##      The list of homology Conley indices of the Morse decomposition <A>M</A>.
##      <Example><![CDATA[
##  gap> P := Poset( [1,2,3], [[3,2],[2,1]] );
##  <A poset on 3 points>
##  gap> F2 := HomalgRingOfIntegers( 2 );
##  GF(2)
##  gap> M := MorseDecomposition( P, [0,1,1], F2 );
##  <A Morse decomposition with 3 Morse sets>
##  gap> HomologyConleyIndices( M );
##  [ <The zero left vector space>,
##    <The left vector space of dimension 1 on a free generator>,
##    <The left vector space of dimension 1 on a free generator> ]
##  ]]></Example>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
InstallMethod( HomologyConleyIndices,
        "for Morse decompositions",
        [ IsMorseDecomposition ],
        
  function( M )
    
    return M!.Conley_indices;
    
end );

####################################
#
# constructor functions and methods:
#
####################################

##  <#GAPDoc Label="MorseDecomposition:constructor">
##  <ManSection>
##    <Oper Arg="P, CHp, R" Name="MorseDecomposition" Label="constructor for Morse decompositions"/>
##    <Returns>a Morse decomposition</Returns>
##    <Description>
##      A Morse decomposition consisting of a poset <A>P</A> and a list of homology Conley indicies <A>CHp</A>
##      defined over the coefficient ring <A>R</A>.
##      <Example><![CDATA[
##  gap> P := Poset( [1,2,3], [[3,2],[2,1]] );
##  <A poset on 3 points>
##  gap> F2 := HomalgRingOfIntegers( 2 );
##  GF(2)
##  gap> M := MorseDecomposition( P, [0,1,1], F2 );
##  <A Morse decomposition with 3 Morse sets>
##  ]]></Example>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
InstallMethod( MorseDecomposition,
        "for posets",
        [ IsInGapCategoryOfPosets, IsList, IsHomalgRing ],
        
  function( P, _CHp, R )
    local CHp, morse;
    
    CHp := List( _CHp,
                 function( a )
                   if IsInt( a ) then
                       return a * R;
                   elif IsHomalgMatrix( a ) then
                       return LeftPresentation( a );
                   elif IsHomalgModule( a ) then
                       return a;
                   else
                       Error( "the second argument has a wrong syntax\n" );
                   fi;
                 end
           );
    
    morse := rec( poset := P, Conley_indices := CHp, coefficient_ring := R );
    
    ObjectifyWithAttributes(
            morse, TheTypeMorseDecomposition
            );
    
    return morse;
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewObj,
        "for Morse decompositions",
        [ IsMorseDecomposition ],
        
  function( M )
    
    Print( "<A Morse decomposition with ", Length( M ), " Morse sets>" );
    
end );

##
InstallMethod( Display,
        "for Morse decompositions",
        [ IsMorseDecomposition ],
        
  function( M )
    local poset;
    
    poset := UnderlyingPoset( M );
    
    Print( "A Morse decomposition with underlying set:\n", UnderlyingSetOfPoset( poset ) );
    Print( ",\n\nhomology Conley indices:\n", HomologyConleyIndices( M ), "\n" );
    Print( ",\n\nand partial order:\n", PartialOrder( poset ), "\n" );
    
end );
