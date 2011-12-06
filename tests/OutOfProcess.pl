use Win32::OLE;

$R = Win32::OLE->new("R.ExternalEvaluator") || die "Can't create R.ExternalEvaluator COM object";

@o = @{$R->search()};
print "Search: @o\n";

