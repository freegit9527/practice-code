/*
 * =====================================================================================
 *       Filename : export.c
 *    Description : export c function to c++
 *    Version     : 0.1
 *        Created : 03/29/14 19:05
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : How about today?
 * =====================================================================================
 */

#ifdef  _CPLUSPLUS
extern "C" {
#endif

__declspec(dllimport) void fun();
__declspec(dllimport) void foo();

#ifdef __cplusplus
}
#endif
