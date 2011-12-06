use Win32::OLE;

$r = Win32::OLE->new("R.Evaluator");
$m = $r->evaluate("matrix(rnorm(3*7), 3, 7)") || die "Can't get matrix";

print "Matrix: $lm\n";

@d = @{$m->dim()};
print "Dims: @d\n";

@vals = @{$m->values()};
print "Values: @vals\n";



