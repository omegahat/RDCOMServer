use Win32::OLE;

$R = Win32::OLE->new("R.Evaluator") || die "Can't create R.Evaluator COM object";

@o = @{$R->search()};
print "search(): @o\n";

@o = @{$R->objects()};
print "objects(): @o\n";


@o = @{$R->objects(2)};
print "objects(2): @o\n";

@o = @{$R->objects("package:methods")};
print "objects(2): @o\n";


$R->evaluate("print(1:10); NULL");
$n = $R->evaluate("mean(rnorm(1000))");
print "Average N(0, 1): $n\n";


$R->library(mva);
@o = @{$R->search()};
print "search(): @o\n";

$ok = $R->exists("plot");
if ($ok) {
  
}

@val = 1..11;
$x = "JMC";
$R->set("UserName", $x); 
$R->set("Value", \@val); 

@o = @{$R->objects({'pos' => 1})};

#@o = @{$R->evaluate("objects(env = globalenv())")};
#$o = $R->evaluate("objects(env = globalenv())");
print "objects after myData: @o\n";

$R->evaluate("YourData <<- 1:10");

@o = @{$R->objects()};
print "objects after YourData: @o\n";

@myData = @{$R->get("YourData")};
print "myData: @myData\n";

