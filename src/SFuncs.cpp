#include "RCOMObject.h"

extern "C" {
  SEXP R_RCOMEnvironmentObject(SEXP);
  SEXP R_RCOMSObject(SEXP def);
  SEXP R_RCOMSObjectGetDef(SEXP ref);
  SEXP R_RCOMSObjectSetDef(SEXP ref, SEXP def);
  SEXP R_getNativeRDCOMClass(SEXP ref);
}


SEXP 
R_RCOMEnvironmentObject(SEXP def)
{
  RCOMEnvironmentObject *obj;
  obj = new RCOMEnvironmentObject(def);
  SEXP ans = R_MakeExternalPtr((void *) obj, Rf_install("RCOMEnvironmentObject"), Rf_install("RCOMEnvironmentObject"));
  SET_CLASS(ans, mkString("RCOMEnvironmentServer"));
  return(ans);
}



SEXP 
R_RCOMSObject(SEXP def)
{
  RCOMSObject *obj;
  obj = new RCOMSObject(def);
  SEXP ans = R_MakeExternalPtr((void *) obj, Rf_install("RCOMSObject"), Rf_install("RCOMSObject"));
  /*SET_CLASS(ans, mkString("RDCOMServer")); */
  return(ans);
}

static RCOMSObject *
_getRCOMSObjectRef(SEXP ref)
{ 
  RCOMSObject *ptr;
  SEXP original;

  if(TYPEOF(ref) != EXTPTRSXP) {
    original = ref;
    ref = GET_SLOT(ref, Rf_install("ref"));
  }

  if(TYPEOF(ref) != EXTPTRSXP) {
    PROBLEM "RCOMSObject must be an externalptr object in R"
     ERROR;
  }
  if(R_ExternalPtrTag(ref) != Rf_install("RCOMSObject")) {
    PROBLEM "Incorrect type of externalptr passed as an RCOMSObject"
     ERROR;
  }
  ptr = (RCOMSObject *) R_ExternalPtrAddr(ref);
  if(!ptr) {
    PROBLEM "Null value passed as RCOMSObject reference"
      ERROR;
  }
  return(ptr);
}

SEXP
R_RCOMSObjectGetDef(SEXP ref)
{
  RCOMSObject *obj;
  obj = _getRCOMSObjectRef(ref);
  return(obj->R_getObject());
}


SEXP
R_RCOMSObjectSetDef(SEXP ref, SEXP def)
{
  RCOMSObject *obj;
  obj = _getRCOMSObjectRef(ref);
  return(obj->R_setObject(def));
}


HRESULT
lookupRClassId(const CLSID &clsid, SEXP *def)
{
  SEXP ans, e, tmp;
  int errorOccurred;
  LPOLESTR ostr;
  HRESULT hr;

  hr = StringFromCLSID(clsid, &ostr);
  if(FAILED(hr))
    return(S_FALSE);

  PROTECT(e = allocVector(LANGSXP, 2));
  SETCAR(e, Rf_install("GetCOMClassDef"));
  SETCAR(CDR(e), mkString(FromBstr(ostr)));  
  ans = R_tryEval(e, R_GlobalEnv, &errorOccurred);

  
  hr = (!errorOccurred && ans != R_NilValue) ? S_OK : S_FALSE;
  if(hr == S_OK) {
    R_PreserveObject(ans);
    *def = ans;
  } else {
    cerr << "Couldn't find class definition for " << ostr << endl;
  }

  UNPROTECT(1);
  return(hr);
}


SEXP
R_getNativeRDCOMClass(SEXP ref)
{
  RCOMSObject *ptr = _getRCOMSObjectRef(ref);
  return(mkString(ptr->getClassName()));
}
