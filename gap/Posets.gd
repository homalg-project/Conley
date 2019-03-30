#############################################################################
##
##  Posets.gd                      Conley package            Mohamed Barakat
##
##  Copyright 2009, Mohamed Barakat, Universität des Saarlandes
##
##  Declarations of procedures for posets.
##
#############################################################################

####################################
#
# categories:
#
####################################

# a new GAP-category:

##  <#GAPDoc Label="IsInGapCategoryOfPosets">
##  <ManSection>
##    <Filt Type="Category" Arg="A" Name="IsInGapCategoryOfPosets"/>
##    <Returns>true or false</Returns>
##    <Description>
##      The &GAP; category of posets.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareCategory( "IsInGapCategoryOfPosets",
        IsAttributeStoringRep );

####################################
#
# attributes:
#
####################################

##  <#GAPDoc Label="Length:poset">
##  <ManSection>
##    <Attr Arg="P" Name="Length" Label="for posets"/>
##    <Returns>a nonnegative integer</Returns>
##    <Description>
##      The cardinality of set underlying the poset <A>P</A>.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "Length",
        IsInGapCategoryOfPosets );

####################################
#
# global functions and operations:
#
####################################

# constructors:

DeclareOperation( "Poset",
        [ IsList, IsList ] );

# basic operations:

DeclareAttribute( "UnderlyingSetOfPoset",
        IsInGapCategoryOfPosets );

DeclareOperation( "PartialOrder",
        [ IsInGapCategoryOfPosets ] );

