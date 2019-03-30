#############################################################################
##
##  DynamicalSystems.gi            Conley package            Mohamed Barakat
##
##  Copyright 2009, Mohamed Barakat, Universität des Saarlandes
##
##  Implementations of procedures for dynamical systems.
##
#############################################################################

####################################
#
# representations:
#
####################################

# a new representation for the GAP-category IsDynamicalSystem:

##  <#GAPDoc Label="IsDynamicalSystemRep">
##  <ManSection>
##    <Filt Type="Representation" Arg="P" Name="IsDynamicalSystemRep"/>
##    <Returns>true or false</Returns>
##    <Description>
##      The representation of dynamical systems. <P/>
##      (It is a representation of the &GAP; category <Ref Filt="IsDynamicalSystem"/>.)
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareRepresentation( "IsDynamicalSystemRep",
        IsDynamicalSystem,
        [ "Morse_decompositions" ] );

####################################
#
# families and types:
#
####################################

# a new family:
BindGlobal( "TheFamilyOfDynamicalSystems",
        NewFamily( "TheFamilyOfDynamicalSystems" ) );

# a new type:
BindGlobal( "TheTypeDynamicalSystem",
        NewType( TheFamilyOfDynamicalSystems,
                IsDynamicalSystemRep ) );

####################################
#
# methods for operations:
#
####################################

##  <#GAPDoc Label="MorseDecomposition">
##  <ManSection>
##    <Oper Arg="phi" Name="MorseDecomposition" Label="for dynamical systems"/>
##    <Returns>a Morse decomposition</Returns>
##    <Description>
##      The default Morse decomposition of the dynamical system <A>phi</A>.
##      <Example><![CDATA[
##  gap> F2 := HomalgRingOfIntegers( 2 );
##  GF(2)
##  gap> phi := DynamicalSystem( [1,2,3], [[3,2],[2,1]], [0,1,1], F2 );
##  <A dynamical system given by <A Morse decomposition with 3 Morse sets>>
##  gap> M := MorseDecomposition( phi );
##  <A Morse decomposition with 3 Morse sets>
##  ]]></Example>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
InstallMethod( MorseDecomposition,
        "for Morse decompositions",
        [ IsDynamicalSystem ],
        
  function( phi )
    local l, p;
    l := phi!.Morse_decompositions.ListOfPositionsOfMorseDecompositions;
    
    p := phi!.Morse_decompositions.PositionOfTheDefaultMorseDecomposition;
    
    return phi!.Morse_decompositions.(String( l[p] ));
    
end );

####################################
#
# constructor functions and methods:
#
####################################

##  <#GAPDoc Label="DynamicalSystem">
##  <ManSection>
##    <Oper Arg="M" Name="DynamicalSystem" Label="constructor for dynamical systems from a Morse decomposition"/>
##    <Oper Arg="P, CHp, R" Name="DynamicalSystem" Label="constructor for dynamical systems from a poset and a list of Conley indices"/>
##    <Oper Arg="P, rel, CHp, R" Name="DynamicalSystem" Label="constructor for dynamical systems from a set, defining relations of a partial order, and a list of Conley indices"/>
##    <Returns>a dynamical system</Returns>
##    <Description>
##      A dynamical system with Morse decomposition <A>M</A> (consisting of an underlying poset <A>P</A> with partial order > given by
##      <A>rel</A> and a list of Conley indices <A>CHp</A> over the coefficient ring <A>R</A>).
##      <Example><![CDATA[
##  gap> F2 := HomalgRingOfIntegers( 2 );
##  GF(2)
##  gap> phi := DynamicalSystem( [3,2,1], [[3,2],[2,1]], [0,1,1], F2 );
##  <A dynamical system given by <A Morse decomposition with 3 Morse sets>>
##  ]]></Example>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
InstallMethod( DynamicalSystem,
        "for Morse decompositions",
        [ IsMorseDecomposition ],
        
  function( M )
    local morse, dynsys;
    
    morse := rec( ListOfPositionsOfMorseDecompositions := [ 1 ],
                  PositionOfTheDefaultMorseDecomposition := 1,
                  1 := M );
    
    dynsys := rec( Morse_decompositions := morse );
    
    ObjectifyWithAttributes(
            dynsys, TheTypeDynamicalSystem
            );
    
    return dynsys;
    
end );

##
InstallMethod( DynamicalSystem,
        "for posets",
        [ IsInGapCategoryOfPosets, IsList, IsHomalgRing ],
        
  function( P, CHp, R )
    
    return DynamicalSystem( MorseDecomposition( P, CHp, R ) );
    
end );

##
InstallMethod( DynamicalSystem,
        "for posets",
        [ IsList, IsList, IsList, IsHomalgRing ],
        
  function( P, rel, CHp, R )
    
    return DynamicalSystem( Poset( P, rel ), CHp, R );
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewObj,
        "for dynamical systems",
        [ IsDynamicalSystem ],
        
  function( phi )
    
    Print( "<A dynamical system given by " );
    ViewObj( MorseDecomposition( phi ) );
    Print( ">" );
    
end );

##
InstallMethod( Display,
        "for dynamical systems",
        [ IsDynamicalSystem ],
        
  function( phi )
    
end );
