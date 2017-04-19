#!/usr/bin/perl

print "Input FASTA file (FASTA format) : ";
$file = <STDIN>;
chomp($file);
open(FH,$file) || die "cannot open the $file for reading \n";
=cut
while (<FH>){
	#print $_;
	@files = split("",$_);
}
=cut
@files = <FH>;
chomp(@files);
# Check header of FASTA File
if ($files[0] =~ "^>"){		
	for($i=1;$i<=$#files;$i++){
		push(@reAssemble, $files[$i]);
	}
}else{
	for($i=0;$i<=$#files;$i++){					
		push(@reAssemble, $files[$i]);
	}
}
$temp = join("",@reAssemble);
$temp =~ tr/atgc/ATGC/;

print "\n\nsearch the starting motif :";
$startChar = <STDIN>;
chomp $startChar;
$startChar =~ tr/atgc/ATGC/;
if ($temp =~ /$startChar/i){
	$start_position = index $temp, "$startChar";
}else{
	die "Not detected Starting motif\n";
}


print "search the ending motif :";
$endChar = <STDIN>;
chomp $endChar;
$endChar =~ tr/atgc/ATGC/;
if ($temp =~ /$endChar/i){
	$end_position = index $temp, "$endChar";

}else{
	die "Not detected End motif\n";
}


print "Start Position: ",$start_position+1,"\t","End Position: ",$end_position,"\n";
