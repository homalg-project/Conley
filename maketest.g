##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "Conley" );

LoadPackage( "GaussForHomalg" );

LoadPackage( "GAPDoc" );

list := [
         "../gap/Conley.gd",
         "../gap/Conley.gi",
         "../gap/Posets.gd",
         "../gap/Posets.gi",
         "../gap/MorseDecompositions.gd",
         "../gap/MorseDecompositions.gi",
         "../gap/DynamicalSystems.gd",
         "../gap/DynamicalSystems.gi",
         "../examples/Franzosa.g"
         ];

TestManualExamples( "doc", "Conley.xml", list );

GAPDocManualLab("Conley");

quit;

