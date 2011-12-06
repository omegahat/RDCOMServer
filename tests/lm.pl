use Win32::OLE;

$r = Win32::OLE->new("R.Evaluator");
# $m = $r->evaluate("matrix(rnorm(3*7), 3, 7)") || die "Can't get matrix";
$lm = $r->evaluate("data(mtcars); lm(mpg ~ ., data = mtcars)") || die "Can't get matrix";

print "LM:  $lm\n";

@x = @{$lm->residuals};
print "Resids: @x\n";

@coefs = @{$lm->coefficients()};
print "Coeffs: @x\n";

$s = $lm->summary();
print "Summary: $s\n";
$k = $s->sigma;
print "Sigma: $k\n";






