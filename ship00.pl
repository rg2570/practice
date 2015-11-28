#!/usr/bin/perl
# ship00.pl

$col=10;
$row=10;
$shp=5;

sub findArea {
	$start = shift(@_);
	$len = shift(@_);
	$step = shift(@_); # DIR
	@area = @_; # Array
	
	# $tmp = @area;
	# print "TMP: $tmp \n";

	# print "$start , $len , $step \n";
	# print "Area: @area \n";

	my @rsl;

	$c = 0;
	for( $i = $start; $c < $len ; $i += $step , $c++) {
		# print "$i , $c , $area[$i] \n";
		if(  $area[$i] eq "~ " ) {
			$rsl[$c] = $i;
		} else {
			return;
		}
	}
	# print "RSL: @rsl \n";
	return @rsl;
}


sub mkArea {
	$w = shift(@_);
	$h = shift(@_);
	$num = $w * $h;
	@arr;

	for ($i=0; $i<$num; $i++) {
 		$arr[$i] = "~ " ;     #Bulding the waves!
	}
	return @arr;
}

sub printArea {
	$h = shift(@_);
	@area = @_;
	$len = @area;
	

	for($i=1; $i <=$len; $i++ ) {
		print "@area[$i-1]";
		if( $i % $h == 0 ) {
			print "\n";
		}
	}
	print "\n";
}

sub fillArea {
	my ($area, $selected, $char) = @_;
	foreach $i (@$selected) {
		@$area[$i] = $char;
	}
}

#print "START\n";

@area = mkArea( $col , $row ) ;

# print "  @area \n";

#printArea($col, @area);


for ($p=0; $p<2;$p++) {
my $ab=int(rand($col)) ;
my $sze=int(rand(4)) + 3 ; #Size of ship
my $cd=int(rand($col-$sze)) + 1 ;
my $pnt= $cd + $ab*$col ;

@one = findArea($pnt,$sze,1,@area);
#print "One: @one\n";
fillArea(\@area, \@one, "H ");
#printArea($col, @area);
}

for ($q=0; $q<2; $q++) {
my $sze2= int(rand(4)) + 3;
my $pnt2= int(rand(($col-$sze2)*$col + $col)) ;

@two = findArea($pnt2,$sze2,$col,@area);
#print "Tow: @two\n";
fillArea(\@area, \@two, "V "); }
printArea($col, @area);


#print "END\n";
