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

$spt = $col - $shp; #Max Start Point on each row

for ($j=0; $j<$num; $j+=$col) {
    $rnd2= int(rand($spt));
    
    do{                       # Jumping to another random row
    $rnd3= int(rand($j));
    }while($rnd3 % $col != 0) ;
   
    $dpt= $rnd3 + $rnd2;
  }

 for ($k=$dpt; $k<($dpt+$shp); $k++) {   #Bulding ship shape
 $cel[$k]= "#"
}

}

Builder();

for ($z=0; $z<=($num-$col); $z+=$col) {
 for($k=0; $k<$col; $k++) {
  print "$cel[$k+$z]";
 }
  print "\n" ;
}







































