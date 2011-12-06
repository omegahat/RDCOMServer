#include "RCOMFactory.h"
#include "RCOMObject.h"

#include <iostream>

extern long gr_cServerLocks;

HRESULT __stdcall
RCOMFactory::QueryInterface(const IID& iid, void** ppv) 
{
  if ((iid == IID_IUnknown) || (iid == IID_IClassFactory)) {
    *ppv = static_cast<IClassFactory*>(this) ; 
  } else {
    errorLog("Unknown interface in RCOMFactory::QueryInterface\n");
    *ppv = NULL ;
    return E_NOINTERFACE ;
  }
  reinterpret_cast<IUnknown*>(*ppv)->AddRef() ;

#if defined(RDCOM_VERBOSE) && RDCOM_VERBOSE
  errorLog("[end RCOMFactory::QueryInterface]\n");
#endif

  return S_OK ;
}


HRESULT __stdcall
RCOMFactory::CreateInstance(IUnknown* pUnknownOuter,
			    const IID& iid,
			    void** ppv) 
{
  RCOMObject *obj = NULL;
  SEXP def = R_NilValue;

	// Cannot aggregate.
  if (pUnknownOuter != NULL) {
    errorLog("No aggregation in CreateInstance\n");
    return CLASS_E_NOAGGREGATION ;
  }

  obj = createCOMObject();

	// Create component.
  if (obj == NULL)	
    return E_OUTOFMEMORY ;

#if defined(RDCOM_VERBOSE) && RDCOM_VERBOSE
  errorLog("RCOMObject %p\n", obj);
#endif
	// Get the requested interface.
  HRESULT hr = obj->QueryInterface(iid, ppv);

  // Release the IUnknown pointer.
  // (If QueryInterface failed, component will delete itself.)
  obj->Release();

#if defined(RDCOM_VERBOSE) && RDCOM_VERBOSE
  errorLog("[RCOMFactory::createInstance] Created object %X %p\n", hr, *ppv);
#endif

  return hr ;
}

HRESULT 
RCOMFactory::LockServer(BOOL bLock) 
{
	if (bLock) {
		InterlockedIncrement(&gr_cServerLocks) ; 
	}
	else {
		InterlockedDecrement(&gr_cServerLocks) ;
	}
	return S_OK ;
}
         
ULONG __stdcall RCOMFactory::AddRef()
{
	return InterlockedIncrement(&m_cRef) ;
}

ULONG __stdcall RCOMFactory::Release() 
{
	if (InterlockedDecrement(&m_cRef) == 0)	{
	  delete this ;
	  return 0 ;
	}
	return m_cRef ;
}


RCOMObject *
RCOMFunctionFactory::createCOMObject()
{
  SEXP e, val;
  int errorOccurred;

  PROTECT(e = allocVector(LANGSXP, 2));
  SETCAR(e, Rf_install("createCOMObject"));
  SETCAR(CDR(e), this->classDef);

  val = R_tryEval(e, R_GlobalEnv, &errorOccurred);

  RCOMObject *obj = NULL;
  if(!errorOccurred) {
    obj = (RCOMObject *) R_ExternalPtrAddr(val);
  }

  UNPROTECT(1);

  return(obj);
}

RCOMObject *
RCOMFactory::createCOMObject()
{
   return(new RCOMEnvironmentObject(this->classDef));
}

