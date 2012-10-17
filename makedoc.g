##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "GAPDoc" );

SetGapDocLaTeXOptions( "utf8" );

bib := ParseBibFiles( "doc/Conley.bib" );
WriteBibXMLextFile( "doc/ConleyBib.xml", bib );

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

PrintTo( "VERSION", PackageInfo( "Conley" )[1].Version );

MakeGAPDocDoc( "doc", "Conley", list, "Conley" );

GAPDocManualLab("Conley");

QUIT;

