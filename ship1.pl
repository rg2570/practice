#!/usr/bin/perl

$col=10;
$row=10;
$num=$col * $row;

$shp=4; #The length of the ship

$drc=0; # Direction : 0=horizontal / 1=vertical

for ($i=1; $i<=$num; $i++) {
 $cel[$i-1] = "~" ;     #Bulding the waves!
}



sub Builder{
$spt = $row - $shp + 1 ; # Max start point on eache column

$rnd2=int(rand($spt*$col));

for ($k=1; $k<=$shp; $k++){
 $rnd2+=$col;
 $cel[$rnd2]="#"
}
}


Builder();

for ($z=0; $z<=($num-$col); $z+=$col) {
 for($k=0; $k<$col; $k++) {
  print "$cel[$k+$z]";
 }
  print "\n" ;
}







































