
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	be 01 00 00 00       	mov    $0x1,%esi
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  21:	83 f8 01             	cmp    $0x1,%eax
{
  24:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(argc <= 1){
  27:	7e 56                	jle    7f <main+0x7f>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 05 04 00 00       	call   441 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	85 c0                	test   %eax,%eax
  41:	89 c7                	mov    %eax,%edi
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
    wc(fd, argv[i]);
  4d:	50                   	push   %eax
  4e:	83 c3 04             	add    $0x4,%ebx
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 cb 03 00 00       	call   429 <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 96 03 00 00       	call   401 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 fb 08 00 00       	push   $0x8fb
  73:	6a 01                	push   $0x1
  75:	e8 06 05 00 00       	call   580 <printf>
      exit();
  7a:	e8 82 03 00 00       	call   401 <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 ed 08 00 00       	push   $0x8ed
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 6f 03 00 00       	call   401 <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
  l = w = c = 0;
  a6:	31 db                	xor    %ebx,%ebx
{
  a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  b9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 60 0c 00 00       	push   $0xc60
  cd:	ff 75 08             	pushl  0x8(%ebp)
  d0:	e8 44 03 00 00       	call   419 <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	83 f8 00             	cmp    $0x0,%eax
  db:	89 c6                	mov    %eax,%esi
  dd:	7e 61                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  df:	31 ff                	xor    %edi,%edi
  e1:	eb 13                	jmp    f6 <wc+0x56>
  e3:	90                   	nop
  e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        inword = 0;
  e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  ef:	83 c7 01             	add    $0x1,%edi
  f2:	39 fe                	cmp    %edi,%esi
  f4:	74 42                	je     138 <wc+0x98>
      if(buf[i] == '\n')
  f6:	0f be 87 60 0c 00 00 	movsbl 0xc60(%edi),%eax
        l++;
  fd:	31 c9                	xor    %ecx,%ecx
  ff:	3c 0a                	cmp    $0xa,%al
 101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 104:	83 ec 08             	sub    $0x8,%esp
 107:	50                   	push   %eax
 108:	68 d8 08 00 00       	push   $0x8d8
        l++;
 10d:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 10f:	e8 3c 01 00 00       	call   250 <strchr>
 114:	83 c4 10             	add    $0x10,%esp
 117:	85 c0                	test   %eax,%eax
 119:	75 cd                	jne    e8 <wc+0x48>
      else if(!inword){
 11b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 11e:	85 d2                	test   %edx,%edx
 120:	75 cd                	jne    ef <wc+0x4f>
    for(i=0; i<n; i++){
 122:	83 c7 01             	add    $0x1,%edi
        w++;
 125:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        inword = 1;
 129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 130:	39 fe                	cmp    %edi,%esi
 132:	75 c2                	jne    f6 <wc+0x56>
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 138:	01 75 e0             	add    %esi,-0x20(%ebp)
 13b:	eb 83                	jmp    c0 <wc+0x20>
 13d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 140:	75 24                	jne    166 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 142:	83 ec 08             	sub    $0x8,%esp
 145:	ff 75 0c             	pushl  0xc(%ebp)
 148:	ff 75 e0             	pushl  -0x20(%ebp)
 14b:	ff 75 dc             	pushl  -0x24(%ebp)
 14e:	53                   	push   %ebx
 14f:	68 ee 08 00 00       	push   $0x8ee
 154:	6a 01                	push   $0x1
 156:	e8 25 04 00 00       	call   580 <printf>
}
 15b:	83 c4 20             	add    $0x20,%esp
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
    printf(1, "wc: read error\n");
 166:	50                   	push   %eax
 167:	50                   	push   %eax
 168:	68 de 08 00 00       	push   $0x8de
 16d:	6a 01                	push   $0x1
 16f:	e8 0c 04 00 00       	call   580 <printf>
    exit();
 174:	e8 88 02 00 00       	call   401 <exit>
 179:	66 90                	xchg   %ax,%ax
 17b:	66 90                	xchg   %ax,%ax
 17d:	66 90                	xchg   %ax,%ax
 17f:	90                   	nop

00000180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	8b 45 08             	mov    0x8(%ebp),%eax
 187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 18a:	89 c2                	mov    %eax,%edx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 190:	83 c1 01             	add    $0x1,%ecx
 193:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 197:	83 c2 01             	add    $0x1,%edx
 19a:	84 db                	test   %bl,%bl
 19c:	88 5a ff             	mov    %bl,-0x1(%edx)
 19f:	75 ef                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 1a1:	5b                   	pop    %ebx
 1a2:	5d                   	pop    %ebp
 1a3:	c3                   	ret    
 1a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	0f b6 19             	movzbl (%ecx),%ebx
 1c0:	84 c0                	test   %al,%al
 1c2:	75 1c                	jne    1e0 <strcmp+0x30>
 1c4:	eb 2a                	jmp    1f0 <strcmp+0x40>
 1c6:	8d 76 00             	lea    0x0(%esi),%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1d0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1d6:	83 c1 01             	add    $0x1,%ecx
 1d9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 1dc:	84 c0                	test   %al,%al
 1de:	74 10                	je     1f0 <strcmp+0x40>
 1e0:	38 d8                	cmp    %bl,%al
 1e2:	74 ec                	je     1d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1e4:	29 d8                	sub    %ebx,%eax
}
 1e6:	5b                   	pop    %ebx
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1f2:	29 d8                	sub    %ebx,%eax
}
 1f4:	5b                   	pop    %ebx
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <strlen>:

uint
strlen(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 206:	80 39 00             	cmpb   $0x0,(%ecx)
 209:	74 15                	je     220 <strlen+0x20>
 20b:	31 d2                	xor    %edx,%edx
 20d:	8d 76 00             	lea    0x0(%esi),%esi
 210:	83 c2 01             	add    $0x1,%edx
 213:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 217:	89 d0                	mov    %edx,%eax
 219:	75 f5                	jne    210 <strlen+0x10>
    ;
  return n;
}
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 220:	31 c0                	xor    %eax,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    
 224:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 22a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000230 <memset>:

void*
memset(void *dst, int c, uint n)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 237:	8b 4d 10             	mov    0x10(%ebp),%ecx
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	89 d7                	mov    %edx,%edi
 23f:	fc                   	cld    
 240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 242:	89 d0                	mov    %edx,%eax
 244:	5f                   	pop    %edi
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <strchr>:

char*
strchr(const char *s, char c)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 45 08             	mov    0x8(%ebp),%eax
 257:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 25a:	0f b6 10             	movzbl (%eax),%edx
 25d:	84 d2                	test   %dl,%dl
 25f:	74 1d                	je     27e <strchr+0x2e>
    if(*s == c)
 261:	38 d3                	cmp    %dl,%bl
 263:	89 d9                	mov    %ebx,%ecx
 265:	75 0d                	jne    274 <strchr+0x24>
 267:	eb 17                	jmp    280 <strchr+0x30>
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 270:	38 ca                	cmp    %cl,%dl
 272:	74 0c                	je     280 <strchr+0x30>
  for(; *s; s++)
 274:	83 c0 01             	add    $0x1,%eax
 277:	0f b6 10             	movzbl (%eax),%edx
 27a:	84 d2                	test   %dl,%dl
 27c:	75 f2                	jne    270 <strchr+0x20>
      return (char*)s;
  return 0;
 27e:	31 c0                	xor    %eax,%eax
}
 280:	5b                   	pop    %ebx
 281:	5d                   	pop    %ebp
 282:	c3                   	ret    
 283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <gets>:

char*
gets(char *buf, int max)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
 295:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 296:	31 f6                	xor    %esi,%esi
 298:	89 f3                	mov    %esi,%ebx
{
 29a:	83 ec 1c             	sub    $0x1c,%esp
 29d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2a0:	eb 2f                	jmp    2d1 <gets+0x41>
 2a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2ab:	83 ec 04             	sub    $0x4,%esp
 2ae:	6a 01                	push   $0x1
 2b0:	50                   	push   %eax
 2b1:	6a 00                	push   $0x0
 2b3:	e8 61 01 00 00       	call   419 <read>
    if(cc < 1)
 2b8:	83 c4 10             	add    $0x10,%esp
 2bb:	85 c0                	test   %eax,%eax
 2bd:	7e 1c                	jle    2db <gets+0x4b>
      break;
    buf[i++] = c;
 2bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c3:	83 c7 01             	add    $0x1,%edi
 2c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2c9:	3c 0a                	cmp    $0xa,%al
 2cb:	74 23                	je     2f0 <gets+0x60>
 2cd:	3c 0d                	cmp    $0xd,%al
 2cf:	74 1f                	je     2f0 <gets+0x60>
  for(i=0; i+1 < max; ){
 2d1:	83 c3 01             	add    $0x1,%ebx
 2d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2d7:	89 fe                	mov    %edi,%esi
 2d9:	7c cd                	jl     2a8 <gets+0x18>
 2db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2e0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e6:	5b                   	pop    %ebx
 2e7:	5e                   	pop    %esi
 2e8:	5f                   	pop    %edi
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    
 2eb:	90                   	nop
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2f0:	8b 75 08             	mov    0x8(%ebp),%esi
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	01 de                	add    %ebx,%esi
 2f8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2fa:	c6 03 00             	movb   $0x0,(%ebx)
}
 2fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 300:	5b                   	pop    %ebx
 301:	5e                   	pop    %esi
 302:	5f                   	pop    %edi
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    
 305:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 315:	83 ec 08             	sub    $0x8,%esp
 318:	6a 00                	push   $0x0
 31a:	ff 75 08             	pushl  0x8(%ebp)
 31d:	e8 1f 01 00 00       	call   441 <open>
  if(fd < 0)
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	78 27                	js     350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 329:	83 ec 08             	sub    $0x8,%esp
 32c:	ff 75 0c             	pushl  0xc(%ebp)
 32f:	89 c3                	mov    %eax,%ebx
 331:	50                   	push   %eax
 332:	e8 22 01 00 00       	call   459 <fstat>
  close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	e8 e8 00 00 00       	call   429 <close>
  return r;
 341:	83 c4 10             	add    $0x10,%esp
}
 344:	8d 65 f8             	lea    -0x8(%ebp),%esp
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb ed                	jmp    344 <stat+0x34>
 357:	89 f6                	mov    %esi,%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 367:	0f be 11             	movsbl (%ecx),%edx
 36a:	8d 42 d0             	lea    -0x30(%edx),%eax
 36d:	3c 09                	cmp    $0x9,%al
  n = 0;
 36f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 374:	77 1f                	ja     395 <atoi+0x35>
 376:	8d 76 00             	lea    0x0(%esi),%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 380:	8d 04 80             	lea    (%eax,%eax,4),%eax
 383:	83 c1 01             	add    $0x1,%ecx
 386:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 38a:	0f be 11             	movsbl (%ecx),%edx
 38d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	5b                   	pop    %ebx
 396:	5d                   	pop    %ebp
 397:	c3                   	ret    
 398:	90                   	nop
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	56                   	push   %esi
 3a4:	53                   	push   %ebx
 3a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3a8:	8b 45 08             	mov    0x8(%ebp),%eax
 3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ae:	85 db                	test   %ebx,%ebx
 3b0:	7e 14                	jle    3c6 <memmove+0x26>
 3b2:	31 d2                	xor    %edx,%edx
 3b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 3c2:	39 d3                	cmp    %edx,%ebx
 3c4:	75 f2                	jne    3b8 <memmove+0x18>
  return vdst;
}
 3c6:	5b                   	pop    %ebx
 3c7:	5e                   	pop    %esi
 3c8:	5d                   	pop    %ebp
 3c9:	c3                   	ret    
 3ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003d0 <srand>:

static uint seed = 1;

void
srand(uint s)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
  seed = s;
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3d6:	5d                   	pop    %ebp
  seed = s;
 3d7:	a3 38 0c 00 00       	mov    %eax,0xc38
}
 3dc:	c3                   	ret    
 3dd:	8d 76 00             	lea    0x0(%esi),%esi

000003e0 <random>:

uint
random(void)
{
  seed = seed
    * 1103515245
 3e0:	69 05 38 0c 00 00 6d 	imul   $0x41c64e6d,0xc38,%eax
 3e7:	4e c6 41 
{
 3ea:	55                   	push   %ebp
 3eb:	89 e5                	mov    %esp,%ebp
    + 12345
    % (1 << 31);
  return seed;
}
 3ed:	5d                   	pop    %ebp
    + 12345
 3ee:	05 39 30 00 00       	add    $0x3039,%eax
  seed = seed
 3f3:	a3 38 0c 00 00       	mov    %eax,0xc38
}
 3f8:	c3                   	ret    

000003f9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3f9:	b8 01 00 00 00       	mov    $0x1,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <exit>:
SYSCALL(exit)
 401:	b8 02 00 00 00       	mov    $0x2,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <wait>:
SYSCALL(wait)
 409:	b8 03 00 00 00       	mov    $0x3,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <pipe>:
SYSCALL(pipe)
 411:	b8 04 00 00 00       	mov    $0x4,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <read>:
SYSCALL(read)
 419:	b8 05 00 00 00       	mov    $0x5,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <write>:
SYSCALL(write)
 421:	b8 10 00 00 00       	mov    $0x10,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <close>:
SYSCALL(close)
 429:	b8 15 00 00 00       	mov    $0x15,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <kill>:
SYSCALL(kill)
 431:	b8 06 00 00 00       	mov    $0x6,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <exec>:
SYSCALL(exec)
 439:	b8 07 00 00 00       	mov    $0x7,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <open>:
SYSCALL(open)
 441:	b8 0f 00 00 00       	mov    $0xf,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <mknod>:
SYSCALL(mknod)
 449:	b8 11 00 00 00       	mov    $0x11,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <unlink>:
SYSCALL(unlink)
 451:	b8 12 00 00 00       	mov    $0x12,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <fstat>:
SYSCALL(fstat)
 459:	b8 08 00 00 00       	mov    $0x8,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <link>:
SYSCALL(link)
 461:	b8 13 00 00 00       	mov    $0x13,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <mkdir>:
SYSCALL(mkdir)
 469:	b8 14 00 00 00       	mov    $0x14,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <chdir>:
SYSCALL(chdir)
 471:	b8 09 00 00 00       	mov    $0x9,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <dup>:
SYSCALL(dup)
 479:	b8 0a 00 00 00       	mov    $0xa,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <getpid>:
SYSCALL(getpid)
 481:	b8 0b 00 00 00       	mov    $0xb,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <sbrk>:
SYSCALL(sbrk)
 489:	b8 0c 00 00 00       	mov    $0xc,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <sleep>:
SYSCALL(sleep)
 491:	b8 0d 00 00 00       	mov    $0xd,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <uptime>:
SYSCALL(uptime)
 499:	b8 0e 00 00 00       	mov    $0xe,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <sem_init>:
SYSCALL(sem_init)
 4a1:	b8 16 00 00 00       	mov    $0x16,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <sem_acquire>:
SYSCALL(sem_acquire)
 4a9:	b8 17 00 00 00       	mov    $0x17,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <sem_release>:
SYSCALL(sem_release)
 4b1:	b8 18 00 00 00       	mov    $0x18,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <setvar>:
SYSCALL(setvar)
 4b9:	b8 19 00 00 00       	mov    $0x19,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <getvar>:
SYSCALL(getvar)
 4c1:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <modvar>:
SYSCALL(modvar)
 4c9:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    
 4d1:	66 90                	xchg   %ax,%ax
 4d3:	66 90                	xchg   %ax,%ax
 4d5:	66 90                	xchg   %ax,%ax
 4d7:	66 90                	xchg   %ax,%ax
 4d9:	66 90                	xchg   %ax,%ax
 4db:	66 90                	xchg   %ax,%ax
 4dd:	66 90                	xchg   %ax,%ax
 4df:	90                   	nop

000004e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4e9:	85 d2                	test   %edx,%edx
{
 4eb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 4ee:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 4f0:	79 76                	jns    568 <printint+0x88>
 4f2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4f6:	74 70                	je     568 <printint+0x88>
    x = -xx;
 4f8:	f7 d8                	neg    %eax
    neg = 1;
 4fa:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 501:	31 f6                	xor    %esi,%esi
 503:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 506:	eb 0a                	jmp    512 <printint+0x32>
 508:	90                   	nop
 509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 510:	89 fe                	mov    %edi,%esi
 512:	31 d2                	xor    %edx,%edx
 514:	8d 7e 01             	lea    0x1(%esi),%edi
 517:	f7 f1                	div    %ecx
 519:	0f b6 92 18 09 00 00 	movzbl 0x918(%edx),%edx
  }while((x /= base) != 0);
 520:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 522:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 525:	75 e9                	jne    510 <printint+0x30>
  if(neg)
 527:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 52a:	85 c0                	test   %eax,%eax
 52c:	74 08                	je     536 <printint+0x56>
    buf[i++] = '-';
 52e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 533:	8d 7e 02             	lea    0x2(%esi),%edi
 536:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 53a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 53d:	8d 76 00             	lea    0x0(%esi),%esi
 540:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 543:	83 ec 04             	sub    $0x4,%esp
 546:	83 ee 01             	sub    $0x1,%esi
 549:	6a 01                	push   $0x1
 54b:	53                   	push   %ebx
 54c:	57                   	push   %edi
 54d:	88 45 d7             	mov    %al,-0x29(%ebp)
 550:	e8 cc fe ff ff       	call   421 <write>

  while(--i >= 0)
 555:	83 c4 10             	add    $0x10,%esp
 558:	39 de                	cmp    %ebx,%esi
 55a:	75 e4                	jne    540 <printint+0x60>
    putc(fd, buf[i]);
}
 55c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55f:	5b                   	pop    %ebx
 560:	5e                   	pop    %esi
 561:	5f                   	pop    %edi
 562:	5d                   	pop    %ebp
 563:	c3                   	ret    
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 568:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 56f:	eb 90                	jmp    501 <printint+0x21>
 571:	eb 0d                	jmp    580 <printf>
 573:	90                   	nop
 574:	90                   	nop
 575:	90                   	nop
 576:	90                   	nop
 577:	90                   	nop
 578:	90                   	nop
 579:	90                   	nop
 57a:	90                   	nop
 57b:	90                   	nop
 57c:	90                   	nop
 57d:	90                   	nop
 57e:	90                   	nop
 57f:	90                   	nop

00000580 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	56                   	push   %esi
 585:	53                   	push   %ebx
 586:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 589:	8b 75 0c             	mov    0xc(%ebp),%esi
 58c:	0f b6 1e             	movzbl (%esi),%ebx
 58f:	84 db                	test   %bl,%bl
 591:	0f 84 b3 00 00 00    	je     64a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 597:	8d 45 10             	lea    0x10(%ebp),%eax
 59a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 59d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 59f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5a2:	eb 2f                	jmp    5d3 <printf+0x53>
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5a8:	83 f8 25             	cmp    $0x25,%eax
 5ab:	0f 84 a7 00 00 00    	je     658 <printf+0xd8>
  write(fd, &c, 1);
 5b1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5b4:	83 ec 04             	sub    $0x4,%esp
 5b7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 5ba:	6a 01                	push   $0x1
 5bc:	50                   	push   %eax
 5bd:	ff 75 08             	pushl  0x8(%ebp)
 5c0:	e8 5c fe ff ff       	call   421 <write>
 5c5:	83 c4 10             	add    $0x10,%esp
 5c8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 5cb:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5cf:	84 db                	test   %bl,%bl
 5d1:	74 77                	je     64a <printf+0xca>
    if(state == 0){
 5d3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 5d5:	0f be cb             	movsbl %bl,%ecx
 5d8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5db:	74 cb                	je     5a8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5dd:	83 ff 25             	cmp    $0x25,%edi
 5e0:	75 e6                	jne    5c8 <printf+0x48>
      if(c == 'd'){
 5e2:	83 f8 64             	cmp    $0x64,%eax
 5e5:	0f 84 05 01 00 00    	je     6f0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5eb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5f1:	83 f9 70             	cmp    $0x70,%ecx
 5f4:	74 72                	je     668 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5f6:	83 f8 73             	cmp    $0x73,%eax
 5f9:	0f 84 99 00 00 00    	je     698 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5ff:	83 f8 63             	cmp    $0x63,%eax
 602:	0f 84 08 01 00 00    	je     710 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 608:	83 f8 25             	cmp    $0x25,%eax
 60b:	0f 84 ef 00 00 00    	je     700 <printf+0x180>
  write(fd, &c, 1);
 611:	8d 45 e7             	lea    -0x19(%ebp),%eax
 614:	83 ec 04             	sub    $0x4,%esp
 617:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 61b:	6a 01                	push   $0x1
 61d:	50                   	push   %eax
 61e:	ff 75 08             	pushl  0x8(%ebp)
 621:	e8 fb fd ff ff       	call   421 <write>
 626:	83 c4 0c             	add    $0xc,%esp
 629:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 62c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 62f:	6a 01                	push   $0x1
 631:	50                   	push   %eax
 632:	ff 75 08             	pushl  0x8(%ebp)
 635:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 638:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 63a:	e8 e2 fd ff ff       	call   421 <write>
  for(i = 0; fmt[i]; i++){
 63f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 643:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 646:	84 db                	test   %bl,%bl
 648:	75 89                	jne    5d3 <printf+0x53>
    }
  }
}
 64a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 64d:	5b                   	pop    %ebx
 64e:	5e                   	pop    %esi
 64f:	5f                   	pop    %edi
 650:	5d                   	pop    %ebp
 651:	c3                   	ret    
 652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 658:	bf 25 00 00 00       	mov    $0x25,%edi
 65d:	e9 66 ff ff ff       	jmp    5c8 <printf+0x48>
 662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 668:	83 ec 0c             	sub    $0xc,%esp
 66b:	b9 10 00 00 00       	mov    $0x10,%ecx
 670:	6a 00                	push   $0x0
 672:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 675:	8b 45 08             	mov    0x8(%ebp),%eax
 678:	8b 17                	mov    (%edi),%edx
 67a:	e8 61 fe ff ff       	call   4e0 <printint>
        ap++;
 67f:	89 f8                	mov    %edi,%eax
 681:	83 c4 10             	add    $0x10,%esp
      state = 0;
 684:	31 ff                	xor    %edi,%edi
        ap++;
 686:	83 c0 04             	add    $0x4,%eax
 689:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 68c:	e9 37 ff ff ff       	jmp    5c8 <printf+0x48>
 691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 698:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 69b:	8b 08                	mov    (%eax),%ecx
        ap++;
 69d:	83 c0 04             	add    $0x4,%eax
 6a0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 6a3:	85 c9                	test   %ecx,%ecx
 6a5:	0f 84 8e 00 00 00    	je     739 <printf+0x1b9>
        while(*s != 0){
 6ab:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 6ae:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 6b0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 6b2:	84 c0                	test   %al,%al
 6b4:	0f 84 0e ff ff ff    	je     5c8 <printf+0x48>
 6ba:	89 75 d0             	mov    %esi,-0x30(%ebp)
 6bd:	89 de                	mov    %ebx,%esi
 6bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6c2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 6c5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6c8:	83 ec 04             	sub    $0x4,%esp
          s++;
 6cb:	83 c6 01             	add    $0x1,%esi
 6ce:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 6d1:	6a 01                	push   $0x1
 6d3:	57                   	push   %edi
 6d4:	53                   	push   %ebx
 6d5:	e8 47 fd ff ff       	call   421 <write>
        while(*s != 0){
 6da:	0f b6 06             	movzbl (%esi),%eax
 6dd:	83 c4 10             	add    $0x10,%esp
 6e0:	84 c0                	test   %al,%al
 6e2:	75 e4                	jne    6c8 <printf+0x148>
 6e4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 6e7:	31 ff                	xor    %edi,%edi
 6e9:	e9 da fe ff ff       	jmp    5c8 <printf+0x48>
 6ee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 6f0:	83 ec 0c             	sub    $0xc,%esp
 6f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6f8:	6a 01                	push   $0x1
 6fa:	e9 73 ff ff ff       	jmp    672 <printf+0xf2>
 6ff:	90                   	nop
  write(fd, &c, 1);
 700:	83 ec 04             	sub    $0x4,%esp
 703:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 706:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 709:	6a 01                	push   $0x1
 70b:	e9 21 ff ff ff       	jmp    631 <printf+0xb1>
        putc(fd, *ap);
 710:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 713:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 716:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 718:	6a 01                	push   $0x1
        ap++;
 71a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 71d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 720:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 723:	50                   	push   %eax
 724:	ff 75 08             	pushl  0x8(%ebp)
 727:	e8 f5 fc ff ff       	call   421 <write>
        ap++;
 72c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 72f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 732:	31 ff                	xor    %edi,%edi
 734:	e9 8f fe ff ff       	jmp    5c8 <printf+0x48>
          s = "(null)";
 739:	bb 0f 09 00 00       	mov    $0x90f,%ebx
        while(*s != 0){
 73e:	b8 28 00 00 00       	mov    $0x28,%eax
 743:	e9 72 ff ff ff       	jmp    6ba <printf+0x13a>
 748:	66 90                	xchg   %ax,%ax
 74a:	66 90                	xchg   %ax,%ax
 74c:	66 90                	xchg   %ax,%ax
 74e:	66 90                	xchg   %ax,%ax

00000750 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 750:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 751:	a1 40 0c 00 00       	mov    0xc40,%eax
{
 756:	89 e5                	mov    %esp,%ebp
 758:	57                   	push   %edi
 759:	56                   	push   %esi
 75a:	53                   	push   %ebx
 75b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 75e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 768:	39 c8                	cmp    %ecx,%eax
 76a:	8b 10                	mov    (%eax),%edx
 76c:	73 32                	jae    7a0 <free+0x50>
 76e:	39 d1                	cmp    %edx,%ecx
 770:	72 04                	jb     776 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 772:	39 d0                	cmp    %edx,%eax
 774:	72 32                	jb     7a8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 776:	8b 73 fc             	mov    -0x4(%ebx),%esi
 779:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 77c:	39 fa                	cmp    %edi,%edx
 77e:	74 30                	je     7b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 780:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 783:	8b 50 04             	mov    0x4(%eax),%edx
 786:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 789:	39 f1                	cmp    %esi,%ecx
 78b:	74 3a                	je     7c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 78d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 78f:	a3 40 0c 00 00       	mov    %eax,0xc40
}
 794:	5b                   	pop    %ebx
 795:	5e                   	pop    %esi
 796:	5f                   	pop    %edi
 797:	5d                   	pop    %ebp
 798:	c3                   	ret    
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a0:	39 d0                	cmp    %edx,%eax
 7a2:	72 04                	jb     7a8 <free+0x58>
 7a4:	39 d1                	cmp    %edx,%ecx
 7a6:	72 ce                	jb     776 <free+0x26>
{
 7a8:	89 d0                	mov    %edx,%eax
 7aa:	eb bc                	jmp    768 <free+0x18>
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7b0:	03 72 04             	add    0x4(%edx),%esi
 7b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b6:	8b 10                	mov    (%eax),%edx
 7b8:	8b 12                	mov    (%edx),%edx
 7ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7bd:	8b 50 04             	mov    0x4(%eax),%edx
 7c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c3:	39 f1                	cmp    %esi,%ecx
 7c5:	75 c6                	jne    78d <free+0x3d>
    p->s.size += bp->s.size;
 7c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7ca:	a3 40 0c 00 00       	mov    %eax,0xc40
    p->s.size += bp->s.size;
 7cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7d2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7d5:	89 10                	mov    %edx,(%eax)
}
 7d7:	5b                   	pop    %ebx
 7d8:	5e                   	pop    %esi
 7d9:	5f                   	pop    %edi
 7da:	5d                   	pop    %ebp
 7db:	c3                   	ret    
 7dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	57                   	push   %edi
 7e4:	56                   	push   %esi
 7e5:	53                   	push   %ebx
 7e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ec:	8b 15 40 0c 00 00    	mov    0xc40,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f2:	8d 78 07             	lea    0x7(%eax),%edi
 7f5:	c1 ef 03             	shr    $0x3,%edi
 7f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7fb:	85 d2                	test   %edx,%edx
 7fd:	0f 84 9d 00 00 00    	je     8a0 <malloc+0xc0>
 803:	8b 02                	mov    (%edx),%eax
 805:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 808:	39 cf                	cmp    %ecx,%edi
 80a:	76 6c                	jbe    878 <malloc+0x98>
 80c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 812:	bb 00 10 00 00       	mov    $0x1000,%ebx
 817:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 81a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 821:	eb 0e                	jmp    831 <malloc+0x51>
 823:	90                   	nop
 824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 828:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 82a:	8b 48 04             	mov    0x4(%eax),%ecx
 82d:	39 f9                	cmp    %edi,%ecx
 82f:	73 47                	jae    878 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 831:	39 05 40 0c 00 00    	cmp    %eax,0xc40
 837:	89 c2                	mov    %eax,%edx
 839:	75 ed                	jne    828 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 83b:	83 ec 0c             	sub    $0xc,%esp
 83e:	56                   	push   %esi
 83f:	e8 45 fc ff ff       	call   489 <sbrk>
  if(p == (char*)-1)
 844:	83 c4 10             	add    $0x10,%esp
 847:	83 f8 ff             	cmp    $0xffffffff,%eax
 84a:	74 1c                	je     868 <malloc+0x88>
  hp->s.size = nu;
 84c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 84f:	83 ec 0c             	sub    $0xc,%esp
 852:	83 c0 08             	add    $0x8,%eax
 855:	50                   	push   %eax
 856:	e8 f5 fe ff ff       	call   750 <free>
  return freep;
 85b:	8b 15 40 0c 00 00    	mov    0xc40,%edx
      if((p = morecore(nunits)) == 0)
 861:	83 c4 10             	add    $0x10,%esp
 864:	85 d2                	test   %edx,%edx
 866:	75 c0                	jne    828 <malloc+0x48>
        return 0;
  }
}
 868:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 86b:	31 c0                	xor    %eax,%eax
}
 86d:	5b                   	pop    %ebx
 86e:	5e                   	pop    %esi
 86f:	5f                   	pop    %edi
 870:	5d                   	pop    %ebp
 871:	c3                   	ret    
 872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 878:	39 cf                	cmp    %ecx,%edi
 87a:	74 54                	je     8d0 <malloc+0xf0>
        p->s.size -= nunits;
 87c:	29 f9                	sub    %edi,%ecx
 87e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 881:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 884:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 887:	89 15 40 0c 00 00    	mov    %edx,0xc40
}
 88d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 890:	83 c0 08             	add    $0x8,%eax
}
 893:	5b                   	pop    %ebx
 894:	5e                   	pop    %esi
 895:	5f                   	pop    %edi
 896:	5d                   	pop    %ebp
 897:	c3                   	ret    
 898:	90                   	nop
 899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 8a0:	c7 05 40 0c 00 00 44 	movl   $0xc44,0xc40
 8a7:	0c 00 00 
 8aa:	c7 05 44 0c 00 00 44 	movl   $0xc44,0xc44
 8b1:	0c 00 00 
    base.s.size = 0;
 8b4:	b8 44 0c 00 00       	mov    $0xc44,%eax
 8b9:	c7 05 48 0c 00 00 00 	movl   $0x0,0xc48
 8c0:	00 00 00 
 8c3:	e9 44 ff ff ff       	jmp    80c <malloc+0x2c>
 8c8:	90                   	nop
 8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 8d0:	8b 08                	mov    (%eax),%ecx
 8d2:	89 0a                	mov    %ecx,(%edx)
 8d4:	eb b1                	jmp    887 <malloc+0xa7>
