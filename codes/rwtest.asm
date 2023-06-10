
_rwtest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    for (int i = 0; i < NREADERS + NWRITERS; i++)
        wait();
}

int main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
    init_sems();
  11:	e8 0a 00 00 00       	call   20 <init_sems>
    start();
  16:	e8 45 02 00 00       	call   260 <start>
    exit();
  1b:	e8 51 05 00 00       	call   571 <exit>

00000020 <init_sems>:
{
  20:	55                   	push   %ebp
  21:	89 e5                	mov    %esp,%ebp
  23:	83 ec 0c             	sub    $0xc,%esp
    sem_init(WRT, 1, "wrt");
  26:	68 48 0a 00 00       	push   $0xa48
  2b:	6a 01                	push   $0x1
  2d:	6a 00                	push   $0x0
  2f:	e8 dd 05 00 00       	call   611 <sem_init>
    sem_init(MUTEX, 1, "mtx");
  34:	83 c4 0c             	add    $0xc,%esp
  37:	68 4e 0a 00 00       	push   $0xa4e
  3c:	6a 01                	push   $0x1
  3e:	6a 01                	push   $0x1
  40:	e8 cc 05 00 00       	call   611 <sem_init>
    sem_init(PRINT_MUTEX, 1, "prmtx");
  45:	83 c4 0c             	add    $0xc,%esp
  48:	68 4c 0a 00 00       	push   $0xa4c
  4d:	6a 01                	push   $0x1
  4f:	6a 02                	push   $0x2
  51:	e8 bb 05 00 00       	call   611 <sem_init>
}
  56:	83 c4 10             	add    $0x10,%esp
  59:	c9                   	leave  
  5a:	c3                   	ret    
  5b:	90                   	nop
  5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000060 <reader>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  68:	bb 05 00 00 00       	mov    $0x5,%ebx
  6d:	eb 23                	jmp    92 <reader+0x32>
  6f:	90                   	nop
        sem_release(MUTEX);
  70:	83 ec 0c             	sub    $0xc,%esp
  73:	6a 01                	push   $0x1
  75:	e8 a7 05 00 00       	call   621 <sem_release>
        sleep(10);
  7a:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  81:	e8 7b 05 00 00       	call   601 <sleep>
    while (i--)
  86:	83 c4 10             	add    $0x10,%esp
  89:	83 eb 01             	sub    $0x1,%ebx
  8c:	0f 84 26 01 00 00    	je     1b8 <reader+0x158>
        ATOMIC(printf(1, "Reader ID %d: wants to read\n", id))
  92:	83 ec 0c             	sub    $0xc,%esp
  95:	6a 02                	push   $0x2
  97:	e8 7d 05 00 00       	call   619 <sem_acquire>
  9c:	83 c4 0c             	add    $0xc,%esp
  9f:	56                   	push   %esi
  a0:	68 52 0a 00 00       	push   $0xa52
  a5:	6a 01                	push   $0x1
  a7:	e8 44 06 00 00       	call   6f0 <printf>
  ac:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  b3:	e8 69 05 00 00       	call   621 <sem_release>
        sem_acquire(MUTEX);
  b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bf:	e8 55 05 00 00       	call   619 <sem_acquire>
        modvar(1);
  c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  cb:	e8 69 05 00 00       	call   639 <modvar>
        if (getvar() == 1)
  d0:	e8 5c 05 00 00       	call   631 <getvar>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	83 f8 01             	cmp    $0x1,%eax
  db:	0f 84 97 00 00 00    	je     178 <reader+0x118>
        sem_release(MUTEX);
  e1:	83 ec 0c             	sub    $0xc,%esp
  e4:	6a 01                	push   $0x1
  e6:	e8 36 05 00 00       	call   621 <sem_release>
        ATOMIC(printf(1, "Reader ID %d: read\n", id))
  eb:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  f2:	e8 22 05 00 00       	call   619 <sem_acquire>
  f7:	83 c4 0c             	add    $0xc,%esp
  fa:	56                   	push   %esi
  fb:	68 6f 0a 00 00       	push   $0xa6f
 100:	6a 01                	push   $0x1
 102:	e8 e9 05 00 00       	call   6f0 <printf>
 107:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 10e:	e8 0e 05 00 00       	call   621 <sem_release>
        sem_acquire(MUTEX);
 113:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 11a:	e8 fa 04 00 00       	call   619 <sem_acquire>
        modvar(-1);
 11f:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 126:	e8 0e 05 00 00       	call   639 <modvar>
        if (getvar() == 0)
 12b:	e8 01 05 00 00       	call   631 <getvar>
 130:	83 c4 10             	add    $0x10,%esp
 133:	85 c0                	test   %eax,%eax
 135:	0f 85 35 ff ff ff    	jne    70 <reader+0x10>
            ATOMIC(printf(1, "Reader ID %d: released writing lock\n", id))
 13b:	83 ec 0c             	sub    $0xc,%esp
 13e:	6a 02                	push   $0x2
 140:	e8 d4 04 00 00       	call   619 <sem_acquire>
 145:	83 c4 0c             	add    $0xc,%esp
 148:	56                   	push   %esi
 149:	68 e4 0a 00 00       	push   $0xae4
 14e:	6a 01                	push   $0x1
 150:	e8 9b 05 00 00       	call   6f0 <printf>
 155:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 15c:	e8 c0 04 00 00       	call   621 <sem_release>
            sem_release(WRT);
 161:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 168:	e8 b4 04 00 00       	call   621 <sem_release>
 16d:	83 c4 10             	add    $0x10,%esp
 170:	e9 fb fe ff ff       	jmp    70 <reader+0x10>
 175:	8d 76 00             	lea    0x0(%esi),%esi
            ATOMIC(printf(1, "Reader ID %d: wants to get writing lock\n", id))
 178:	83 ec 0c             	sub    $0xc,%esp
 17b:	6a 02                	push   $0x2
 17d:	e8 97 04 00 00       	call   619 <sem_acquire>
 182:	83 c4 0c             	add    $0xc,%esp
 185:	56                   	push   %esi
 186:	68 b8 0a 00 00       	push   $0xab8
 18b:	6a 01                	push   $0x1
 18d:	e8 5e 05 00 00       	call   6f0 <printf>
 192:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 199:	e8 83 04 00 00       	call   621 <sem_release>
            sem_acquire(WRT);
 19e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a5:	e8 6f 04 00 00       	call   619 <sem_acquire>
 1aa:	83 c4 10             	add    $0x10,%esp
 1ad:	e9 2f ff ff ff       	jmp    e1 <reader+0x81>
 1b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}
 1b8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1bb:	5b                   	pop    %ebx
 1bc:	5e                   	pop    %esi
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret    
 1bf:	90                   	nop

000001c0 <writer>:
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	53                   	push   %ebx
 1c5:	8b 75 08             	mov    0x8(%ebp),%esi
 1c8:	bb 05 00 00 00       	mov    $0x5,%ebx
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
        ATOMIC(printf(1, "Writer ID %d: wants to write\n", id))
 1d0:	83 ec 0c             	sub    $0xc,%esp
 1d3:	6a 02                	push   $0x2
 1d5:	e8 3f 04 00 00       	call   619 <sem_acquire>
 1da:	83 c4 0c             	add    $0xc,%esp
 1dd:	56                   	push   %esi
 1de:	68 83 0a 00 00       	push   $0xa83
 1e3:	6a 01                	push   $0x1
 1e5:	e8 06 05 00 00       	call   6f0 <printf>
 1ea:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 1f1:	e8 2b 04 00 00       	call   621 <sem_release>
        sem_acquire(WRT);
 1f6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1fd:	e8 17 04 00 00       	call   619 <sem_acquire>
        sem_release(WRT);
 202:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 209:	e8 13 04 00 00       	call   621 <sem_release>
        ATOMIC(printf(1, "Writer ID %d: wrote\n", id))
 20e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 215:	e8 ff 03 00 00       	call   619 <sem_acquire>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	56                   	push   %esi
 21e:	68 a1 0a 00 00       	push   $0xaa1
 223:	6a 01                	push   $0x1
 225:	e8 c6 04 00 00       	call   6f0 <printf>
 22a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 231:	e8 eb 03 00 00       	call   621 <sem_release>
        sleep(10);
 236:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
 23d:	e8 bf 03 00 00       	call   601 <sleep>
    while (i--)
 242:	83 c4 10             	add    $0x10,%esp
 245:	83 eb 01             	sub    $0x1,%ebx
 248:	75 86                	jne    1d0 <writer+0x10>
}
 24a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 24d:	5b                   	pop    %ebx
 24e:	5e                   	pop    %esi
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	eb 0d                	jmp    260 <start>
 253:	90                   	nop
 254:	90                   	nop
 255:	90                   	nop
 256:	90                   	nop
 257:	90                   	nop
 258:	90                   	nop
 259:	90                   	nop
 25a:	90                   	nop
 25b:	90                   	nop
 25c:	90                   	nop
 25d:	90                   	nop
 25e:	90                   	nop
 25f:	90                   	nop

00000260 <start>:
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	83 ec 08             	sub    $0x8,%esp
        if (fork() == 0)
 266:	e8 fe 02 00 00       	call   569 <fork>
 26b:	85 c0                	test   %eax,%eax
 26d:	74 50                	je     2bf <start+0x5f>
 26f:	e8 f5 02 00 00       	call   569 <fork>
 274:	85 c0                	test   %eax,%eax
 276:	74 42                	je     2ba <start+0x5a>
 278:	e8 ec 02 00 00       	call   569 <fork>
 27d:	85 c0                	test   %eax,%eax
 27f:	74 5f                	je     2e0 <start+0x80>
    sleep(30);
 281:	83 ec 0c             	sub    $0xc,%esp
 284:	6a 1e                	push   $0x1e
 286:	e8 76 03 00 00       	call   601 <sleep>
        if (fork() == 0)
 28b:	e8 d9 02 00 00       	call   569 <fork>
 290:	83 c4 10             	add    $0x10,%esp
 293:	85 c0                	test   %eax,%eax
 295:	74 3b                	je     2d2 <start+0x72>
 297:	e8 cd 02 00 00       	call   569 <fork>
 29c:	85 c0                	test   %eax,%eax
 29e:	74 2d                	je     2cd <start+0x6d>
        wait();
 2a0:	e8 d4 02 00 00       	call   579 <wait>
 2a5:	e8 cf 02 00 00       	call   579 <wait>
 2aa:	e8 ca 02 00 00       	call   579 <wait>
 2af:	e8 c5 02 00 00       	call   579 <wait>
}
 2b4:	c9                   	leave  
        wait();
 2b5:	e9 bf 02 00 00       	jmp    579 <wait>
    for (int i = 0; i < NREADERS; i++)
 2ba:	b8 01 00 00 00       	mov    $0x1,%eax
            reader(i);
 2bf:	83 ec 0c             	sub    $0xc,%esp
 2c2:	50                   	push   %eax
 2c3:	e8 98 fd ff ff       	call   60 <reader>
            exit();
 2c8:	e8 a4 02 00 00       	call   571 <exit>
    for (int i = 0; i < NWRITERS; i++)
 2cd:	b8 01 00 00 00       	mov    $0x1,%eax
            writer(i);
 2d2:	83 ec 0c             	sub    $0xc,%esp
 2d5:	50                   	push   %eax
 2d6:	e8 e5 fe ff ff       	call   1c0 <writer>
            exit();
 2db:	e8 91 02 00 00       	call   571 <exit>
    for (int i = 0; i < NREADERS; i++)
 2e0:	b8 02 00 00 00       	mov    $0x2,%eax
 2e5:	eb d8                	jmp    2bf <start+0x5f>
 2e7:	66 90                	xchg   %ax,%ax
 2e9:	66 90                	xchg   %ax,%ax
 2eb:	66 90                	xchg   %ax,%ax
 2ed:	66 90                	xchg   %ax,%ax
 2ef:	90                   	nop

000002f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 45 08             	mov    0x8(%ebp),%eax
 2f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2fa:	89 c2                	mov    %eax,%edx
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 300:	83 c1 01             	add    $0x1,%ecx
 303:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 307:	83 c2 01             	add    $0x1,%edx
 30a:	84 db                	test   %bl,%bl
 30c:	88 5a ff             	mov    %bl,-0x1(%edx)
 30f:	75 ef                	jne    300 <strcpy+0x10>
    ;
  return os;
}
 311:	5b                   	pop    %ebx
 312:	5d                   	pop    %ebp
 313:	c3                   	ret    
 314:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 31a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000320 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 55 08             	mov    0x8(%ebp),%edx
 327:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 32a:	0f b6 02             	movzbl (%edx),%eax
 32d:	0f b6 19             	movzbl (%ecx),%ebx
 330:	84 c0                	test   %al,%al
 332:	75 1c                	jne    350 <strcmp+0x30>
 334:	eb 2a                	jmp    360 <strcmp+0x40>
 336:	8d 76 00             	lea    0x0(%esi),%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 340:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 343:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 346:	83 c1 01             	add    $0x1,%ecx
 349:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 34c:	84 c0                	test   %al,%al
 34e:	74 10                	je     360 <strcmp+0x40>
 350:	38 d8                	cmp    %bl,%al
 352:	74 ec                	je     340 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 354:	29 d8                	sub    %ebx,%eax
}
 356:	5b                   	pop    %ebx
 357:	5d                   	pop    %ebp
 358:	c3                   	ret    
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 360:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 362:	29 d8                	sub    %ebx,%eax
}
 364:	5b                   	pop    %ebx
 365:	5d                   	pop    %ebp
 366:	c3                   	ret    
 367:	89 f6                	mov    %esi,%esi
 369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000370 <strlen>:

uint
strlen(const char *s)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 376:	80 39 00             	cmpb   $0x0,(%ecx)
 379:	74 15                	je     390 <strlen+0x20>
 37b:	31 d2                	xor    %edx,%edx
 37d:	8d 76 00             	lea    0x0(%esi),%esi
 380:	83 c2 01             	add    $0x1,%edx
 383:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 387:	89 d0                	mov    %edx,%eax
 389:	75 f5                	jne    380 <strlen+0x10>
    ;
  return n;
}
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret    
 38d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 390:	31 c0                	xor    %eax,%eax
}
 392:	5d                   	pop    %ebp
 393:	c3                   	ret    
 394:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 39a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ad:	89 d7                	mov    %edx,%edi
 3af:	fc                   	cld    
 3b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3b2:	89 d0                	mov    %edx,%eax
 3b4:	5f                   	pop    %edi
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    
 3b7:	89 f6                	mov    %esi,%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003c0 <strchr>:

char*
strchr(const char *s, char c)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	53                   	push   %ebx
 3c4:	8b 45 08             	mov    0x8(%ebp),%eax
 3c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 3ca:	0f b6 10             	movzbl (%eax),%edx
 3cd:	84 d2                	test   %dl,%dl
 3cf:	74 1d                	je     3ee <strchr+0x2e>
    if(*s == c)
 3d1:	38 d3                	cmp    %dl,%bl
 3d3:	89 d9                	mov    %ebx,%ecx
 3d5:	75 0d                	jne    3e4 <strchr+0x24>
 3d7:	eb 17                	jmp    3f0 <strchr+0x30>
 3d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3e0:	38 ca                	cmp    %cl,%dl
 3e2:	74 0c                	je     3f0 <strchr+0x30>
  for(; *s; s++)
 3e4:	83 c0 01             	add    $0x1,%eax
 3e7:	0f b6 10             	movzbl (%eax),%edx
 3ea:	84 d2                	test   %dl,%dl
 3ec:	75 f2                	jne    3e0 <strchr+0x20>
      return (char*)s;
  return 0;
 3ee:	31 c0                	xor    %eax,%eax
}
 3f0:	5b                   	pop    %ebx
 3f1:	5d                   	pop    %ebp
 3f2:	c3                   	ret    
 3f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000400 <gets>:

char*
gets(char *buf, int max)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 406:	31 f6                	xor    %esi,%esi
 408:	89 f3                	mov    %esi,%ebx
{
 40a:	83 ec 1c             	sub    $0x1c,%esp
 40d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 410:	eb 2f                	jmp    441 <gets+0x41>
 412:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 418:	8d 45 e7             	lea    -0x19(%ebp),%eax
 41b:	83 ec 04             	sub    $0x4,%esp
 41e:	6a 01                	push   $0x1
 420:	50                   	push   %eax
 421:	6a 00                	push   $0x0
 423:	e8 61 01 00 00       	call   589 <read>
    if(cc < 1)
 428:	83 c4 10             	add    $0x10,%esp
 42b:	85 c0                	test   %eax,%eax
 42d:	7e 1c                	jle    44b <gets+0x4b>
      break;
    buf[i++] = c;
 42f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 433:	83 c7 01             	add    $0x1,%edi
 436:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 439:	3c 0a                	cmp    $0xa,%al
 43b:	74 23                	je     460 <gets+0x60>
 43d:	3c 0d                	cmp    $0xd,%al
 43f:	74 1f                	je     460 <gets+0x60>
  for(i=0; i+1 < max; ){
 441:	83 c3 01             	add    $0x1,%ebx
 444:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 447:	89 fe                	mov    %edi,%esi
 449:	7c cd                	jl     418 <gets+0x18>
 44b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 44d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 450:	c6 03 00             	movb   $0x0,(%ebx)
}
 453:	8d 65 f4             	lea    -0xc(%ebp),%esp
 456:	5b                   	pop    %ebx
 457:	5e                   	pop    %esi
 458:	5f                   	pop    %edi
 459:	5d                   	pop    %ebp
 45a:	c3                   	ret    
 45b:	90                   	nop
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 460:	8b 75 08             	mov    0x8(%ebp),%esi
 463:	8b 45 08             	mov    0x8(%ebp),%eax
 466:	01 de                	add    %ebx,%esi
 468:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 46a:	c6 03 00             	movb   $0x0,(%ebx)
}
 46d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 470:	5b                   	pop    %ebx
 471:	5e                   	pop    %esi
 472:	5f                   	pop    %edi
 473:	5d                   	pop    %ebp
 474:	c3                   	ret    
 475:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000480 <stat>:

int
stat(const char *n, struct stat *st)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	56                   	push   %esi
 484:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 485:	83 ec 08             	sub    $0x8,%esp
 488:	6a 00                	push   $0x0
 48a:	ff 75 08             	pushl  0x8(%ebp)
 48d:	e8 1f 01 00 00       	call   5b1 <open>
  if(fd < 0)
 492:	83 c4 10             	add    $0x10,%esp
 495:	85 c0                	test   %eax,%eax
 497:	78 27                	js     4c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 499:	83 ec 08             	sub    $0x8,%esp
 49c:	ff 75 0c             	pushl  0xc(%ebp)
 49f:	89 c3                	mov    %eax,%ebx
 4a1:	50                   	push   %eax
 4a2:	e8 22 01 00 00       	call   5c9 <fstat>
  close(fd);
 4a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4aa:	89 c6                	mov    %eax,%esi
  close(fd);
 4ac:	e8 e8 00 00 00       	call   599 <close>
  return r;
 4b1:	83 c4 10             	add    $0x10,%esp
}
 4b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4b7:	89 f0                	mov    %esi,%eax
 4b9:	5b                   	pop    %ebx
 4ba:	5e                   	pop    %esi
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 4c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4c5:	eb ed                	jmp    4b4 <stat+0x34>
 4c7:	89 f6                	mov    %esi,%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004d0 <atoi>:

int
atoi(const char *s)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	53                   	push   %ebx
 4d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4d7:	0f be 11             	movsbl (%ecx),%edx
 4da:	8d 42 d0             	lea    -0x30(%edx),%eax
 4dd:	3c 09                	cmp    $0x9,%al
  n = 0;
 4df:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 4e4:	77 1f                	ja     505 <atoi+0x35>
 4e6:	8d 76 00             	lea    0x0(%esi),%esi
 4e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 4f0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 4f3:	83 c1 01             	add    $0x1,%ecx
 4f6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 4fa:	0f be 11             	movsbl (%ecx),%edx
 4fd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 500:	80 fb 09             	cmp    $0x9,%bl
 503:	76 eb                	jbe    4f0 <atoi+0x20>
  return n;
}
 505:	5b                   	pop    %ebx
 506:	5d                   	pop    %ebp
 507:	c3                   	ret    
 508:	90                   	nop
 509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000510 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	56                   	push   %esi
 514:	53                   	push   %ebx
 515:	8b 5d 10             	mov    0x10(%ebp),%ebx
 518:	8b 45 08             	mov    0x8(%ebp),%eax
 51b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 51e:	85 db                	test   %ebx,%ebx
 520:	7e 14                	jle    536 <memmove+0x26>
 522:	31 d2                	xor    %edx,%edx
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 528:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 52c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 52f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 532:	39 d3                	cmp    %edx,%ebx
 534:	75 f2                	jne    528 <memmove+0x18>
  return vdst;
}
 536:	5b                   	pop    %ebx
 537:	5e                   	pop    %esi
 538:	5d                   	pop    %ebp
 539:	c3                   	ret    
 53a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000540 <srand>:

static uint seed = 1;

void
srand(uint s)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
  seed = s;
 543:	8b 45 08             	mov    0x8(%ebp),%eax
}
 546:	5d                   	pop    %ebp
  seed = s;
 547:	a3 90 0e 00 00       	mov    %eax,0xe90
}
 54c:	c3                   	ret    
 54d:	8d 76 00             	lea    0x0(%esi),%esi

00000550 <random>:

uint
random(void)
{
  seed = seed
    * 1103515245
 550:	69 05 90 0e 00 00 6d 	imul   $0x41c64e6d,0xe90,%eax
 557:	4e c6 41 
{
 55a:	55                   	push   %ebp
 55b:	89 e5                	mov    %esp,%ebp
    + 12345
    % (1 << 31);
  return seed;
}
 55d:	5d                   	pop    %ebp
    + 12345
 55e:	05 39 30 00 00       	add    $0x3039,%eax
  seed = seed
 563:	a3 90 0e 00 00       	mov    %eax,0xe90
}
 568:	c3                   	ret    

00000569 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 569:	b8 01 00 00 00       	mov    $0x1,%eax
 56e:	cd 40                	int    $0x40
 570:	c3                   	ret    

00000571 <exit>:
SYSCALL(exit)
 571:	b8 02 00 00 00       	mov    $0x2,%eax
 576:	cd 40                	int    $0x40
 578:	c3                   	ret    

00000579 <wait>:
SYSCALL(wait)
 579:	b8 03 00 00 00       	mov    $0x3,%eax
 57e:	cd 40                	int    $0x40
 580:	c3                   	ret    

00000581 <pipe>:
SYSCALL(pipe)
 581:	b8 04 00 00 00       	mov    $0x4,%eax
 586:	cd 40                	int    $0x40
 588:	c3                   	ret    

00000589 <read>:
SYSCALL(read)
 589:	b8 05 00 00 00       	mov    $0x5,%eax
 58e:	cd 40                	int    $0x40
 590:	c3                   	ret    

00000591 <write>:
SYSCALL(write)
 591:	b8 10 00 00 00       	mov    $0x10,%eax
 596:	cd 40                	int    $0x40
 598:	c3                   	ret    

00000599 <close>:
SYSCALL(close)
 599:	b8 15 00 00 00       	mov    $0x15,%eax
 59e:	cd 40                	int    $0x40
 5a0:	c3                   	ret    

000005a1 <kill>:
SYSCALL(kill)
 5a1:	b8 06 00 00 00       	mov    $0x6,%eax
 5a6:	cd 40                	int    $0x40
 5a8:	c3                   	ret    

000005a9 <exec>:
SYSCALL(exec)
 5a9:	b8 07 00 00 00       	mov    $0x7,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <open>:
SYSCALL(open)
 5b1:	b8 0f 00 00 00       	mov    $0xf,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <mknod>:
SYSCALL(mknod)
 5b9:	b8 11 00 00 00       	mov    $0x11,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <unlink>:
SYSCALL(unlink)
 5c1:	b8 12 00 00 00       	mov    $0x12,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <fstat>:
SYSCALL(fstat)
 5c9:	b8 08 00 00 00       	mov    $0x8,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <link>:
SYSCALL(link)
 5d1:	b8 13 00 00 00       	mov    $0x13,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <mkdir>:
SYSCALL(mkdir)
 5d9:	b8 14 00 00 00       	mov    $0x14,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <chdir>:
SYSCALL(chdir)
 5e1:	b8 09 00 00 00       	mov    $0x9,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <dup>:
SYSCALL(dup)
 5e9:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <getpid>:
SYSCALL(getpid)
 5f1:	b8 0b 00 00 00       	mov    $0xb,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <sbrk>:
SYSCALL(sbrk)
 5f9:	b8 0c 00 00 00       	mov    $0xc,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <sleep>:
SYSCALL(sleep)
 601:	b8 0d 00 00 00       	mov    $0xd,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <uptime>:
SYSCALL(uptime)
 609:	b8 0e 00 00 00       	mov    $0xe,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <sem_init>:
SYSCALL(sem_init)
 611:	b8 16 00 00 00       	mov    $0x16,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <sem_acquire>:
SYSCALL(sem_acquire)
 619:	b8 17 00 00 00       	mov    $0x17,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <sem_release>:
SYSCALL(sem_release)
 621:	b8 18 00 00 00       	mov    $0x18,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <setvar>:
SYSCALL(setvar)
 629:	b8 19 00 00 00       	mov    $0x19,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <getvar>:
SYSCALL(getvar)
 631:	b8 1a 00 00 00       	mov    $0x1a,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <modvar>:
SYSCALL(modvar)
 639:	b8 1b 00 00 00       	mov    $0x1b,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    
 641:	66 90                	xchg   %ax,%ax
 643:	66 90                	xchg   %ax,%ax
 645:	66 90                	xchg   %ax,%ax
 647:	66 90                	xchg   %ax,%ax
 649:	66 90                	xchg   %ax,%ax
 64b:	66 90                	xchg   %ax,%ax
 64d:	66 90                	xchg   %ax,%ax
 64f:	90                   	nop

00000650 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 659:	85 d2                	test   %edx,%edx
{
 65b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 65e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 660:	79 76                	jns    6d8 <printint+0x88>
 662:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 666:	74 70                	je     6d8 <printint+0x88>
    x = -xx;
 668:	f7 d8                	neg    %eax
    neg = 1;
 66a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 671:	31 f6                	xor    %esi,%esi
 673:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 676:	eb 0a                	jmp    682 <printint+0x32>
 678:	90                   	nop
 679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 680:	89 fe                	mov    %edi,%esi
 682:	31 d2                	xor    %edx,%edx
 684:	8d 7e 01             	lea    0x1(%esi),%edi
 687:	f7 f1                	div    %ecx
 689:	0f b6 92 14 0b 00 00 	movzbl 0xb14(%edx),%edx
  }while((x /= base) != 0);
 690:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 692:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 695:	75 e9                	jne    680 <printint+0x30>
  if(neg)
 697:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 69a:	85 c0                	test   %eax,%eax
 69c:	74 08                	je     6a6 <printint+0x56>
    buf[i++] = '-';
 69e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 6a3:	8d 7e 02             	lea    0x2(%esi),%edi
 6a6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 6aa:	8b 7d c0             	mov    -0x40(%ebp),%edi
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
 6b0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 6b3:	83 ec 04             	sub    $0x4,%esp
 6b6:	83 ee 01             	sub    $0x1,%esi
 6b9:	6a 01                	push   $0x1
 6bb:	53                   	push   %ebx
 6bc:	57                   	push   %edi
 6bd:	88 45 d7             	mov    %al,-0x29(%ebp)
 6c0:	e8 cc fe ff ff       	call   591 <write>

  while(--i >= 0)
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	39 de                	cmp    %ebx,%esi
 6ca:	75 e4                	jne    6b0 <printint+0x60>
    putc(fd, buf[i]);
}
 6cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6cf:	5b                   	pop    %ebx
 6d0:	5e                   	pop    %esi
 6d1:	5f                   	pop    %edi
 6d2:	5d                   	pop    %ebp
 6d3:	c3                   	ret    
 6d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6d8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6df:	eb 90                	jmp    671 <printint+0x21>
 6e1:	eb 0d                	jmp    6f0 <printf>
 6e3:	90                   	nop
 6e4:	90                   	nop
 6e5:	90                   	nop
 6e6:	90                   	nop
 6e7:	90                   	nop
 6e8:	90                   	nop
 6e9:	90                   	nop
 6ea:	90                   	nop
 6eb:	90                   	nop
 6ec:	90                   	nop
 6ed:	90                   	nop
 6ee:	90                   	nop
 6ef:	90                   	nop

000006f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6f9:	8b 75 0c             	mov    0xc(%ebp),%esi
 6fc:	0f b6 1e             	movzbl (%esi),%ebx
 6ff:	84 db                	test   %bl,%bl
 701:	0f 84 b3 00 00 00    	je     7ba <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 707:	8d 45 10             	lea    0x10(%ebp),%eax
 70a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 70d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 70f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 712:	eb 2f                	jmp    743 <printf+0x53>
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 718:	83 f8 25             	cmp    $0x25,%eax
 71b:	0f 84 a7 00 00 00    	je     7c8 <printf+0xd8>
  write(fd, &c, 1);
 721:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 724:	83 ec 04             	sub    $0x4,%esp
 727:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 72a:	6a 01                	push   $0x1
 72c:	50                   	push   %eax
 72d:	ff 75 08             	pushl  0x8(%ebp)
 730:	e8 5c fe ff ff       	call   591 <write>
 735:	83 c4 10             	add    $0x10,%esp
 738:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 73b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 73f:	84 db                	test   %bl,%bl
 741:	74 77                	je     7ba <printf+0xca>
    if(state == 0){
 743:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 745:	0f be cb             	movsbl %bl,%ecx
 748:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 74b:	74 cb                	je     718 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 74d:	83 ff 25             	cmp    $0x25,%edi
 750:	75 e6                	jne    738 <printf+0x48>
      if(c == 'd'){
 752:	83 f8 64             	cmp    $0x64,%eax
 755:	0f 84 05 01 00 00    	je     860 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 75b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 761:	83 f9 70             	cmp    $0x70,%ecx
 764:	74 72                	je     7d8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 766:	83 f8 73             	cmp    $0x73,%eax
 769:	0f 84 99 00 00 00    	je     808 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 76f:	83 f8 63             	cmp    $0x63,%eax
 772:	0f 84 08 01 00 00    	je     880 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 778:	83 f8 25             	cmp    $0x25,%eax
 77b:	0f 84 ef 00 00 00    	je     870 <printf+0x180>
  write(fd, &c, 1);
 781:	8d 45 e7             	lea    -0x19(%ebp),%eax
 784:	83 ec 04             	sub    $0x4,%esp
 787:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 78b:	6a 01                	push   $0x1
 78d:	50                   	push   %eax
 78e:	ff 75 08             	pushl  0x8(%ebp)
 791:	e8 fb fd ff ff       	call   591 <write>
 796:	83 c4 0c             	add    $0xc,%esp
 799:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 79c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 79f:	6a 01                	push   $0x1
 7a1:	50                   	push   %eax
 7a2:	ff 75 08             	pushl  0x8(%ebp)
 7a5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7a8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 7aa:	e8 e2 fd ff ff       	call   591 <write>
  for(i = 0; fmt[i]; i++){
 7af:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 7b3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7b6:	84 db                	test   %bl,%bl
 7b8:	75 89                	jne    743 <printf+0x53>
    }
  }
}
 7ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7bd:	5b                   	pop    %ebx
 7be:	5e                   	pop    %esi
 7bf:	5f                   	pop    %edi
 7c0:	5d                   	pop    %ebp
 7c1:	c3                   	ret    
 7c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 7c8:	bf 25 00 00 00       	mov    $0x25,%edi
 7cd:	e9 66 ff ff ff       	jmp    738 <printf+0x48>
 7d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 7d8:	83 ec 0c             	sub    $0xc,%esp
 7db:	b9 10 00 00 00       	mov    $0x10,%ecx
 7e0:	6a 00                	push   $0x0
 7e2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 7e5:	8b 45 08             	mov    0x8(%ebp),%eax
 7e8:	8b 17                	mov    (%edi),%edx
 7ea:	e8 61 fe ff ff       	call   650 <printint>
        ap++;
 7ef:	89 f8                	mov    %edi,%eax
 7f1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7f4:	31 ff                	xor    %edi,%edi
        ap++;
 7f6:	83 c0 04             	add    $0x4,%eax
 7f9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 7fc:	e9 37 ff ff ff       	jmp    738 <printf+0x48>
 801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 808:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 80b:	8b 08                	mov    (%eax),%ecx
        ap++;
 80d:	83 c0 04             	add    $0x4,%eax
 810:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 813:	85 c9                	test   %ecx,%ecx
 815:	0f 84 8e 00 00 00    	je     8a9 <printf+0x1b9>
        while(*s != 0){
 81b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 81e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 820:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 822:	84 c0                	test   %al,%al
 824:	0f 84 0e ff ff ff    	je     738 <printf+0x48>
 82a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 82d:	89 de                	mov    %ebx,%esi
 82f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 832:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 835:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 838:	83 ec 04             	sub    $0x4,%esp
          s++;
 83b:	83 c6 01             	add    $0x1,%esi
 83e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 841:	6a 01                	push   $0x1
 843:	57                   	push   %edi
 844:	53                   	push   %ebx
 845:	e8 47 fd ff ff       	call   591 <write>
        while(*s != 0){
 84a:	0f b6 06             	movzbl (%esi),%eax
 84d:	83 c4 10             	add    $0x10,%esp
 850:	84 c0                	test   %al,%al
 852:	75 e4                	jne    838 <printf+0x148>
 854:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 857:	31 ff                	xor    %edi,%edi
 859:	e9 da fe ff ff       	jmp    738 <printf+0x48>
 85e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 860:	83 ec 0c             	sub    $0xc,%esp
 863:	b9 0a 00 00 00       	mov    $0xa,%ecx
 868:	6a 01                	push   $0x1
 86a:	e9 73 ff ff ff       	jmp    7e2 <printf+0xf2>
 86f:	90                   	nop
  write(fd, &c, 1);
 870:	83 ec 04             	sub    $0x4,%esp
 873:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 876:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 879:	6a 01                	push   $0x1
 87b:	e9 21 ff ff ff       	jmp    7a1 <printf+0xb1>
        putc(fd, *ap);
 880:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 883:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 886:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 888:	6a 01                	push   $0x1
        ap++;
 88a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 88d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 890:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 893:	50                   	push   %eax
 894:	ff 75 08             	pushl  0x8(%ebp)
 897:	e8 f5 fc ff ff       	call   591 <write>
        ap++;
 89c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 89f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8a2:	31 ff                	xor    %edi,%edi
 8a4:	e9 8f fe ff ff       	jmp    738 <printf+0x48>
          s = "(null)";
 8a9:	bb 0c 0b 00 00       	mov    $0xb0c,%ebx
        while(*s != 0){
 8ae:	b8 28 00 00 00       	mov    $0x28,%eax
 8b3:	e9 72 ff ff ff       	jmp    82a <printf+0x13a>
 8b8:	66 90                	xchg   %ax,%ax
 8ba:	66 90                	xchg   %ax,%ax
 8bc:	66 90                	xchg   %ax,%ax
 8be:	66 90                	xchg   %ax,%ax

000008c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c1:	a1 94 0e 00 00       	mov    0xe94,%eax
{
 8c6:	89 e5                	mov    %esp,%ebp
 8c8:	57                   	push   %edi
 8c9:	56                   	push   %esi
 8ca:	53                   	push   %ebx
 8cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 8d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d8:	39 c8                	cmp    %ecx,%eax
 8da:	8b 10                	mov    (%eax),%edx
 8dc:	73 32                	jae    910 <free+0x50>
 8de:	39 d1                	cmp    %edx,%ecx
 8e0:	72 04                	jb     8e6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e2:	39 d0                	cmp    %edx,%eax
 8e4:	72 32                	jb     918 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8ec:	39 fa                	cmp    %edi,%edx
 8ee:	74 30                	je     920 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8f3:	8b 50 04             	mov    0x4(%eax),%edx
 8f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8f9:	39 f1                	cmp    %esi,%ecx
 8fb:	74 3a                	je     937 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8fd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8ff:	a3 94 0e 00 00       	mov    %eax,0xe94
}
 904:	5b                   	pop    %ebx
 905:	5e                   	pop    %esi
 906:	5f                   	pop    %edi
 907:	5d                   	pop    %ebp
 908:	c3                   	ret    
 909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 910:	39 d0                	cmp    %edx,%eax
 912:	72 04                	jb     918 <free+0x58>
 914:	39 d1                	cmp    %edx,%ecx
 916:	72 ce                	jb     8e6 <free+0x26>
{
 918:	89 d0                	mov    %edx,%eax
 91a:	eb bc                	jmp    8d8 <free+0x18>
 91c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 920:	03 72 04             	add    0x4(%edx),%esi
 923:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 926:	8b 10                	mov    (%eax),%edx
 928:	8b 12                	mov    (%edx),%edx
 92a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 92d:	8b 50 04             	mov    0x4(%eax),%edx
 930:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 933:	39 f1                	cmp    %esi,%ecx
 935:	75 c6                	jne    8fd <free+0x3d>
    p->s.size += bp->s.size;
 937:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 93a:	a3 94 0e 00 00       	mov    %eax,0xe94
    p->s.size += bp->s.size;
 93f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 942:	8b 53 f8             	mov    -0x8(%ebx),%edx
 945:	89 10                	mov    %edx,(%eax)
}
 947:	5b                   	pop    %ebx
 948:	5e                   	pop    %esi
 949:	5f                   	pop    %edi
 94a:	5d                   	pop    %ebp
 94b:	c3                   	ret    
 94c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000950 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	57                   	push   %edi
 954:	56                   	push   %esi
 955:	53                   	push   %ebx
 956:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 959:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 95c:	8b 15 94 0e 00 00    	mov    0xe94,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 962:	8d 78 07             	lea    0x7(%eax),%edi
 965:	c1 ef 03             	shr    $0x3,%edi
 968:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 96b:	85 d2                	test   %edx,%edx
 96d:	0f 84 9d 00 00 00    	je     a10 <malloc+0xc0>
 973:	8b 02                	mov    (%edx),%eax
 975:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 978:	39 cf                	cmp    %ecx,%edi
 97a:	76 6c                	jbe    9e8 <malloc+0x98>
 97c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 982:	bb 00 10 00 00       	mov    $0x1000,%ebx
 987:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 98a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 991:	eb 0e                	jmp    9a1 <malloc+0x51>
 993:	90                   	nop
 994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 998:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 99a:	8b 48 04             	mov    0x4(%eax),%ecx
 99d:	39 f9                	cmp    %edi,%ecx
 99f:	73 47                	jae    9e8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9a1:	39 05 94 0e 00 00    	cmp    %eax,0xe94
 9a7:	89 c2                	mov    %eax,%edx
 9a9:	75 ed                	jne    998 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 9ab:	83 ec 0c             	sub    $0xc,%esp
 9ae:	56                   	push   %esi
 9af:	e8 45 fc ff ff       	call   5f9 <sbrk>
  if(p == (char*)-1)
 9b4:	83 c4 10             	add    $0x10,%esp
 9b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 9ba:	74 1c                	je     9d8 <malloc+0x88>
  hp->s.size = nu;
 9bc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9bf:	83 ec 0c             	sub    $0xc,%esp
 9c2:	83 c0 08             	add    $0x8,%eax
 9c5:	50                   	push   %eax
 9c6:	e8 f5 fe ff ff       	call   8c0 <free>
  return freep;
 9cb:	8b 15 94 0e 00 00    	mov    0xe94,%edx
      if((p = morecore(nunits)) == 0)
 9d1:	83 c4 10             	add    $0x10,%esp
 9d4:	85 d2                	test   %edx,%edx
 9d6:	75 c0                	jne    998 <malloc+0x48>
        return 0;
  }
}
 9d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9db:	31 c0                	xor    %eax,%eax
}
 9dd:	5b                   	pop    %ebx
 9de:	5e                   	pop    %esi
 9df:	5f                   	pop    %edi
 9e0:	5d                   	pop    %ebp
 9e1:	c3                   	ret    
 9e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9e8:	39 cf                	cmp    %ecx,%edi
 9ea:	74 54                	je     a40 <malloc+0xf0>
        p->s.size -= nunits;
 9ec:	29 f9                	sub    %edi,%ecx
 9ee:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9f4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 9f7:	89 15 94 0e 00 00    	mov    %edx,0xe94
}
 9fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a00:	83 c0 08             	add    $0x8,%eax
}
 a03:	5b                   	pop    %ebx
 a04:	5e                   	pop    %esi
 a05:	5f                   	pop    %edi
 a06:	5d                   	pop    %ebp
 a07:	c3                   	ret    
 a08:	90                   	nop
 a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 a10:	c7 05 94 0e 00 00 98 	movl   $0xe98,0xe94
 a17:	0e 00 00 
 a1a:	c7 05 98 0e 00 00 98 	movl   $0xe98,0xe98
 a21:	0e 00 00 
    base.s.size = 0;
 a24:	b8 98 0e 00 00       	mov    $0xe98,%eax
 a29:	c7 05 9c 0e 00 00 00 	movl   $0x0,0xe9c
 a30:	00 00 00 
 a33:	e9 44 ff ff ff       	jmp    97c <malloc+0x2c>
 a38:	90                   	nop
 a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 a40:	8b 08                	mov    (%eax),%ecx
 a42:	89 0a                	mov    %ecx,(%edx)
 a44:	eb b1                	jmp    9f7 <malloc+0xa7>
