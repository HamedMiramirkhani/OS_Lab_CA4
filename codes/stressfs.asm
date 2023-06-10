
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   7:	b8 30 00 00 00       	mov    $0x30,%eax
{
   c:	ff 71 fc             	pushl  -0x4(%ecx)
   f:	55                   	push   %ebp
  10:	89 e5                	mov    %esp,%ebp
  12:	57                   	push   %edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  16:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi

  for(i = 0; i < 4; i++)
  1c:	31 db                	xor    %ebx,%ebx
{
  1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  24:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  2b:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  32:	74 72 65 
  printf(1, "stressfs starting\n");
  35:	68 98 08 00 00       	push   $0x898
  3a:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  3c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  43:	73 66 73 
  printf(1, "stressfs starting\n");
  46:	e8 f5 04 00 00       	call   540 <printf>
  memset(data, 'a', sizeof(data));
  4b:	83 c4 0c             	add    $0xc,%esp
  4e:	68 00 02 00 00       	push   $0x200
  53:	6a 61                	push   $0x61
  55:	56                   	push   %esi
  56:	e8 95 01 00 00       	call   1f0 <memset>
  5b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  5e:	e8 56 03 00 00       	call   3b9 <fork>
  63:	85 c0                	test   %eax,%eax
  65:	0f 8f bf 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  6b:	83 c3 01             	add    $0x1,%ebx
  6e:	83 fb 04             	cmp    $0x4,%ebx
  71:	75 eb                	jne    5e <main+0x5e>
  73:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  78:	83 ec 04             	sub    $0x4,%esp
  7b:	53                   	push   %ebx
  7c:	68 ab 08 00 00       	push   $0x8ab

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  81:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  86:	6a 01                	push   $0x1
  88:	e8 b3 04 00 00       	call   540 <printf>
  path[8] += i;
  8d:	89 f8                	mov    %edi,%eax
  8f:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  95:	5f                   	pop    %edi
  96:	58                   	pop    %eax
  97:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  9d:	68 02 02 00 00       	push   $0x202
  a2:	50                   	push   %eax
  a3:	e8 59 03 00 00       	call   401 <open>
  a8:	83 c4 10             	add    $0x10,%esp
  ab:	89 c7                	mov    %eax,%edi
  ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b0:	83 ec 04             	sub    $0x4,%esp
  b3:	68 00 02 00 00       	push   $0x200
  b8:	56                   	push   %esi
  b9:	57                   	push   %edi
  ba:	e8 22 03 00 00       	call   3e1 <write>
  for(i = 0; i < 20; i++)
  bf:	83 c4 10             	add    $0x10,%esp
  c2:	83 eb 01             	sub    $0x1,%ebx
  c5:	75 e9                	jne    b0 <main+0xb0>
  close(fd);
  c7:	83 ec 0c             	sub    $0xc,%esp
  ca:	57                   	push   %edi
  cb:	e8 19 03 00 00       	call   3e9 <close>

  printf(1, "read\n");
  d0:	58                   	pop    %eax
  d1:	5a                   	pop    %edx
  d2:	68 b5 08 00 00       	push   $0x8b5
  d7:	6a 01                	push   $0x1
  d9:	e8 62 04 00 00       	call   540 <printf>

  fd = open(path, O_RDONLY);
  de:	59                   	pop    %ecx
  df:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  e5:	5b                   	pop    %ebx
  e6:	6a 00                	push   $0x0
  e8:	50                   	push   %eax
  e9:	bb 14 00 00 00       	mov    $0x14,%ebx
  ee:	e8 0e 03 00 00       	call   401 <open>
  f3:	83 c4 10             	add    $0x10,%esp
  f6:	89 c7                	mov    %eax,%edi
  f8:	90                   	nop
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 ca 02 00 00       	call   3d9 <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 c9 02 00 00       	call   3e9 <close>

  wait();
 120:	e8 a4 02 00 00       	call   3c9 <wait>

  exit();
 125:	e8 97 02 00 00       	call   3c1 <exit>
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 47 ff ff ff       	jmp    78 <main+0x78>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 45 08             	mov    0x8(%ebp),%eax
 147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 14a:	89 c2                	mov    %eax,%edx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 150:	83 c1 01             	add    $0x1,%ecx
 153:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 157:	83 c2 01             	add    $0x1,%edx
 15a:	84 db                	test   %bl,%bl
 15c:	88 5a ff             	mov    %bl,-0x1(%edx)
 15f:	75 ef                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 161:	5b                   	pop    %ebx
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    
 164:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 16a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 55 08             	mov    0x8(%ebp),%edx
 177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 17a:	0f b6 02             	movzbl (%edx),%eax
 17d:	0f b6 19             	movzbl (%ecx),%ebx
 180:	84 c0                	test   %al,%al
 182:	75 1c                	jne    1a0 <strcmp+0x30>
 184:	eb 2a                	jmp    1b0 <strcmp+0x40>
 186:	8d 76 00             	lea    0x0(%esi),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 190:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 193:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 196:	83 c1 01             	add    $0x1,%ecx
 199:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 19c:	84 c0                	test   %al,%al
 19e:	74 10                	je     1b0 <strcmp+0x40>
 1a0:	38 d8                	cmp    %bl,%al
 1a2:	74 ec                	je     190 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1a4:	29 d8                	sub    %ebx,%eax
}
 1a6:	5b                   	pop    %ebx
 1a7:	5d                   	pop    %ebp
 1a8:	c3                   	ret    
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1b2:	29 d8                	sub    %ebx,%eax
}
 1b4:	5b                   	pop    %ebx
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	89 f6                	mov    %esi,%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <strlen>:

uint
strlen(const char *s)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1c6:	80 39 00             	cmpb   $0x0,(%ecx)
 1c9:	74 15                	je     1e0 <strlen+0x20>
 1cb:	31 d2                	xor    %edx,%edx
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	83 c2 01             	add    $0x1,%edx
 1d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1d7:	89 d0                	mov    %edx,%eax
 1d9:	75 f5                	jne    1d0 <strlen+0x10>
    ;
  return n;
}
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret    
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 1e0:	31 c0                	xor    %eax,%eax
}
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    
 1e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	89 d7                	mov    %edx,%edi
 1ff:	fc                   	cld    
 200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 202:	89 d0                	mov    %edx,%eax
 204:	5f                   	pop    %edi
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	89 f6                	mov    %esi,%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <strchr>:

char*
strchr(const char *s, char c)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 45 08             	mov    0x8(%ebp),%eax
 217:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 21a:	0f b6 10             	movzbl (%eax),%edx
 21d:	84 d2                	test   %dl,%dl
 21f:	74 1d                	je     23e <strchr+0x2e>
    if(*s == c)
 221:	38 d3                	cmp    %dl,%bl
 223:	89 d9                	mov    %ebx,%ecx
 225:	75 0d                	jne    234 <strchr+0x24>
 227:	eb 17                	jmp    240 <strchr+0x30>
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 230:	38 ca                	cmp    %cl,%dl
 232:	74 0c                	je     240 <strchr+0x30>
  for(; *s; s++)
 234:	83 c0 01             	add    $0x1,%eax
 237:	0f b6 10             	movzbl (%eax),%edx
 23a:	84 d2                	test   %dl,%dl
 23c:	75 f2                	jne    230 <strchr+0x20>
      return (char*)s;
  return 0;
 23e:	31 c0                	xor    %eax,%eax
}
 240:	5b                   	pop    %ebx
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    
 243:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <gets>:

char*
gets(char *buf, int max)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	56                   	push   %esi
 255:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 256:	31 f6                	xor    %esi,%esi
 258:	89 f3                	mov    %esi,%ebx
{
 25a:	83 ec 1c             	sub    $0x1c,%esp
 25d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 260:	eb 2f                	jmp    291 <gets+0x41>
 262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 268:	8d 45 e7             	lea    -0x19(%ebp),%eax
 26b:	83 ec 04             	sub    $0x4,%esp
 26e:	6a 01                	push   $0x1
 270:	50                   	push   %eax
 271:	6a 00                	push   $0x0
 273:	e8 61 01 00 00       	call   3d9 <read>
    if(cc < 1)
 278:	83 c4 10             	add    $0x10,%esp
 27b:	85 c0                	test   %eax,%eax
 27d:	7e 1c                	jle    29b <gets+0x4b>
      break;
    buf[i++] = c;
 27f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 283:	83 c7 01             	add    $0x1,%edi
 286:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 289:	3c 0a                	cmp    $0xa,%al
 28b:	74 23                	je     2b0 <gets+0x60>
 28d:	3c 0d                	cmp    $0xd,%al
 28f:	74 1f                	je     2b0 <gets+0x60>
  for(i=0; i+1 < max; ){
 291:	83 c3 01             	add    $0x1,%ebx
 294:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 297:	89 fe                	mov    %edi,%esi
 299:	7c cd                	jl     268 <gets+0x18>
 29b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 29d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2a0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a6:	5b                   	pop    %ebx
 2a7:	5e                   	pop    %esi
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret    
 2ab:	90                   	nop
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2b0:	8b 75 08             	mov    0x8(%ebp),%esi
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	01 de                	add    %ebx,%esi
 2b8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2ba:	c6 03 00             	movb   $0x0,(%ebx)
}
 2bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2c0:	5b                   	pop    %ebx
 2c1:	5e                   	pop    %esi
 2c2:	5f                   	pop    %edi
 2c3:	5d                   	pop    %ebp
 2c4:	c3                   	ret    
 2c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	6a 00                	push   $0x0
 2da:	ff 75 08             	pushl  0x8(%ebp)
 2dd:	e8 1f 01 00 00       	call   401 <open>
  if(fd < 0)
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	85 c0                	test   %eax,%eax
 2e7:	78 27                	js     310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	ff 75 0c             	pushl  0xc(%ebp)
 2ef:	89 c3                	mov    %eax,%ebx
 2f1:	50                   	push   %eax
 2f2:	e8 22 01 00 00       	call   419 <fstat>
  close(fd);
 2f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2fa:	89 c6                	mov    %eax,%esi
  close(fd);
 2fc:	e8 e8 00 00 00       	call   3e9 <close>
  return r;
 301:	83 c4 10             	add    $0x10,%esp
}
 304:	8d 65 f8             	lea    -0x8(%ebp),%esp
 307:	89 f0                	mov    %esi,%eax
 309:	5b                   	pop    %ebx
 30a:	5e                   	pop    %esi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    
 30d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 310:	be ff ff ff ff       	mov    $0xffffffff,%esi
 315:	eb ed                	jmp    304 <stat+0x34>
 317:	89 f6                	mov    %esi,%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000320 <atoi>:

int
atoi(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 327:	0f be 11             	movsbl (%ecx),%edx
 32a:	8d 42 d0             	lea    -0x30(%edx),%eax
 32d:	3c 09                	cmp    $0x9,%al
  n = 0;
 32f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 334:	77 1f                	ja     355 <atoi+0x35>
 336:	8d 76 00             	lea    0x0(%esi),%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 340:	8d 04 80             	lea    (%eax,%eax,4),%eax
 343:	83 c1 01             	add    $0x1,%ecx
 346:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 34a:	0f be 11             	movsbl (%ecx),%edx
 34d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
  return n;
}
 355:	5b                   	pop    %ebx
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    
 358:	90                   	nop
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
 365:	8b 5d 10             	mov    0x10(%ebp),%ebx
 368:	8b 45 08             	mov    0x8(%ebp),%eax
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36e:	85 db                	test   %ebx,%ebx
 370:	7e 14                	jle    386 <memmove+0x26>
 372:	31 d2                	xor    %edx,%edx
 374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 378:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 37c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 37f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 382:	39 d3                	cmp    %edx,%ebx
 384:	75 f2                	jne    378 <memmove+0x18>
  return vdst;
}
 386:	5b                   	pop    %ebx
 387:	5e                   	pop    %esi
 388:	5d                   	pop    %ebp
 389:	c3                   	ret    
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000390 <srand>:

static uint seed = 1;

void
srand(uint s)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
  seed = s;
 393:	8b 45 08             	mov    0x8(%ebp),%eax
}
 396:	5d                   	pop    %ebp
  seed = s;
 397:	a3 b4 0b 00 00       	mov    %eax,0xbb4
}
 39c:	c3                   	ret    
 39d:	8d 76 00             	lea    0x0(%esi),%esi

000003a0 <random>:

uint
random(void)
{
  seed = seed
    * 1103515245
 3a0:	69 05 b4 0b 00 00 6d 	imul   $0x41c64e6d,0xbb4,%eax
 3a7:	4e c6 41 
{
 3aa:	55                   	push   %ebp
 3ab:	89 e5                	mov    %esp,%ebp
    + 12345
    % (1 << 31);
  return seed;
}
 3ad:	5d                   	pop    %ebp
    + 12345
 3ae:	05 39 30 00 00       	add    $0x3039,%eax
  seed = seed
 3b3:	a3 b4 0b 00 00       	mov    %eax,0xbb4
}
 3b8:	c3                   	ret    

000003b9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3b9:	b8 01 00 00 00       	mov    $0x1,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <exit>:
SYSCALL(exit)
 3c1:	b8 02 00 00 00       	mov    $0x2,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <wait>:
SYSCALL(wait)
 3c9:	b8 03 00 00 00       	mov    $0x3,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <pipe>:
SYSCALL(pipe)
 3d1:	b8 04 00 00 00       	mov    $0x4,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <read>:
SYSCALL(read)
 3d9:	b8 05 00 00 00       	mov    $0x5,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <write>:
SYSCALL(write)
 3e1:	b8 10 00 00 00       	mov    $0x10,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <close>:
SYSCALL(close)
 3e9:	b8 15 00 00 00       	mov    $0x15,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <kill>:
SYSCALL(kill)
 3f1:	b8 06 00 00 00       	mov    $0x6,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <exec>:
SYSCALL(exec)
 3f9:	b8 07 00 00 00       	mov    $0x7,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <open>:
SYSCALL(open)
 401:	b8 0f 00 00 00       	mov    $0xf,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <mknod>:
SYSCALL(mknod)
 409:	b8 11 00 00 00       	mov    $0x11,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <unlink>:
SYSCALL(unlink)
 411:	b8 12 00 00 00       	mov    $0x12,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <fstat>:
SYSCALL(fstat)
 419:	b8 08 00 00 00       	mov    $0x8,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <link>:
SYSCALL(link)
 421:	b8 13 00 00 00       	mov    $0x13,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <mkdir>:
SYSCALL(mkdir)
 429:	b8 14 00 00 00       	mov    $0x14,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <chdir>:
SYSCALL(chdir)
 431:	b8 09 00 00 00       	mov    $0x9,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <dup>:
SYSCALL(dup)
 439:	b8 0a 00 00 00       	mov    $0xa,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <getpid>:
SYSCALL(getpid)
 441:	b8 0b 00 00 00       	mov    $0xb,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <sbrk>:
SYSCALL(sbrk)
 449:	b8 0c 00 00 00       	mov    $0xc,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <sleep>:
SYSCALL(sleep)
 451:	b8 0d 00 00 00       	mov    $0xd,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <uptime>:
SYSCALL(uptime)
 459:	b8 0e 00 00 00       	mov    $0xe,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <sem_init>:
SYSCALL(sem_init)
 461:	b8 16 00 00 00       	mov    $0x16,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <sem_acquire>:
SYSCALL(sem_acquire)
 469:	b8 17 00 00 00       	mov    $0x17,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <sem_release>:
SYSCALL(sem_release)
 471:	b8 18 00 00 00       	mov    $0x18,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <setvar>:
SYSCALL(setvar)
 479:	b8 19 00 00 00       	mov    $0x19,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <getvar>:
SYSCALL(getvar)
 481:	b8 1a 00 00 00       	mov    $0x1a,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <modvar>:
SYSCALL(modvar)
 489:	b8 1b 00 00 00       	mov    $0x1b,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    
 491:	66 90                	xchg   %ax,%ax
 493:	66 90                	xchg   %ax,%ax
 495:	66 90                	xchg   %ax,%ax
 497:	66 90                	xchg   %ax,%ax
 499:	66 90                	xchg   %ax,%ax
 49b:	66 90                	xchg   %ax,%ax
 49d:	66 90                	xchg   %ax,%ax
 49f:	90                   	nop

000004a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4a9:	85 d2                	test   %edx,%edx
{
 4ab:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 4ae:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 4b0:	79 76                	jns    528 <printint+0x88>
 4b2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4b6:	74 70                	je     528 <printint+0x88>
    x = -xx;
 4b8:	f7 d8                	neg    %eax
    neg = 1;
 4ba:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4c1:	31 f6                	xor    %esi,%esi
 4c3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4c6:	eb 0a                	jmp    4d2 <printint+0x32>
 4c8:	90                   	nop
 4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 4d0:	89 fe                	mov    %edi,%esi
 4d2:	31 d2                	xor    %edx,%edx
 4d4:	8d 7e 01             	lea    0x1(%esi),%edi
 4d7:	f7 f1                	div    %ecx
 4d9:	0f b6 92 c4 08 00 00 	movzbl 0x8c4(%edx),%edx
  }while((x /= base) != 0);
 4e0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 4e2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 4e5:	75 e9                	jne    4d0 <printint+0x30>
  if(neg)
 4e7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4ea:	85 c0                	test   %eax,%eax
 4ec:	74 08                	je     4f6 <printint+0x56>
    buf[i++] = '-';
 4ee:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 4f3:	8d 7e 02             	lea    0x2(%esi),%edi
 4f6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 4fa:	8b 7d c0             	mov    -0x40(%ebp),%edi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
 500:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 503:	83 ec 04             	sub    $0x4,%esp
 506:	83 ee 01             	sub    $0x1,%esi
 509:	6a 01                	push   $0x1
 50b:	53                   	push   %ebx
 50c:	57                   	push   %edi
 50d:	88 45 d7             	mov    %al,-0x29(%ebp)
 510:	e8 cc fe ff ff       	call   3e1 <write>

  while(--i >= 0)
 515:	83 c4 10             	add    $0x10,%esp
 518:	39 de                	cmp    %ebx,%esi
 51a:	75 e4                	jne    500 <printint+0x60>
    putc(fd, buf[i]);
}
 51c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51f:	5b                   	pop    %ebx
 520:	5e                   	pop    %esi
 521:	5f                   	pop    %edi
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 528:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 52f:	eb 90                	jmp    4c1 <printint+0x21>
 531:	eb 0d                	jmp    540 <printf>
 533:	90                   	nop
 534:	90                   	nop
 535:	90                   	nop
 536:	90                   	nop
 537:	90                   	nop
 538:	90                   	nop
 539:	90                   	nop
 53a:	90                   	nop
 53b:	90                   	nop
 53c:	90                   	nop
 53d:	90                   	nop
 53e:	90                   	nop
 53f:	90                   	nop

00000540 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 549:	8b 75 0c             	mov    0xc(%ebp),%esi
 54c:	0f b6 1e             	movzbl (%esi),%ebx
 54f:	84 db                	test   %bl,%bl
 551:	0f 84 b3 00 00 00    	je     60a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 557:	8d 45 10             	lea    0x10(%ebp),%eax
 55a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 55d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 55f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 562:	eb 2f                	jmp    593 <printf+0x53>
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 568:	83 f8 25             	cmp    $0x25,%eax
 56b:	0f 84 a7 00 00 00    	je     618 <printf+0xd8>
  write(fd, &c, 1);
 571:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 574:	83 ec 04             	sub    $0x4,%esp
 577:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 57a:	6a 01                	push   $0x1
 57c:	50                   	push   %eax
 57d:	ff 75 08             	pushl  0x8(%ebp)
 580:	e8 5c fe ff ff       	call   3e1 <write>
 585:	83 c4 10             	add    $0x10,%esp
 588:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 58b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 58f:	84 db                	test   %bl,%bl
 591:	74 77                	je     60a <printf+0xca>
    if(state == 0){
 593:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 595:	0f be cb             	movsbl %bl,%ecx
 598:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 59b:	74 cb                	je     568 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 59d:	83 ff 25             	cmp    $0x25,%edi
 5a0:	75 e6                	jne    588 <printf+0x48>
      if(c == 'd'){
 5a2:	83 f8 64             	cmp    $0x64,%eax
 5a5:	0f 84 05 01 00 00    	je     6b0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5ab:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5b1:	83 f9 70             	cmp    $0x70,%ecx
 5b4:	74 72                	je     628 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5b6:	83 f8 73             	cmp    $0x73,%eax
 5b9:	0f 84 99 00 00 00    	je     658 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5bf:	83 f8 63             	cmp    $0x63,%eax
 5c2:	0f 84 08 01 00 00    	je     6d0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5c8:	83 f8 25             	cmp    $0x25,%eax
 5cb:	0f 84 ef 00 00 00    	je     6c0 <printf+0x180>
  write(fd, &c, 1);
 5d1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5d4:	83 ec 04             	sub    $0x4,%esp
 5d7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5db:	6a 01                	push   $0x1
 5dd:	50                   	push   %eax
 5de:	ff 75 08             	pushl  0x8(%ebp)
 5e1:	e8 fb fd ff ff       	call   3e1 <write>
 5e6:	83 c4 0c             	add    $0xc,%esp
 5e9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5ec:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 5ef:	6a 01                	push   $0x1
 5f1:	50                   	push   %eax
 5f2:	ff 75 08             	pushl  0x8(%ebp)
 5f5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5f8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5fa:	e8 e2 fd ff ff       	call   3e1 <write>
  for(i = 0; fmt[i]; i++){
 5ff:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 603:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 606:	84 db                	test   %bl,%bl
 608:	75 89                	jne    593 <printf+0x53>
    }
  }
}
 60a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 60d:	5b                   	pop    %ebx
 60e:	5e                   	pop    %esi
 60f:	5f                   	pop    %edi
 610:	5d                   	pop    %ebp
 611:	c3                   	ret    
 612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 618:	bf 25 00 00 00       	mov    $0x25,%edi
 61d:	e9 66 ff ff ff       	jmp    588 <printf+0x48>
 622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 628:	83 ec 0c             	sub    $0xc,%esp
 62b:	b9 10 00 00 00       	mov    $0x10,%ecx
 630:	6a 00                	push   $0x0
 632:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 635:	8b 45 08             	mov    0x8(%ebp),%eax
 638:	8b 17                	mov    (%edi),%edx
 63a:	e8 61 fe ff ff       	call   4a0 <printint>
        ap++;
 63f:	89 f8                	mov    %edi,%eax
 641:	83 c4 10             	add    $0x10,%esp
      state = 0;
 644:	31 ff                	xor    %edi,%edi
        ap++;
 646:	83 c0 04             	add    $0x4,%eax
 649:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 64c:	e9 37 ff ff ff       	jmp    588 <printf+0x48>
 651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 658:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 65b:	8b 08                	mov    (%eax),%ecx
        ap++;
 65d:	83 c0 04             	add    $0x4,%eax
 660:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 663:	85 c9                	test   %ecx,%ecx
 665:	0f 84 8e 00 00 00    	je     6f9 <printf+0x1b9>
        while(*s != 0){
 66b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 66e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 670:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 672:	84 c0                	test   %al,%al
 674:	0f 84 0e ff ff ff    	je     588 <printf+0x48>
 67a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 67d:	89 de                	mov    %ebx,%esi
 67f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 682:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 685:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 688:	83 ec 04             	sub    $0x4,%esp
          s++;
 68b:	83 c6 01             	add    $0x1,%esi
 68e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 691:	6a 01                	push   $0x1
 693:	57                   	push   %edi
 694:	53                   	push   %ebx
 695:	e8 47 fd ff ff       	call   3e1 <write>
        while(*s != 0){
 69a:	0f b6 06             	movzbl (%esi),%eax
 69d:	83 c4 10             	add    $0x10,%esp
 6a0:	84 c0                	test   %al,%al
 6a2:	75 e4                	jne    688 <printf+0x148>
 6a4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 6a7:	31 ff                	xor    %edi,%edi
 6a9:	e9 da fe ff ff       	jmp    588 <printf+0x48>
 6ae:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 6b0:	83 ec 0c             	sub    $0xc,%esp
 6b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6b8:	6a 01                	push   $0x1
 6ba:	e9 73 ff ff ff       	jmp    632 <printf+0xf2>
 6bf:	90                   	nop
  write(fd, &c, 1);
 6c0:	83 ec 04             	sub    $0x4,%esp
 6c3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 6c6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6c9:	6a 01                	push   $0x1
 6cb:	e9 21 ff ff ff       	jmp    5f1 <printf+0xb1>
        putc(fd, *ap);
 6d0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 6d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6d6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 6d8:	6a 01                	push   $0x1
        ap++;
 6da:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 6dd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 6e0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6e3:	50                   	push   %eax
 6e4:	ff 75 08             	pushl  0x8(%ebp)
 6e7:	e8 f5 fc ff ff       	call   3e1 <write>
        ap++;
 6ec:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6ef:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6f2:	31 ff                	xor    %edi,%edi
 6f4:	e9 8f fe ff ff       	jmp    588 <printf+0x48>
          s = "(null)";
 6f9:	bb bb 08 00 00       	mov    $0x8bb,%ebx
        while(*s != 0){
 6fe:	b8 28 00 00 00       	mov    $0x28,%eax
 703:	e9 72 ff ff ff       	jmp    67a <printf+0x13a>
 708:	66 90                	xchg   %ax,%ax
 70a:	66 90                	xchg   %ax,%ax
 70c:	66 90                	xchg   %ax,%ax
 70e:	66 90                	xchg   %ax,%ax

00000710 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 710:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	a1 b8 0b 00 00       	mov    0xbb8,%eax
{
 716:	89 e5                	mov    %esp,%ebp
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	53                   	push   %ebx
 71b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 71e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 728:	39 c8                	cmp    %ecx,%eax
 72a:	8b 10                	mov    (%eax),%edx
 72c:	73 32                	jae    760 <free+0x50>
 72e:	39 d1                	cmp    %edx,%ecx
 730:	72 04                	jb     736 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 732:	39 d0                	cmp    %edx,%eax
 734:	72 32                	jb     768 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 736:	8b 73 fc             	mov    -0x4(%ebx),%esi
 739:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73c:	39 fa                	cmp    %edi,%edx
 73e:	74 30                	je     770 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 740:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 743:	8b 50 04             	mov    0x4(%eax),%edx
 746:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 749:	39 f1                	cmp    %esi,%ecx
 74b:	74 3a                	je     787 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 74d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 74f:	a3 b8 0b 00 00       	mov    %eax,0xbb8
}
 754:	5b                   	pop    %ebx
 755:	5e                   	pop    %esi
 756:	5f                   	pop    %edi
 757:	5d                   	pop    %ebp
 758:	c3                   	ret    
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 760:	39 d0                	cmp    %edx,%eax
 762:	72 04                	jb     768 <free+0x58>
 764:	39 d1                	cmp    %edx,%ecx
 766:	72 ce                	jb     736 <free+0x26>
{
 768:	89 d0                	mov    %edx,%eax
 76a:	eb bc                	jmp    728 <free+0x18>
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 770:	03 72 04             	add    0x4(%edx),%esi
 773:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 776:	8b 10                	mov    (%eax),%edx
 778:	8b 12                	mov    (%edx),%edx
 77a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 77d:	8b 50 04             	mov    0x4(%eax),%edx
 780:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 783:	39 f1                	cmp    %esi,%ecx
 785:	75 c6                	jne    74d <free+0x3d>
    p->s.size += bp->s.size;
 787:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 78a:	a3 b8 0b 00 00       	mov    %eax,0xbb8
    p->s.size += bp->s.size;
 78f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 792:	8b 53 f8             	mov    -0x8(%ebx),%edx
 795:	89 10                	mov    %edx,(%eax)
}
 797:	5b                   	pop    %ebx
 798:	5e                   	pop    %esi
 799:	5f                   	pop    %edi
 79a:	5d                   	pop    %ebp
 79b:	c3                   	ret    
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ac:	8b 15 b8 0b 00 00    	mov    0xbb8,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b2:	8d 78 07             	lea    0x7(%eax),%edi
 7b5:	c1 ef 03             	shr    $0x3,%edi
 7b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7bb:	85 d2                	test   %edx,%edx
 7bd:	0f 84 9d 00 00 00    	je     860 <malloc+0xc0>
 7c3:	8b 02                	mov    (%edx),%eax
 7c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7c8:	39 cf                	cmp    %ecx,%edi
 7ca:	76 6c                	jbe    838 <malloc+0x98>
 7cc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 7d2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7d7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7da:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7e1:	eb 0e                	jmp    7f1 <malloc+0x51>
 7e3:	90                   	nop
 7e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7ea:	8b 48 04             	mov    0x4(%eax),%ecx
 7ed:	39 f9                	cmp    %edi,%ecx
 7ef:	73 47                	jae    838 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7f1:	39 05 b8 0b 00 00    	cmp    %eax,0xbb8
 7f7:	89 c2                	mov    %eax,%edx
 7f9:	75 ed                	jne    7e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7fb:	83 ec 0c             	sub    $0xc,%esp
 7fe:	56                   	push   %esi
 7ff:	e8 45 fc ff ff       	call   449 <sbrk>
  if(p == (char*)-1)
 804:	83 c4 10             	add    $0x10,%esp
 807:	83 f8 ff             	cmp    $0xffffffff,%eax
 80a:	74 1c                	je     828 <malloc+0x88>
  hp->s.size = nu;
 80c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 80f:	83 ec 0c             	sub    $0xc,%esp
 812:	83 c0 08             	add    $0x8,%eax
 815:	50                   	push   %eax
 816:	e8 f5 fe ff ff       	call   710 <free>
  return freep;
 81b:	8b 15 b8 0b 00 00    	mov    0xbb8,%edx
      if((p = morecore(nunits)) == 0)
 821:	83 c4 10             	add    $0x10,%esp
 824:	85 d2                	test   %edx,%edx
 826:	75 c0                	jne    7e8 <malloc+0x48>
        return 0;
  }
}
 828:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 82b:	31 c0                	xor    %eax,%eax
}
 82d:	5b                   	pop    %ebx
 82e:	5e                   	pop    %esi
 82f:	5f                   	pop    %edi
 830:	5d                   	pop    %ebp
 831:	c3                   	ret    
 832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 838:	39 cf                	cmp    %ecx,%edi
 83a:	74 54                	je     890 <malloc+0xf0>
        p->s.size -= nunits;
 83c:	29 f9                	sub    %edi,%ecx
 83e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 841:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 844:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 847:	89 15 b8 0b 00 00    	mov    %edx,0xbb8
}
 84d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 850:	83 c0 08             	add    $0x8,%eax
}
 853:	5b                   	pop    %ebx
 854:	5e                   	pop    %esi
 855:	5f                   	pop    %edi
 856:	5d                   	pop    %ebp
 857:	c3                   	ret    
 858:	90                   	nop
 859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 860:	c7 05 b8 0b 00 00 bc 	movl   $0xbbc,0xbb8
 867:	0b 00 00 
 86a:	c7 05 bc 0b 00 00 bc 	movl   $0xbbc,0xbbc
 871:	0b 00 00 
    base.s.size = 0;
 874:	b8 bc 0b 00 00       	mov    $0xbbc,%eax
 879:	c7 05 c0 0b 00 00 00 	movl   $0x0,0xbc0
 880:	00 00 00 
 883:	e9 44 ff ff ff       	jmp    7cc <malloc+0x2c>
 888:	90                   	nop
 889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 890:	8b 08                	mov    (%eax),%ecx
 892:	89 0a                	mov    %ecx,(%edx)
 894:	eb b1                	jmp    847 <malloc+0xa7>
