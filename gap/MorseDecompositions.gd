#############################################################################
##
##  MorseDecompositions.gd         Conley package            Mohamed Barakat
##
##  Copyright 2009, Mohamed Barakat, Universität des Saarlandes
##
##  Declarations of procedures for Morse decompositions.
##
#############################################################################

####################################
#
# categories:
#
####################################

# a new GAP-category:

##  <#GAPDoc Label="IsMorseDecomposition">
##  <ManSection>
##    <Filt Type="Category" Arg="A" Name="IsMorseDecomposition"/>
##    <Returns>true or false</Returns>
##    <Description>
##      The &GAP; category of Morse decompositions.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareCategory( "IsMorseDecomposition",
        IsAttributeStoringRep );

####################################
#
# attributes:
#
####################################

DeclareAttribute( "Length",
        IsMorseDecomposition );

####################################
#
# global functions and operations:
#
####################################

# constructors:

DeclareOperation( "MorseDecomposition",
        [ IsPoset, IsList, IsHomalgRing ] );

# basic operations:

DeclareOperation( "UnderlyingPoset",
        [ IsMorseDecomposition ] );

DeclareOperation( "HomologyConleyIndices",
        [ IsMorseDecomposition ] );

