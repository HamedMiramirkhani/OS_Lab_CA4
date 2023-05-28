
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 93 02 00 00       	call   2a9 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 1d 03 00 00       	call   341 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 85 02 00 00       	call   2b1 <exit>
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  30:	55                   	push   %ebp
  31:	89 e5                	mov    %esp,%ebp
  33:	53                   	push   %ebx
  34:	8b 45 08             	mov    0x8(%ebp),%eax
  37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  3a:	89 c2                	mov    %eax,%edx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  40:	83 c1 01             	add    $0x1,%ecx
  43:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  47:	83 c2 01             	add    $0x1,%edx
  4a:	84 db                	test   %bl,%bl
  4c:	88 5a ff             	mov    %bl,-0x1(%edx)
  4f:	75 ef                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  51:	5b                   	pop    %ebx
  52:	5d                   	pop    %ebp
  53:	c3                   	ret    
  54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 55 08             	mov    0x8(%ebp),%edx
  67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  6a:	0f b6 02             	movzbl (%edx),%eax
  6d:	0f b6 19             	movzbl (%ecx),%ebx
  70:	84 c0                	test   %al,%al
  72:	75 1c                	jne    90 <strcmp+0x30>
  74:	eb 2a                	jmp    a0 <strcmp+0x40>
  76:	8d 76 00             	lea    0x0(%esi),%esi
  79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  80:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  83:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  86:	83 c1 01             	add    $0x1,%ecx
  89:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
  8c:	84 c0                	test   %al,%al
  8e:	74 10                	je     a0 <strcmp+0x40>
  90:	38 d8                	cmp    %bl,%al
  92:	74 ec                	je     80 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  94:	29 d8                	sub    %ebx,%eax
}
  96:	5b                   	pop    %ebx
  97:	5d                   	pop    %ebp
  98:	c3                   	ret    
  99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  a2:	29 d8                	sub    %ebx,%eax
}
  a4:	5b                   	pop    %ebx
  a5:	5d                   	pop    %ebp
  a6:	c3                   	ret    
  a7:	89 f6                	mov    %esi,%esi
  a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000b0 <strlen>:

uint
strlen(const char *s)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  b6:	80 39 00             	cmpb   $0x0,(%ecx)
  b9:	74 15                	je     d0 <strlen+0x20>
  bb:	31 d2                	xor    %edx,%edx
  bd:	8d 76 00             	lea    0x0(%esi),%esi
  c0:	83 c2 01             	add    $0x1,%edx
  c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  c7:	89 d0                	mov    %edx,%eax
  c9:	75 f5                	jne    c0 <strlen+0x10>
    ;
  return n;
}
  cb:	5d                   	pop    %ebp
  cc:	c3                   	ret    
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
  d0:	31 c0                	xor    %eax,%eax
}
  d2:	5d                   	pop    %ebp
  d3:	c3                   	ret    
  d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  ed:	89 d7                	mov    %edx,%edi
  ef:	fc                   	cld    
  f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  f2:	89 d0                	mov    %edx,%eax
  f4:	5f                   	pop    %edi
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	89 f6                	mov    %esi,%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <strchr>:

char*
strchr(const char *s, char c)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	53                   	push   %ebx
 104:	8b 45 08             	mov    0x8(%ebp),%eax
 107:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 10a:	0f b6 10             	movzbl (%eax),%edx
 10d:	84 d2                	test   %dl,%dl
 10f:	74 1d                	je     12e <strchr+0x2e>
    if(*s == c)
 111:	38 d3                	cmp    %dl,%bl
 113:	89 d9                	mov    %ebx,%ecx
 115:	75 0d                	jne    124 <strchr+0x24>
 117:	eb 17                	jmp    130 <strchr+0x30>
 119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 120:	38 ca                	cmp    %cl,%dl
 122:	74 0c                	je     130 <strchr+0x30>
  for(; *s; s++)
 124:	83 c0 01             	add    $0x1,%eax
 127:	0f b6 10             	movzbl (%eax),%edx
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strchr+0x20>
      return (char*)s;
  return 0;
 12e:	31 c0                	xor    %eax,%eax
}
 130:	5b                   	pop    %ebx
 131:	5d                   	pop    %ebp
 132:	c3                   	ret    
 133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <gets>:

char*
gets(char *buf, int max)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 146:	31 f6                	xor    %esi,%esi
 148:	89 f3                	mov    %esi,%ebx
{
 14a:	83 ec 1c             	sub    $0x1c,%esp
 14d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 150:	eb 2f                	jmp    181 <gets+0x41>
 152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 158:	8d 45 e7             	lea    -0x19(%ebp),%eax
 15b:	83 ec 04             	sub    $0x4,%esp
 15e:	6a 01                	push   $0x1
 160:	50                   	push   %eax
 161:	6a 00                	push   $0x0
 163:	e8 61 01 00 00       	call   2c9 <read>
    if(cc < 1)
 168:	83 c4 10             	add    $0x10,%esp
 16b:	85 c0                	test   %eax,%eax
 16d:	7e 1c                	jle    18b <gets+0x4b>
      break;
    buf[i++] = c;
 16f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 173:	83 c7 01             	add    $0x1,%edi
 176:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 179:	3c 0a                	cmp    $0xa,%al
 17b:	74 23                	je     1a0 <gets+0x60>
 17d:	3c 0d                	cmp    $0xd,%al
 17f:	74 1f                	je     1a0 <gets+0x60>
  for(i=0; i+1 < max; ){
 181:	83 c3 01             	add    $0x1,%ebx
 184:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 187:	89 fe                	mov    %edi,%esi
 189:	7c cd                	jl     158 <gets+0x18>
 18b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 18d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 190:	c6 03 00             	movb   $0x0,(%ebx)
}
 193:	8d 65 f4             	lea    -0xc(%ebp),%esp
 196:	5b                   	pop    %ebx
 197:	5e                   	pop    %esi
 198:	5f                   	pop    %edi
 199:	5d                   	pop    %ebp
 19a:	c3                   	ret    
 19b:	90                   	nop
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a0:	8b 75 08             	mov    0x8(%ebp),%esi
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	01 de                	add    %ebx,%esi
 1a8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1aa:	c6 03 00             	movb   $0x0,(%ebx)
}
 1ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b0:	5b                   	pop    %ebx
 1b1:	5e                   	pop    %esi
 1b2:	5f                   	pop    %edi
 1b3:	5d                   	pop    %ebp
 1b4:	c3                   	ret    
 1b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c5:	83 ec 08             	sub    $0x8,%esp
 1c8:	6a 00                	push   $0x0
 1ca:	ff 75 08             	pushl  0x8(%ebp)
 1cd:	e8 1f 01 00 00       	call   2f1 <open>
  if(fd < 0)
 1d2:	83 c4 10             	add    $0x10,%esp
 1d5:	85 c0                	test   %eax,%eax
 1d7:	78 27                	js     200 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	ff 75 0c             	pushl  0xc(%ebp)
 1df:	89 c3                	mov    %eax,%ebx
 1e1:	50                   	push   %eax
 1e2:	e8 22 01 00 00       	call   309 <fstat>
  close(fd);
 1e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1ea:	89 c6                	mov    %eax,%esi
  close(fd);
 1ec:	e8 e8 00 00 00       	call   2d9 <close>
  return r;
 1f1:	83 c4 10             	add    $0x10,%esp
}
 1f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1f7:	89 f0                	mov    %esi,%eax
 1f9:	5b                   	pop    %ebx
 1fa:	5e                   	pop    %esi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 200:	be ff ff ff ff       	mov    $0xffffffff,%esi
 205:	eb ed                	jmp    1f4 <stat+0x34>
 207:	89 f6                	mov    %esi,%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <atoi>:

int
atoi(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 217:	0f be 11             	movsbl (%ecx),%edx
 21a:	8d 42 d0             	lea    -0x30(%edx),%eax
 21d:	3c 09                	cmp    $0x9,%al
  n = 0;
 21f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 224:	77 1f                	ja     245 <atoi+0x35>
 226:	8d 76 00             	lea    0x0(%esi),%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 230:	8d 04 80             	lea    (%eax,%eax,4),%eax
 233:	83 c1 01             	add    $0x1,%ecx
 236:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 23a:	0f be 11             	movsbl (%ecx),%edx
 23d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 240:	80 fb 09             	cmp    $0x9,%bl
 243:	76 eb                	jbe    230 <atoi+0x20>
  return n;
}
 245:	5b                   	pop    %ebx
 246:	5d                   	pop    %ebp
 247:	c3                   	ret    
 248:	90                   	nop
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	56                   	push   %esi
 254:	53                   	push   %ebx
 255:	8b 5d 10             	mov    0x10(%ebp),%ebx
 258:	8b 45 08             	mov    0x8(%ebp),%eax
 25b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 25e:	85 db                	test   %ebx,%ebx
 260:	7e 14                	jle    276 <memmove+0x26>
 262:	31 d2                	xor    %edx,%edx
 264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 268:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 26c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 26f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 272:	39 d3                	cmp    %edx,%ebx
 274:	75 f2                	jne    268 <memmove+0x18>
  return vdst;
}
 276:	5b                   	pop    %ebx
 277:	5e                   	pop    %esi
 278:	5d                   	pop    %ebp
 279:	c3                   	ret    
 27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000280 <srand>:

static uint seed = 1;

void
srand(uint s)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
  seed = s;
 283:	8b 45 08             	mov    0x8(%ebp),%eax
}
 286:	5d                   	pop    %ebp
  seed = s;
 287:	a3 54 0a 00 00       	mov    %eax,0xa54
}
 28c:	c3                   	ret    
 28d:	8d 76 00             	lea    0x0(%esi),%esi

00000290 <random>:

uint
random(void)
{
  seed = seed
    * 1103515245
 290:	69 05 54 0a 00 00 6d 	imul   $0x41c64e6d,0xa54,%eax
 297:	4e c6 41 
{
 29a:	55                   	push   %ebp
 29b:	89 e5                	mov    %esp,%ebp
    + 12345
    % (1 << 31);
  return seed;
}
 29d:	5d                   	pop    %ebp
    + 12345
 29e:	05 39 30 00 00       	add    $0x3039,%eax
  seed = seed
 2a3:	a3 54 0a 00 00       	mov    %eax,0xa54
}
 2a8:	c3                   	ret    

000002a9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a9:	b8 01 00 00 00       	mov    $0x1,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    

000002b1 <exit>:
SYSCALL(exit)
 2b1:	b8 02 00 00 00       	mov    $0x2,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret    

000002b9 <wait>:
SYSCALL(wait)
 2b9:	b8 03 00 00 00       	mov    $0x3,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <pipe>:
SYSCALL(pipe)
 2c1:	b8 04 00 00 00       	mov    $0x4,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <read>:
SYSCALL(read)
 2c9:	b8 05 00 00 00       	mov    $0x5,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <write>:
SYSCALL(write)
 2d1:	b8 10 00 00 00       	mov    $0x10,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <close>:
SYSCALL(close)
 2d9:	b8 15 00 00 00       	mov    $0x15,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <kill>:
SYSCALL(kill)
 2e1:	b8 06 00 00 00       	mov    $0x6,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <exec>:
SYSCALL(exec)
 2e9:	b8 07 00 00 00       	mov    $0x7,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <open>:
SYSCALL(open)
 2f1:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <mknod>:
SYSCALL(mknod)
 2f9:	b8 11 00 00 00       	mov    $0x11,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <unlink>:
SYSCALL(unlink)
 301:	b8 12 00 00 00       	mov    $0x12,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <fstat>:
SYSCALL(fstat)
 309:	b8 08 00 00 00       	mov    $0x8,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <link>:
SYSCALL(link)
 311:	b8 13 00 00 00       	mov    $0x13,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <mkdir>:
SYSCALL(mkdir)
 319:	b8 14 00 00 00       	mov    $0x14,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <chdir>:
SYSCALL(chdir)
 321:	b8 09 00 00 00       	mov    $0x9,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <dup>:
SYSCALL(dup)
 329:	b8 0a 00 00 00       	mov    $0xa,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <getpid>:
SYSCALL(getpid)
 331:	b8 0b 00 00 00       	mov    $0xb,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <sbrk>:
SYSCALL(sbrk)
 339:	b8 0c 00 00 00       	mov    $0xc,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <sleep>:
SYSCALL(sleep)
 341:	b8 0d 00 00 00       	mov    $0xd,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <uptime>:
SYSCALL(uptime)
 349:	b8 0e 00 00 00       	mov    $0xe,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <sem_init>:
SYSCALL(sem_init)
 351:	b8 16 00 00 00       	mov    $0x16,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <sem_acquire>:
SYSCALL(sem_acquire)
 359:	b8 17 00 00 00       	mov    $0x17,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <sem_release>:
SYSCALL(sem_release)
 361:	b8 18 00 00 00       	mov    $0x18,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    
 369:	66 90                	xchg   %ax,%ax
 36b:	66 90                	xchg   %ax,%ax
 36d:	66 90                	xchg   %ax,%ax
 36f:	90                   	nop

00000370 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 379:	85 d2                	test   %edx,%edx
{
 37b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 37e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 380:	79 76                	jns    3f8 <printint+0x88>
 382:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 386:	74 70                	je     3f8 <printint+0x88>
    x = -xx;
 388:	f7 d8                	neg    %eax
    neg = 1;
 38a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 391:	31 f6                	xor    %esi,%esi
 393:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 396:	eb 0a                	jmp    3a2 <printint+0x32>
 398:	90                   	nop
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 3a0:	89 fe                	mov    %edi,%esi
 3a2:	31 d2                	xor    %edx,%edx
 3a4:	8d 7e 01             	lea    0x1(%esi),%edi
 3a7:	f7 f1                	div    %ecx
 3a9:	0f b6 92 70 07 00 00 	movzbl 0x770(%edx),%edx
  }while((x /= base) != 0);
 3b0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 3b2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 3b5:	75 e9                	jne    3a0 <printint+0x30>
  if(neg)
 3b7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3ba:	85 c0                	test   %eax,%eax
 3bc:	74 08                	je     3c6 <printint+0x56>
    buf[i++] = '-';
 3be:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 3c3:	8d 7e 02             	lea    0x2(%esi),%edi
 3c6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 3ca:	8b 7d c0             	mov    -0x40(%ebp),%edi
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 3d3:	83 ec 04             	sub    $0x4,%esp
 3d6:	83 ee 01             	sub    $0x1,%esi
 3d9:	6a 01                	push   $0x1
 3db:	53                   	push   %ebx
 3dc:	57                   	push   %edi
 3dd:	88 45 d7             	mov    %al,-0x29(%ebp)
 3e0:	e8 ec fe ff ff       	call   2d1 <write>

  while(--i >= 0)
 3e5:	83 c4 10             	add    $0x10,%esp
 3e8:	39 de                	cmp    %ebx,%esi
 3ea:	75 e4                	jne    3d0 <printint+0x60>
    putc(fd, buf[i]);
}
 3ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ef:	5b                   	pop    %ebx
 3f0:	5e                   	pop    %esi
 3f1:	5f                   	pop    %edi
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    
 3f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3f8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3ff:	eb 90                	jmp    391 <printint+0x21>
 401:	eb 0d                	jmp    410 <printf>
 403:	90                   	nop
 404:	90                   	nop
 405:	90                   	nop
 406:	90                   	nop
 407:	90                   	nop
 408:	90                   	nop
 409:	90                   	nop
 40a:	90                   	nop
 40b:	90                   	nop
 40c:	90                   	nop
 40d:	90                   	nop
 40e:	90                   	nop
 40f:	90                   	nop

00000410 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 419:	8b 75 0c             	mov    0xc(%ebp),%esi
 41c:	0f b6 1e             	movzbl (%esi),%ebx
 41f:	84 db                	test   %bl,%bl
 421:	0f 84 b3 00 00 00    	je     4da <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 427:	8d 45 10             	lea    0x10(%ebp),%eax
 42a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 42d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 42f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 432:	eb 2f                	jmp    463 <printf+0x53>
 434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 438:	83 f8 25             	cmp    $0x25,%eax
 43b:	0f 84 a7 00 00 00    	je     4e8 <printf+0xd8>
  write(fd, &c, 1);
 441:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 444:	83 ec 04             	sub    $0x4,%esp
 447:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 44a:	6a 01                	push   $0x1
 44c:	50                   	push   %eax
 44d:	ff 75 08             	pushl  0x8(%ebp)
 450:	e8 7c fe ff ff       	call   2d1 <write>
 455:	83 c4 10             	add    $0x10,%esp
 458:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 45b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 45f:	84 db                	test   %bl,%bl
 461:	74 77                	je     4da <printf+0xca>
    if(state == 0){
 463:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 465:	0f be cb             	movsbl %bl,%ecx
 468:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 46b:	74 cb                	je     438 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 46d:	83 ff 25             	cmp    $0x25,%edi
 470:	75 e6                	jne    458 <printf+0x48>
      if(c == 'd'){
 472:	83 f8 64             	cmp    $0x64,%eax
 475:	0f 84 05 01 00 00    	je     580 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 47b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 481:	83 f9 70             	cmp    $0x70,%ecx
 484:	74 72                	je     4f8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 486:	83 f8 73             	cmp    $0x73,%eax
 489:	0f 84 99 00 00 00    	je     528 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 48f:	83 f8 63             	cmp    $0x63,%eax
 492:	0f 84 08 01 00 00    	je     5a0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 498:	83 f8 25             	cmp    $0x25,%eax
 49b:	0f 84 ef 00 00 00    	je     590 <printf+0x180>
  write(fd, &c, 1);
 4a1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4a4:	83 ec 04             	sub    $0x4,%esp
 4a7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4ab:	6a 01                	push   $0x1
 4ad:	50                   	push   %eax
 4ae:	ff 75 08             	pushl  0x8(%ebp)
 4b1:	e8 1b fe ff ff       	call   2d1 <write>
 4b6:	83 c4 0c             	add    $0xc,%esp
 4b9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4bc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 4bf:	6a 01                	push   $0x1
 4c1:	50                   	push   %eax
 4c2:	ff 75 08             	pushl  0x8(%ebp)
 4c5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4c8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 4ca:	e8 02 fe ff ff       	call   2d1 <write>
  for(i = 0; fmt[i]; i++){
 4cf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 4d3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4d6:	84 db                	test   %bl,%bl
 4d8:	75 89                	jne    463 <printf+0x53>
    }
  }
}
 4da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4dd:	5b                   	pop    %ebx
 4de:	5e                   	pop    %esi
 4df:	5f                   	pop    %edi
 4e0:	5d                   	pop    %ebp
 4e1:	c3                   	ret    
 4e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 4e8:	bf 25 00 00 00       	mov    $0x25,%edi
 4ed:	e9 66 ff ff ff       	jmp    458 <printf+0x48>
 4f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4f8:	83 ec 0c             	sub    $0xc,%esp
 4fb:	b9 10 00 00 00       	mov    $0x10,%ecx
 500:	6a 00                	push   $0x0
 502:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 505:	8b 45 08             	mov    0x8(%ebp),%eax
 508:	8b 17                	mov    (%edi),%edx
 50a:	e8 61 fe ff ff       	call   370 <printint>
        ap++;
 50f:	89 f8                	mov    %edi,%eax
 511:	83 c4 10             	add    $0x10,%esp
      state = 0;
 514:	31 ff                	xor    %edi,%edi
        ap++;
 516:	83 c0 04             	add    $0x4,%eax
 519:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 51c:	e9 37 ff ff ff       	jmp    458 <printf+0x48>
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 528:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 52b:	8b 08                	mov    (%eax),%ecx
        ap++;
 52d:	83 c0 04             	add    $0x4,%eax
 530:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 533:	85 c9                	test   %ecx,%ecx
 535:	0f 84 8e 00 00 00    	je     5c9 <printf+0x1b9>
        while(*s != 0){
 53b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 53e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 540:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 542:	84 c0                	test   %al,%al
 544:	0f 84 0e ff ff ff    	je     458 <printf+0x48>
 54a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 54d:	89 de                	mov    %ebx,%esi
 54f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 552:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 555:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 558:	83 ec 04             	sub    $0x4,%esp
          s++;
 55b:	83 c6 01             	add    $0x1,%esi
 55e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 561:	6a 01                	push   $0x1
 563:	57                   	push   %edi
 564:	53                   	push   %ebx
 565:	e8 67 fd ff ff       	call   2d1 <write>
        while(*s != 0){
 56a:	0f b6 06             	movzbl (%esi),%eax
 56d:	83 c4 10             	add    $0x10,%esp
 570:	84 c0                	test   %al,%al
 572:	75 e4                	jne    558 <printf+0x148>
 574:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 577:	31 ff                	xor    %edi,%edi
 579:	e9 da fe ff ff       	jmp    458 <printf+0x48>
 57e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 580:	83 ec 0c             	sub    $0xc,%esp
 583:	b9 0a 00 00 00       	mov    $0xa,%ecx
 588:	6a 01                	push   $0x1
 58a:	e9 73 ff ff ff       	jmp    502 <printf+0xf2>
 58f:	90                   	nop
  write(fd, &c, 1);
 590:	83 ec 04             	sub    $0x4,%esp
 593:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 596:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 599:	6a 01                	push   $0x1
 59b:	e9 21 ff ff ff       	jmp    4c1 <printf+0xb1>
        putc(fd, *ap);
 5a0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 5a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5a6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 5a8:	6a 01                	push   $0x1
        ap++;
 5aa:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 5ad:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 5b0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5b3:	50                   	push   %eax
 5b4:	ff 75 08             	pushl  0x8(%ebp)
 5b7:	e8 15 fd ff ff       	call   2d1 <write>
        ap++;
 5bc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 5bf:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5c2:	31 ff                	xor    %edi,%edi
 5c4:	e9 8f fe ff ff       	jmp    458 <printf+0x48>
          s = "(null)";
 5c9:	bb 68 07 00 00       	mov    $0x768,%ebx
        while(*s != 0){
 5ce:	b8 28 00 00 00       	mov    $0x28,%eax
 5d3:	e9 72 ff ff ff       	jmp    54a <printf+0x13a>
 5d8:	66 90                	xchg   %ax,%ax
 5da:	66 90                	xchg   %ax,%ax
 5dc:	66 90                	xchg   %ax,%ax
 5de:	66 90                	xchg   %ax,%ax

000005e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e1:	a1 58 0a 00 00       	mov    0xa58,%eax
{
 5e6:	89 e5                	mov    %esp,%ebp
 5e8:	57                   	push   %edi
 5e9:	56                   	push   %esi
 5ea:	53                   	push   %ebx
 5eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 5f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f8:	39 c8                	cmp    %ecx,%eax
 5fa:	8b 10                	mov    (%eax),%edx
 5fc:	73 32                	jae    630 <free+0x50>
 5fe:	39 d1                	cmp    %edx,%ecx
 600:	72 04                	jb     606 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 602:	39 d0                	cmp    %edx,%eax
 604:	72 32                	jb     638 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 606:	8b 73 fc             	mov    -0x4(%ebx),%esi
 609:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 60c:	39 fa                	cmp    %edi,%edx
 60e:	74 30                	je     640 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 610:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 613:	8b 50 04             	mov    0x4(%eax),%edx
 616:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 619:	39 f1                	cmp    %esi,%ecx
 61b:	74 3a                	je     657 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 61d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 61f:	a3 58 0a 00 00       	mov    %eax,0xa58
}
 624:	5b                   	pop    %ebx
 625:	5e                   	pop    %esi
 626:	5f                   	pop    %edi
 627:	5d                   	pop    %ebp
 628:	c3                   	ret    
 629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 630:	39 d0                	cmp    %edx,%eax
 632:	72 04                	jb     638 <free+0x58>
 634:	39 d1                	cmp    %edx,%ecx
 636:	72 ce                	jb     606 <free+0x26>
{
 638:	89 d0                	mov    %edx,%eax
 63a:	eb bc                	jmp    5f8 <free+0x18>
 63c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 640:	03 72 04             	add    0x4(%edx),%esi
 643:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 646:	8b 10                	mov    (%eax),%edx
 648:	8b 12                	mov    (%edx),%edx
 64a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 64d:	8b 50 04             	mov    0x4(%eax),%edx
 650:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 653:	39 f1                	cmp    %esi,%ecx
 655:	75 c6                	jne    61d <free+0x3d>
    p->s.size += bp->s.size;
 657:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 65a:	a3 58 0a 00 00       	mov    %eax,0xa58
    p->s.size += bp->s.size;
 65f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 662:	8b 53 f8             	mov    -0x8(%ebx),%edx
 665:	89 10                	mov    %edx,(%eax)
}
 667:	5b                   	pop    %ebx
 668:	5e                   	pop    %esi
 669:	5f                   	pop    %edi
 66a:	5d                   	pop    %ebp
 66b:	c3                   	ret    
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000670 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	53                   	push   %ebx
 676:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 679:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 67c:	8b 15 58 0a 00 00    	mov    0xa58,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 682:	8d 78 07             	lea    0x7(%eax),%edi
 685:	c1 ef 03             	shr    $0x3,%edi
 688:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 68b:	85 d2                	test   %edx,%edx
 68d:	0f 84 9d 00 00 00    	je     730 <malloc+0xc0>
 693:	8b 02                	mov    (%edx),%eax
 695:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 698:	39 cf                	cmp    %ecx,%edi
 69a:	76 6c                	jbe    708 <malloc+0x98>
 69c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 6a2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6a7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 6aa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6b1:	eb 0e                	jmp    6c1 <malloc+0x51>
 6b3:	90                   	nop
 6b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6ba:	8b 48 04             	mov    0x4(%eax),%ecx
 6bd:	39 f9                	cmp    %edi,%ecx
 6bf:	73 47                	jae    708 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6c1:	39 05 58 0a 00 00    	cmp    %eax,0xa58
 6c7:	89 c2                	mov    %eax,%edx
 6c9:	75 ed                	jne    6b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 6cb:	83 ec 0c             	sub    $0xc,%esp
 6ce:	56                   	push   %esi
 6cf:	e8 65 fc ff ff       	call   339 <sbrk>
  if(p == (char*)-1)
 6d4:	83 c4 10             	add    $0x10,%esp
 6d7:	83 f8 ff             	cmp    $0xffffffff,%eax
 6da:	74 1c                	je     6f8 <malloc+0x88>
  hp->s.size = nu;
 6dc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6df:	83 ec 0c             	sub    $0xc,%esp
 6e2:	83 c0 08             	add    $0x8,%eax
 6e5:	50                   	push   %eax
 6e6:	e8 f5 fe ff ff       	call   5e0 <free>
  return freep;
 6eb:	8b 15 58 0a 00 00    	mov    0xa58,%edx
      if((p = morecore(nunits)) == 0)
 6f1:	83 c4 10             	add    $0x10,%esp
 6f4:	85 d2                	test   %edx,%edx
 6f6:	75 c0                	jne    6b8 <malloc+0x48>
        return 0;
  }
}
 6f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6fb:	31 c0                	xor    %eax,%eax
}
 6fd:	5b                   	pop    %ebx
 6fe:	5e                   	pop    %esi
 6ff:	5f                   	pop    %edi
 700:	5d                   	pop    %ebp
 701:	c3                   	ret    
 702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 708:	39 cf                	cmp    %ecx,%edi
 70a:	74 54                	je     760 <malloc+0xf0>
        p->s.size -= nunits;
 70c:	29 f9                	sub    %edi,%ecx
 70e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 711:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 714:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 717:	89 15 58 0a 00 00    	mov    %edx,0xa58
}
 71d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 720:	83 c0 08             	add    $0x8,%eax
}
 723:	5b                   	pop    %ebx
 724:	5e                   	pop    %esi
 725:	5f                   	pop    %edi
 726:	5d                   	pop    %ebp
 727:	c3                   	ret    
 728:	90                   	nop
 729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 730:	c7 05 58 0a 00 00 5c 	movl   $0xa5c,0xa58
 737:	0a 00 00 
 73a:	c7 05 5c 0a 00 00 5c 	movl   $0xa5c,0xa5c
 741:	0a 00 00 
    base.s.size = 0;
 744:	b8 5c 0a 00 00       	mov    $0xa5c,%eax
 749:	c7 05 60 0a 00 00 00 	movl   $0x0,0xa60
 750:	00 00 00 
 753:	e9 44 ff ff ff       	jmp    69c <malloc+0x2c>
 758:	90                   	nop
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 760:	8b 08                	mov    (%eax),%ecx
 762:	89 0a                	mov    %ecx,(%edx)
 764:	eb b1                	jmp    717 <malloc+0xa7>
