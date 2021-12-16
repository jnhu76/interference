# Arachne

threadClass = 1

Specified by applications to indicate general properties of this thread (e.g. latency-sensitive foreground thread vs throughput-sensitive background thread); used by CorePolicy.

It defaults to 0 for threads created without specifying a class.

DefualtCorePolicy(DefualtCorePolicy.c:44)

`enum ThreadClass { DEFAULT = 0, EXCLUSIVE = 1 };`

```c++
CorePolicy::CoreList
DefaultCorePolicy::getCores(int threadClass) {
    switch (threadClass) {
        case DEFAULT:
            return sharedCores;
        case EXCLUSIVE:
            int coreId = getExclusiveCore();
            if (coreId < 0)
                break;
            CorePolicy::CoreList retVal(1, /*mustFree=*/true);
            retVal.add(coreId);
            return retVal;
    }
    CorePolicy::CoreList retVal(0, /*mustFree=*/true);
    return retVal;
}
```
