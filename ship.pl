#!/usr/bin/perl

$col=10;
$row=10;
$num=$col * $row;

$shph=int(rand(4)) + 3; #The length of the ship horizontal
$shpv=int(rand(4)) +3; #Length of vertical ship

$drc=0; # Direction : 0=horizontal / 1=vertical

for ($i=1; $i<=$num; $i++) {
 $cel[$i-1] = "~ " ;     #Bulding the waves!
}


sub HBuilder{

$spt = $col - $shph; #Max Start Point on each row

for ($j=0; $j<$num; $j+=$col) {
    $rnd2= int(rand($spt));
    
    do{                       # Jumping to another random row
    $rnd3= int(rand($j));
    }while($rnd3 % $col != 0) ;
   
    $dpt= $rnd3 + $rnd2;      #Draw Point
  }

 for ($k=$dpt; $k<($dpt+$shph); $k++) {   #Bulding ship shape
 $cel[$k]= "# "
}

}


sub VBuilder{
	$spt = $row - $shpv + 1 ; # Max start point on eache column


	my @pnt;
	my $fnd ;
	$lnt = @pnt ;
	while( 1 ) { 
		$rnd2=int(rand($spt*$col));
		$i = 0;
		for ($i=0; $i<$shpv; $i++) {
	 		$fnd = $rnd2 + $col*$i ;
			if ($cel[$fnd] eq "~ "){
				$pnt[$i] = $fnd ;
			}else{
				last ; 
	 		}
		}
		
		if( $i == $shpv ) {
		
			last; 
		} 
		
	}

	foreach $s (@pnt){
		$cel[$s] = "# " ;
    }
} 


HBuilder();
VBuilder();



for ($z=0; $z<=($num-$col); $z+=$col) {
 for($k=0; $k<$col; $k++) {
  print "$cel[$k+$z]";
 }
  print "\n" ;
}







































