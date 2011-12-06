
# Run as 
#   D:/Perl/bin/perl.exe Normal.pl
# on my machine which is where ActiveState perl is installed.

use Win32::OLE;

$n = Win32::OLE->new("SNormal") || die "Can't create SNormal COM object";

$v = $n->deviate();
print "deviate(): $v\n";

@n = @{$n->sample(4)};
print "sample(): @n\n";


$n->{mu} = 100;
$z = $n->{mu};
print "mu: $z\n";

# Now sample from the new distribution.
@n = @{$n->sample(4)};
print "sample(): @n\n";


$x = $n->generic({''=>4, 'abc'=>100.0, 'k' => "My value"});
print "sample(): $x\n";

# $n->{p} = "A string";
