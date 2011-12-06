#include <iostream>
#include "RCOMFactory.h"
#include <oaidl.h>
#include "converters.h"

#include "SFuncs.h"

#undef ERROR
#include <Rinternals.h>
#include <Rdefines.h>
#include "RCOMObject.h"

HMODULE g_hModule;

long gr_cComponents, gr_cServerLocks;


//
// Can DLL unload now?
//
extern "C" {
STDAPI DllCanUnloadNow()
{
	if ((gr_cComponents == 0) && (gr_cServerLocks == 0))
	{
#ifdef RDCOM_VERBOSE
	  errorLog("Can unload DLL\n");
#endif
		return S_OK ;
	}
	else
	{
		return S_FALSE ;
	}
}


//
// Get class factory
//

STDAPI DllGetClassObject(const CLSID& clsid,
                         const IID& iid,
                         void** ppv)
{

  SEXP classDef = R_NilValue;
#if defined(RDCOM_VERBOSE) && RDCOM_VERBOSE
  errorLog("DllGetClassObject\n");
#endif
        if(lookupRClassId(clsid, &classDef) == S_FALSE) {
	  errorLog("Unknown iid in DllGetClassObject\n");
	  return CLASS_E_CLASSNOTAVAILABLE ;
	}
	// Create class factory.
	RCOMFactory* pFactory = new RCOMFunctionFactory(classDef);  // No AddRef in constructor
	if (pFactory == NULL)
  	    return E_OUTOFMEMORY ;

	// Get requested interface.
	HRESULT hr = pFactory->QueryInterface(iid, ppv) ;
	pFactory->Release();
#if defined(RDCOM_VERBOSE) && RDCOM_VERBOSE
	errorLog("[end DllGetClassObject] factory = %p\n", *ppv);
#endif
	return hr ;
}



///////////////////////////////////////////////////////////
//
// DLL module information
//

static char *argv[] = {"RDCOMServer"};
extern int Rinit(int argc, char **argv);
BOOL APIENTRY DllMain(HANDLE hModule,
                      DWORD dwReason,
                      void* lpReserved)
{
#if 0
{
  FILE *tmp;
  tmp = fopen("C:\\DllInit.err", "w");
  fprintf(tmp, "In DllMain\n");
  fflush(tmp);
  fclose(tmp);
}
#endif

	if (dwReason == DLL_PROCESS_ATTACH)
	{
		g_hModule = (HMODULE) hModule ;
		/* Start R session. */
		Rinit(sizeof(argv)/sizeof(argv[0]), argv);
#if defined(RDCOM_VERBOSE) && RDCOM_VERBOSE
		errorLog("Started R\n");
#endif
	}
	return TRUE ;
}

} /* end of extern "C" {...*/
