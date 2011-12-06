
# Run as 
#   D:/Perl/bin/perl.exe Normal.pl
# on my machine which is where ActiveState perl is installed.

use Win32::OLE;

$n = Win32::OLE->new("Normal") || die "Can't create Normal COM object";

$v = $n->deviate();
print "deviate(): $v\n";


$v = $n->percentile(0);
print "percentile(0): $v\n";

$v = $n->quantile(.5);
print "quantile(.5): $v\n";

$v = $n->sample(1);
print "sample(1): $v\n";


@z = @{$n->sample(4)};
print "sample(4): ($#z) @z\n";
print "$z\n";


$n->setMu(100.);

@z = @{$n->sample(4)};
print "sample(4): ($#z) @z\n";
print "$z\n";
