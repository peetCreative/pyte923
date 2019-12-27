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
#    Te923DataSet_t get_memdump(int is_big)
    Te923DataSet_t get_rtdata()
 #   Te923DevSet_t get_status()

def py_getCurDataSet() -> Te923DataSet_t:
    return get_rtdata()
