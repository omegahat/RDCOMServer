use Win32::OLE;

$r = Win32::OLE->new("RNG");

@x = @{$r->normal({''=>10, 'sd' => 20, 'mean' => 100})};
print "Normal: @x\n";

@x = @{$r->normal({''=>10, 'sd' => 20, '' => 100})};
print "Normal: @x\n";

@x = @{$r->normal({'n'=>10, 'sd' => 20})};
print "Normal: @x\n";

exit 0;

@x = @{$r->normal(10)};
print "Normal: @x\n";

@x = @{$r->normal(10, 50)};
print "Normal: @x\n";


@x = @{$r->poisson(5, 3)};
print "Poisson: @x\n";

@x = @{$r->binomial(7, 20, .2)};
print "Binomial: @x\n";

