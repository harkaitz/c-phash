#ifndef STR_PHASH_H
#define STR_PHASH_H

#include <inttypes.h>
#include <stdint.h>
#include <stdarg.h>
#include <stdio.h>

static inline __attribute__((unused))
uint64_t phashv(uint64_t opt_hash,const char *format,va_list va) {
    uint64_t hash = (opt_hash)?opt_hash:525201411107845655ull;
    for(const char *f=format;*f;f++) {
        if(*f=='s') {
            const unsigned char *c=va_arg(va,const unsigned char *);
            if(c) {
                for(;*c;c++) {
                    hash ^= *c;
                    hash *= 0x5bd1e9955bd1e995;
                    hash ^= hash >> 47u;
                }
            }
        } else if(*f=='b') {
            size_t l = va_arg(va, size_t);
            const unsigned char *c = va_arg(va, const unsigned char *);
            if(c && l) {
                for(size_t p=0;p<l;p++) {
                    hash ^= c[p];
                    hash *= 0x5bd1e9955bd1e995;
                    hash ^= hash >> 47u;
                }
            }
        } else if(*f=='i') {
            int i = va_arg(va, int);
            for(size_t p=0;p<sizeof(int);p++) {
                hash ^= ((unsigned char *) (&i))[p];
                hash *= 0x5bd1e9955bd1e995;
                hash ^= hash >> 47u;
            }
        }
    }
    return hash;
}

static inline __attribute__((unused))
uint64_t phash(uint64_t opt_hash,const char *format,...) {
    va_list va;
    va_start(va,format);
    uint64_t ret = phashv(opt_hash,format,va);
    va_end(va);
    return ret;
}

#endif
/**l*
 * 
 * MIT License
 * 
 * Bug reports, feature requests to gemini|https://harkadev.com/oss
 * Copyright (c) 2023 Harkaitz Agirre, harkaitz.aguirre@gmail.com
 * 
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 **l*/
