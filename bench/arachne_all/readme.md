# Arachne-all

## 结构

## Bug修复

1. memset的`warning: ‘void* memset(void*, int, size_t)’ clearing an object of non-trivial type`问题。

   造成原因： g++ 版本原因(8.1之后)。

   `- memset(&tcparams, 0, sizeof(tcparams));`
   
   `+memset(static_cast<void*>(&tcparams), 0, sizeof(tcparams));`

   > https://github.com/oneapi-src/oneTBB/issues/54

2. `%ld %lu` -> `%d %u`