if(FALSE) {	
setClass("SCOMClassElement",
         representation(name="character",
                        help="character"))

# Should classes be identified by name or a class object.
# The latter is preferrable, but 

setClass("SCOMProperty",
          representation("SCOMClassElement",
                         type="character",
                         readOnly="logical"))


setClass("SCOMMethod",
          representation("SCOMClassElement",
                         returnType="character",
                         signature="character",
                         Function = "function"
                         ))

}  # end of FALSE.



# These are R classes that are used to represent
# a description of an R DCOM server so that instances
# can be created when they are requested.
# These do not represent the actual object, but merely a
# description of how to create them in R.


#
# The essential ingredients are 
#    the name of the class
#    a version identifier, currently a string
#    the GUID for the COM interface
#    the program id, another IID/GUID.
#    a string giving a description of the COM class and its purpose
#    one or more GUIDs indicating which COM interfaces the
#      class implements. These are used in the QueryInterface() call
#      made by some clients to get a reference to a particular interface.
	

# This is a virtual class and is used to define the common slots.
# The remaining classes contain particular ways to create instances
# of the COM objects from the COMClass description information.

setClass("SCOMClass",
          representation(name = "character",
	                 version = "character", # Should this be a real version object.
	                 classId = "Ruuid",
			 progId = "Ruuid",
			 help="character",
	                 guids = "character",
                         "VIRTUAL"))


# This class is one for which we want to register the server,
# (as opposed to using it directly here), but for which 
# we also have pre-computed information about the ids of the methods.
# Essentially, this implements a known interface rather than is defining a new
# "dynamic" interface whose interface is not computible from a ITypeInfo.
setClass("COMInterfaceServerInfo",
           representation("SCOMClass",
                          ids = "numeric",
                          "VIRTUAL"))



# For this class, we call the generator function 
# to create an R object that represents the COM interface.
# The result is usually a list of functions that are used
# as the methods for the COM object.
setClass("SCOMEnvironmentClass",
	  representation("SCOMClass",
	                 generator = "function"))

setClass("SCOMInterfaceEnvironmentClass",
          contains = c("COMInterfaceServerInfo", "SCOMEnvironmentClass"))


# This is a specialization of the SCOMEnvironmentClass. 
# What purpose does it serve over and above that?
setClass("SCOMIDispatch",
	  representation("SCOMEnvironmentClass"))	


# This version does not use a generator but instead takes
# an existing collection of functions and uses these as the 
# methods for the COM object.  It also enumerates the names
# of the properties that are accessible.
setClass("SCOMFunctionClass",
	  representation("SCOMClass",
	                 functions="list",
                         properties = "character"))

setClass("SCOMInterfaceFunctionClass",
          contains = c("COMInterfaceServerInfo", "SCOMFunctionClass"))




setClass("RDCOMServer", representation(ref = "externalptr"))
