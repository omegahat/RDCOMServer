#include <windows.h>
#include <objbase.h>

#include <iostream.h>

extern "C" {
  //#include <Defn.h>
#include <Rinternals.h>
#include <Rdefines.h>
}

class RCOMObject;

class RCOMFactory : public IClassFactory
{
public:
	// IUnknown
	virtual HRESULT __stdcall QueryInterface(const IID& iid, void** ppv) ;         
	virtual ULONG   __stdcall AddRef();
	virtual ULONG   __stdcall Release();

	// Interface IClassFactory
	virtual HRESULT __stdcall CreateInstance(IUnknown* pUnknownOuter,
	                                         const IID& iid,
	                                         void** ppv) ;
	virtual HRESULT __stdcall LockServer(BOOL bLock) ; 

 	// Constructor
	RCOMFactory(SEXP def) : clsid(NULL), m_cRef(1) 
                              { 
	                       if(def && def != R_NilValue)
				 R_PreserveObject(def);
			       classDef = def;
	                      }

	// Destructor
	~RCOMFactory() { m_cRef--; 
	                  if(m_cRef == 0) {
			    if(clsid)
			      free(clsid);
			    if(classDef && classDef != R_NilValue)
			      R_ReleaseObject(classDef);
			  }
                       }


	virtual RCOMObject *createCOMObject();

 protected:
	char *clsid;
	SEXP classDef;

 private:
	long m_cRef ;
};


class RCOMFunctionFactory : public RCOMFactory
{
 public:
   RCOMFunctionFactory(SEXP def) : RCOMFactory(def) {}

   RCOMObject *createCOMObject();
};


