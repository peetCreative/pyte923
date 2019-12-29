from libc.stdlib cimport free

cdef extern from "te923/te923con.h":
    ctypedef struct Te923DataSet_t:
        int timestamp,
        float[6] t
        int[6] h
        float uv
        float press
        int forecast
        int storm
        float wChill
        float wGust
        float wSpeed
        int wDir
        int RainCount
        int[6] _t
        int[6] _h
        int _press
        int _uv
        int _wDir
        int _wSpeed
        int _wGust
        int _wChill
        int _RainCount
        int _storm
        int _forecast
        int _src

    ctypedef struct Te923DevSet_t:
        int SysVer
        int BarVer
        int UvVer
        int RccVer
        int WindVer
        int battery1
        int battery2
        int battery3
        int battery4
        int battery5
        int batteryUV
        int batteryWind
        int batteryRain
#    Te923DataSet_t get_memdump(int is_big)
    Te923DataSet_t get_rtdata()
    Te923DevSet_t get_status()

def py_getStatus() -> Te923DevSet_t:
    data = get_status()
    if data.SysVer == 0:
        return None
    else:
        return data

def py_getRTData() -> Te923DataSet_t:
    data = get_rtdata()
    if data.timestamp == 0:
        return None
    else:
        return data
