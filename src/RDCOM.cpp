#include <iostream.h>
#include "RCOMObject.h"
#include "RCOMFactory.h"
#include "RUtils.h"

#include "SFuncs.h" //

static HMODULE g_hModule = NULL;    //DLL handle
static long g_cComponents = 0;      //Components active
long g_cServerLocks = 0;

const DWORD dwTimeOut = 5000; // time for EXE to be idle before shutting down
const DWORD dwPause = 1000; // time to wait for threads to finish up

bool StartMonitor();
DWORD MonitorShutdown(void *);

void RegisterServer(char *);
void UnRegisterServer(char *);

HANDLE g_hExitEvent;

DWORD dwThreadID;


int
main(int argc, char **argv)
{
  HRESULT hr;
  DWORD registerCookie;
  IUnknown *unk;
  char *sclassId;
  CLSID classId;  

  if(argc > 1) {
    if(strcmp(argv[1], "-RegServer") == 0) {
      sclassId = argv[2];
      RegisterServer(sclassId);
      return(0);
    } else if(strcmp(argv[1], "-UnRegServer") == 0) {
      sclassId = argv[2];
      UnRegisterServer(argv[2]);
      return(0);
    } else {
      sclassId = argv[1];
      WCHAR str[1000];
      MultiByteToWideChar(CP_ACP, 0, argv[1], strlen(argv[1])+1, str, sizeof(str)/sizeof(str[0]));
      HRESULT hr;
      if(hr = CLSIDFromString(str, &classId) != S_OK) {
	cerr << "Can't resolve CLASS ID from " << sclassId << endl;
	switch(hr) {
	case CO_E_CLASSSTRING:
	  cerr << "Improperly formatted string" << endl;
	  break;
	case REGDB_E_WRITEREGDB:
	  cerr << "Not in registry" << endl;
	  break;
	}
	//	exit S_FALSE;
      }
    }
  }

  CoInitializeEx(NULL, COINIT_APARTMENTTHREADED);

  int Rargc = argc-2;
  char **Rargv;
  Rargv = (char **) malloc(sizeof(char *) * (Rargc + 1));
  Rargv[0] = argv[0];
  for(int i = 1; i < Rargc; i++)
    Rargv[i] = argv[i+1];
  Rinit(Rargc, Rargv);

  cerr << "Initialized R" << endl;

  SEXP def;
  if(lookupRClassId(classId, &def) == S_FALSE) {
    cerr << "Cannot find class definition for clsid " << sclassId << endl;
    return(11);
  }

  RCOMFactory* factory = new RCOMFunctionFactory(def);

  unk = reinterpret_cast<IUnknown*>(factory);
  hr = CoRegisterClassObject(classId, (IUnknown*)factory, CLSCTX_SERVER, REGCLS_MULTIPLEUSE,
			     &registerCookie);

  if(FAILED(hr)) 
    cerr << "Problems registering object" << endl;

  dwThreadID = GetCurrentThreadId();
  StartMonitor();

  MSG msg;
  while (GetMessage(&msg, 0, 0, 0))
    DispatchMessage(&msg);

  //  WaitForSingleObject(g_hExitEvent, INFINITE);

  CoRevokeClassObject(registerCookie);
  CoUninitialize();

  CloseHandle(g_hExitEvent);

  return(0);
}

#include <string.h>
#if 0
#define wcscpy(a, b)   MultiByteToWideChar(CP_ACP, 0, (b), strlen(b), a, 2* strlen((b)))
#else
#define wcscpy(a, b)   strcpy(a, b)
#define wcstrcat(a, b) strcat(a, b)
#define ByteLen(a)     strlen(a)
#endif




#if 0
#define CLSID "{8FC6587D-8B24-4146-A862-E4502A4916F5}"
#define APPID "{377B67EE-133F-42b4-B208-4BDE0F131F91}"
#endif

void
RegisterServer(char *clsid)
{
  CHAR wszKey[MAX_PATH];
  CHAR wszValue[MAX_PATH];

  HKEY hKey = 0;

  wcscpy(wszKey, TEXT("CLSID\\" ));
  wcstrcat(wszKey, clsid);
  RegCreateKey(HKEY_CLASSES_ROOT, wszKey, &hKey);

  wcscpy(wszValue, TEXT("Duncan"));
  RegSetValueEx(hKey, 0, 0, REG_SZ, (BYTE*) wszValue, ByteLen(wszValue));

#ifdef USE_APPID
  // AppID
  wcscpy(wszValue, TEXT(APPID));
  RegSetValueEx(hKey, TEXT("AppID"), 0, REG_SZ, (BYTE*) wszValue, ByteLen(wszValue));
  RegCloseKey(hKey);
#endif

  /* Register the CLSID under the friendly name "Duncan" */
  wcscpy(wszKey, TEXT("Duncan\\CLSID"));
  RegCreateKey(HKEY_CLASSES_ROOT, wszKey, &hKey);
  wcscpy(wszValue, TEXT(clsid));
  RegSetValueEx(hKey, 0, 0, REG_SZ, (BYTE*) wszValue, ByteLen(wszValue));
  RegCloseKey(hKey);

  wcscpy(wszKey, TEXT("CLSID\\"));
  wcstrcat(wszKey, clsid);
  wcstrcat(wszKey,  "\\LocalServer32");
  RegCreateKey(HKEY_CLASSES_ROOT, wszKey, &hKey);

  GetModuleFileName(0, wszValue, MAX_PATH);
  wcstrcat(wszValue, " ");
  wcstrcat(wszValue, clsid);
  cerr << "Executable: " << wszValue << endl;
  RegSetValueEx(hKey, 0, 0, REG_SZ, (BYTE*) wszValue, ByteLen(wszValue));
  RegCloseKey(hKey);

#if 0
  wcscpy(wszKey, TEXT("AppID\\" APPID));
  RegCreateKey(HKEY_CLASSES_ROOT, wszKey, &hKey);

  wcscpy(wszValue, TEXT("Duncan"));
  RegSetValueEx(hKey, 0, 0, REG_SZ, (BYTE*) wszValue, ByteLen(wszValue));
  RegCloseKey(hKey);

  wcscpy(wszKey, TEXT("AppID\\Duncan.exe"));
  RegCreateKey(HKEY_CLASSES_ROOT, wszKey, &hKey);

  wcscpy(wszValue, TEXT(APPID));
  RegSetValueEx(hKey, TEXT("AppID"), 0, REG_SZ, (BYTE*) wszValue, ByteLen(wszValue));

  RegCloseKey(hKey);
#endif

  cerr << "Registered server\n";

}

void
UnRegisterServer(char *clsid)
{
  CHAR wszValue[MAX_PATH];
  wcscpy(wszValue, "CLSID\\");
  wcstrcat(wszValue, clsid);
  wcstrcat(wszValue, "LocalServer32");
  RegDeleteKey(HKEY_CLASSES_ROOT, wszValue);

  wcscpy(wszValue, "CLSID\\");
  wcstrcat(wszValue, clsid);
  RegDeleteKey(HKEY_CLASSES_ROOT, wszValue);

#ifdef USE_APPID
  RegDeleteKey(HKEY_CLASSES_ROOT, TEXT("AppID\\")
	       TEXT(APPID));


  RegDeleteKey(HKEY_CLASSES_ROOT, TEXT("AppID\\Duncan.exe"));
#endif
}


int m_nLockCnt;

DWORD WINAPI
MonitorShutdown(void *d)
{
    bool bActivity;
    while (1)
    {
        WaitForSingleObject(g_hExitEvent, INFINITE);
        DWORD dwWait=0;
        do
        {
            bActivity = false;
            dwWait = WaitForSingleObject(g_hExitEvent, dwTimeOut);
        } while (dwWait == WAIT_OBJECT_0);
        // timed out
        if (!bActivity && m_nLockCnt == 0) // if no activity let's really bail
        {
#if _WIN32_WINNT >= 0x0400 & defined(_ATL_FREE_THREADED)
            CoSuspendClassObjects();
            if (!bActivity && m_nLockCnt == 0)
#endif
                break;
        }
    }
    CloseHandle(g_hExitEvent);
    PostThreadMessage(dwThreadID, WM_QUIT, 0, 0);
    return(0);
}

bool StartMonitor()
{
    g_hExitEvent = CreateEvent(NULL, false, false, NULL);
    if (g_hExitEvent == NULL)
        return false;
    DWORD dwThreadID;

  cerr << "Creating separate thread " << endl;
    HANDLE h = CreateThread(NULL, 0, MonitorShutdown, (void*)NULL, 0, &dwThreadID);
  cerr << "Created thread " << endl;
    return (h != NULL);
}
