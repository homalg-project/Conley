#############################################################################
##
##  DynamicalSystems.gd            Conley package            Mohamed Barakat
##
##  Copyright 2009, Mohamed Barakat, Universität des Saarlandes
##
##  Declarations of procedures for dynamical systems.
##
#############################################################################

####################################
#
# categories:
#
####################################

# a new GAP-category:

##  <#GAPDoc Label="IsDynamicalSystem">
##  <ManSection>
##    <Filt Type="Category" Arg="A" Name="IsDynamicalSystem"/>
##    <Returns>true or false</Returns>
##    <Description>
##      The &GAP; category of dynamical systems.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareCategory( "IsDynamicalSystem",
        IsAttributeStoringRep );

####################################
#
# global functions and operations:
#
####################################

# constructors:

DeclareOperation( "DynamicalSystem",
        [ IsMorseDecomposition ] );

DeclareOperation( "DynamicalSystem",
        [ IsPoset, IsList, IsHomalgRing ] );

DeclareOperation( "DynamicalSystem",
        [ IsList, IsList, IsList, IsHomalgRing ] );

# basic operations:

DeclareOperation( "MorseDecomposition",
        [ IsDynamicalSystem ] );

