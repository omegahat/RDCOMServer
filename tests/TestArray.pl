use Win32::OLE;

$n = Win32::OLE->new("TestArrays") || die "Can't create TestArrays COM object";

@l = @{$n->logicals(8)};
print "Logicals: ($#l) @l\n";

@l = @{$n->ints(4)};
print "Integers: ($#l) @l\n";

@l = @{$n->reals(5)};
print "Reals: ($#l) @l\n";

@l = @{$n->strings(7)};
print "Strings: ($#l) @l\n";

@l = @{$n->lists(5)};
print "Lists: ($#l)\n";

@x = @$l{1};
print "0) @x\n";
