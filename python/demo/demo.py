__author__ = 'snowsun'


def sumtree(myl):
    tot = 0
    for x in myl:
        if not isinstance(x, list):
            tot += x
        else:
            tot += sumtree(x)
    return tot


L = [1, [2, [3, 4], 5], 6, [7, 8]]
print sumtree(L)

