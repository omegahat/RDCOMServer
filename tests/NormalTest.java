import com.jacob.com.*;
import com.jacob.activeX.*;

/*

 Run as 
 c:/j2sdk1.4.1_01/bin/java -classpath 'D:/duncan/Projects/org/omegahat/R/RDCOMServer/tests;c:/tmp/JACOB/jacob.jar' NormalTest

 having put jacob.dll into your path, e.g. from bash
  export PATH=${PATH}:/cygdrive/c/tmp/JACOB

*/

public class NormalTest 
{import com.jacob.com.*;
import com.jacob.activeX.*;

/*

 Run as 
 c:/j2sdk1.4.1_01/bin/java -classpath 'D:/duncan/Projects/org/omegahat/R/RDCOMServer/tests;c:/tmp/JACOB/jacob.jar' NormalTest

 having put jacob.dll into your path, e.g. from bash
  export PATH=${PATH}:/cygdrive/c/tmp/JACOB

*/

public class NormalTest 
{
    static public void main(String[] args) throws Exception
    {
	try {
	    ActiveXComponent obj;
	    obj = new ActiveXComponent("Normal");
	    Dispatch d = (Dispatch) obj.getObject();
	    Variant v = Dispatch.call(d, "deviate");
	    System.err.println("deviate: " +  v);

	    Object[] callArgs = new Object[1];
	    callArgs[0] = new Integer(3);
	    v = Dispatch.call(d, "sample",  callArgs);
	    SafeArray a = v.toSafeArray();
	    System.err.println("Number dimensions " + a.getNumDim());
	    System.err.println("Bounds: " + a.getLBound(1) + " to " + a.getUBound(1));
	    for(int i = a.getLBound(1); i <= a.getUBound(1); i++)
		System.err.println(i + ") " + a.getDouble(i));
             
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }
}

