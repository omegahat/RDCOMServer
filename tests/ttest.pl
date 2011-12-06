# Call with ActiveState Perl

use Win32::OLE;

$t = Win32::OLE->new("R.TTest") || die "Can't create R.TTest COM object";

# Following currently is transferred as a list in S, not a numeric.
@x = (0.2795290,  1.2010954, -0.1396027,  0.1742421, -2.1921724 , 0.4139593, -0.3025258, -0.1818093,  0.6793734,  0.7978106);

$val = $t->ttest(\@x);

print "Result: $val\n";

$x = $val->statistic;
$d = $val->parameter;
$mean = $val->estimate;
print "Statistic: $x ($d) $mean\n";

print "Next stage\n";

# Now we create a second COM object within S and 
# use it to generate

$normal = Win32::OLE->new("SNormal");
@data = @{$normal->sample(100)};

$val = $t->ttest(\@data);

$x = $val->statistic;
$d = $val->parameter;
$mean = $val->estimate;
print "Statistic: $x ($d) $mean\n";
