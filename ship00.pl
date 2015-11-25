#!/usr/bin/perl
# ship00.pl

$col=8;
$row=8;
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

print "START\n";

@area = mkArea( $col , $row ) ;

# print "  @area \n";

printArea($col, @area);

@one = findArea(2,5,1,@area);
print "One: @one\n";
fillArea(\@area, \@one, "H ");
printArea($col, @area);

@two = findArea(1,2,8,@area);
print "Tow: @two\n";
fillArea(\@area, \@two, "V ");
printArea($col, @area);


print "END\n";
