
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  int fd, i;
  char *pattern;

  if(argc <= 1){
  19:	83 ff 01             	cmp    $0x1,%edi
  1c:	7e 7c                	jle    9a <main+0x9a>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  1e:	8b 43 04             	mov    0x4(%ebx),%eax
  21:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  24:	83 ff 02             	cmp    $0x2,%edi
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  27:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  2c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  2f:	74 46                	je     77 <main+0x77>
  31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if((fd = open(argv[i], 0)) < 0){
  38:	83 ec 08             	sub    $0x8,%esp
  3b:	6a 00                	push   $0x0
  3d:	ff 33                	pushl  (%ebx)
  3f:	e8 ad 05 00 00       	call   5f1 <open>
  44:	83 c4 10             	add    $0x10,%esp
  47:	85 c0                	test   %eax,%eax
  49:	78 3b                	js     86 <main+0x86>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  4b:	83 ec 08             	sub    $0x8,%esp
  4e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(i = 2; i < argc; i++){
  51:	83 c6 01             	add    $0x1,%esi
    grep(pattern, fd);
  54:	50                   	push   %eax
  55:	ff 75 e0             	pushl  -0x20(%ebp)
  58:	83 c3 04             	add    $0x4,%ebx
  5b:	e8 d0 01 00 00       	call   230 <grep>
    close(fd);
  60:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  63:	89 04 24             	mov    %eax,(%esp)
  66:	e8 6e 05 00 00       	call   5d9 <close>
  for(i = 2; i < argc; i++){
  6b:	83 c4 10             	add    $0x10,%esp
  6e:	39 f7                	cmp    %esi,%edi
  70:	7f c6                	jg     38 <main+0x38>
  }
  exit();
  72:	e8 3a 05 00 00       	call   5b1 <exit>
    grep(pattern, 0);
  77:	52                   	push   %edx
  78:	52                   	push   %edx
  79:	6a 00                	push   $0x0
  7b:	50                   	push   %eax
  7c:	e8 af 01 00 00       	call   230 <grep>
    exit();
  81:	e8 2b 05 00 00       	call   5b1 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
  86:	50                   	push   %eax
  87:	ff 33                	pushl  (%ebx)
  89:	68 a8 0a 00 00       	push   $0xaa8
  8e:	6a 01                	push   $0x1
  90:	e8 9b 06 00 00       	call   730 <printf>
      exit();
  95:	e8 17 05 00 00       	call   5b1 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  9a:	51                   	push   %ecx
  9b:	51                   	push   %ecx
  9c:	68 88 0a 00 00       	push   $0xa88
  a1:	6a 02                	push   $0x2
  a3:	e8 88 06 00 00       	call   730 <printf>
    exit();
  a8:	e8 04 05 00 00       	call   5b1 <exit>
  ad:	66 90                	xchg   %ax,%ax
  af:	90                   	nop

000000b0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	83 ec 0c             	sub    $0xc,%esp
  b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  bf:	8b 7d 10             	mov    0x10(%ebp),%edi
  c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	57                   	push   %edi
  cc:	56                   	push   %esi
  cd:	e8 3e 00 00 00       	call   110 <matchhere>
  d2:	83 c4 10             	add    $0x10,%esp
  d5:	85 c0                	test   %eax,%eax
  d7:	75 1f                	jne    f8 <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  d9:	0f be 17             	movsbl (%edi),%edx
  dc:	84 d2                	test   %dl,%dl
  de:	74 0c                	je     ec <matchstar+0x3c>
  e0:	83 c7 01             	add    $0x1,%edi
  e3:	39 da                	cmp    %ebx,%edx
  e5:	74 e1                	je     c8 <matchstar+0x18>
  e7:	83 fb 2e             	cmp    $0x2e,%ebx
  ea:	74 dc                	je     c8 <matchstar+0x18>
  return 0;
}
  ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ef:	5b                   	pop    %ebx
  f0:	5e                   	pop    %esi
  f1:	5f                   	pop    %edi
  f2:	5d                   	pop    %ebp
  f3:	c3                   	ret    
  f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
  fb:	b8 01 00 00 00       	mov    $0x1,%eax
}
 100:	5b                   	pop    %ebx
 101:	5e                   	pop    %esi
 102:	5f                   	pop    %edi
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    
 105:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <matchhere>:
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	56                   	push   %esi
 115:	53                   	push   %ebx
 116:	83 ec 0c             	sub    $0xc,%esp
  if(re[0] == '\0')
 119:	8b 45 08             	mov    0x8(%ebp),%eax
{
 11c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
 11f:	0f b6 08             	movzbl (%eax),%ecx
 122:	84 c9                	test   %cl,%cl
 124:	74 67                	je     18d <matchhere+0x7d>
  if(re[1] == '*')
 126:	0f be 40 01          	movsbl 0x1(%eax),%eax
 12a:	3c 2a                	cmp    $0x2a,%al
 12c:	74 6c                	je     19a <matchhere+0x8a>
  if(re[0] == '$' && re[1] == '\0')
 12e:	80 f9 24             	cmp    $0x24,%cl
 131:	0f b6 1f             	movzbl (%edi),%ebx
 134:	75 08                	jne    13e <matchhere+0x2e>
 136:	84 c0                	test   %al,%al
 138:	0f 84 81 00 00 00    	je     1bf <matchhere+0xaf>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 13e:	84 db                	test   %bl,%bl
 140:	74 09                	je     14b <matchhere+0x3b>
 142:	38 d9                	cmp    %bl,%cl
 144:	74 3c                	je     182 <matchhere+0x72>
 146:	80 f9 2e             	cmp    $0x2e,%cl
 149:	74 37                	je     182 <matchhere+0x72>
}
 14b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 14e:	31 c0                	xor    %eax,%eax
}
 150:	5b                   	pop    %ebx
 151:	5e                   	pop    %esi
 152:	5f                   	pop    %edi
 153:	5d                   	pop    %ebp
 154:	c3                   	ret    
 155:	8d 76 00             	lea    0x0(%esi),%esi
  if(re[1] == '*')
 158:	8b 75 08             	mov    0x8(%ebp),%esi
 15b:	0f b6 4e 01          	movzbl 0x1(%esi),%ecx
 15f:	80 f9 2a             	cmp    $0x2a,%cl
 162:	74 3b                	je     19f <matchhere+0x8f>
  if(re[0] == '$' && re[1] == '\0')
 164:	3c 24                	cmp    $0x24,%al
 166:	75 04                	jne    16c <matchhere+0x5c>
 168:	84 c9                	test   %cl,%cl
 16a:	74 4f                	je     1bb <matchhere+0xab>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 16c:	0f b6 33             	movzbl (%ebx),%esi
 16f:	89 f2                	mov    %esi,%edx
 171:	84 d2                	test   %dl,%dl
 173:	74 d6                	je     14b <matchhere+0x3b>
 175:	3c 2e                	cmp    $0x2e,%al
 177:	89 df                	mov    %ebx,%edi
 179:	74 04                	je     17f <matchhere+0x6f>
 17b:	38 c2                	cmp    %al,%dl
 17d:	75 cc                	jne    14b <matchhere+0x3b>
 17f:	0f be c1             	movsbl %cl,%eax
    return matchhere(re+1, text+1);
 182:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  if(re[0] == '\0')
 186:	84 c0                	test   %al,%al
    return matchhere(re+1, text+1);
 188:	8d 5f 01             	lea    0x1(%edi),%ebx
  if(re[0] == '\0')
 18b:	75 cb                	jne    158 <matchhere+0x48>
    return 1;
 18d:	b8 01 00 00 00       	mov    $0x1,%eax
}
 192:	8d 65 f4             	lea    -0xc(%ebp),%esp
 195:	5b                   	pop    %ebx
 196:	5e                   	pop    %esi
 197:	5f                   	pop    %edi
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    
  if(re[1] == '*')
 19a:	89 fb                	mov    %edi,%ebx
 19c:	0f be c1             	movsbl %cl,%eax
    return matchstar(re[0], re+2, text);
 19f:	8b 7d 08             	mov    0x8(%ebp),%edi
 1a2:	83 ec 04             	sub    $0x4,%esp
 1a5:	53                   	push   %ebx
 1a6:	8d 57 02             	lea    0x2(%edi),%edx
 1a9:	52                   	push   %edx
 1aa:	50                   	push   %eax
 1ab:	e8 00 ff ff ff       	call   b0 <matchstar>
 1b0:	83 c4 10             	add    $0x10,%esp
}
 1b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b6:	5b                   	pop    %ebx
 1b7:	5e                   	pop    %esi
 1b8:	5f                   	pop    %edi
 1b9:	5d                   	pop    %ebp
 1ba:	c3                   	ret    
 1bb:	0f b6 5f 01          	movzbl 0x1(%edi),%ebx
    return *text == '\0';
 1bf:	31 c0                	xor    %eax,%eax
 1c1:	84 db                	test   %bl,%bl
 1c3:	0f 94 c0             	sete   %al
 1c6:	eb ca                	jmp    192 <matchhere+0x82>
 1c8:	90                   	nop
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <match>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
 1d5:	8b 75 08             	mov    0x8(%ebp),%esi
 1d8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 1db:	80 3e 5e             	cmpb   $0x5e,(%esi)
 1de:	75 11                	jne    1f1 <match+0x21>
 1e0:	eb 2e                	jmp    210 <match+0x40>
 1e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 1e8:	83 c3 01             	add    $0x1,%ebx
 1eb:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
 1ef:	74 16                	je     207 <match+0x37>
    if(matchhere(re, text))
 1f1:	83 ec 08             	sub    $0x8,%esp
 1f4:	53                   	push   %ebx
 1f5:	56                   	push   %esi
 1f6:	e8 15 ff ff ff       	call   110 <matchhere>
 1fb:	83 c4 10             	add    $0x10,%esp
 1fe:	85 c0                	test   %eax,%eax
 200:	74 e6                	je     1e8 <match+0x18>
      return 1;
 202:	b8 01 00 00 00       	mov    $0x1,%eax
}
 207:	8d 65 f8             	lea    -0x8(%ebp),%esp
 20a:	5b                   	pop    %ebx
 20b:	5e                   	pop    %esi
 20c:	5d                   	pop    %ebp
 20d:	c3                   	ret    
 20e:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
 210:	83 c6 01             	add    $0x1,%esi
 213:	89 75 08             	mov    %esi,0x8(%ebp)
}
 216:	8d 65 f8             	lea    -0x8(%ebp),%esp
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 21c:	e9 ef fe ff ff       	jmp    110 <matchhere>
 221:	eb 0d                	jmp    230 <grep>
 223:	90                   	nop
 224:	90                   	nop
 225:	90                   	nop
 226:	90                   	nop
 227:	90                   	nop
 228:	90                   	nop
 229:	90                   	nop
 22a:	90                   	nop
 22b:	90                   	nop
 22c:	90                   	nop
 22d:	90                   	nop
 22e:	90                   	nop
 22f:	90                   	nop

00000230 <grep>:
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
 235:	53                   	push   %ebx
  m = 0;
 236:	31 f6                	xor    %esi,%esi
{
 238:	83 ec 1c             	sub    $0x1c,%esp
 23b:	90                   	nop
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 240:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 245:	83 ec 04             	sub    $0x4,%esp
 248:	29 f0                	sub    %esi,%eax
 24a:	50                   	push   %eax
 24b:	8d 86 e0 0e 00 00    	lea    0xee0(%esi),%eax
 251:	50                   	push   %eax
 252:	ff 75 0c             	pushl  0xc(%ebp)
 255:	e8 6f 03 00 00       	call   5c9 <read>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	85 c0                	test   %eax,%eax
 25f:	0f 8e bb 00 00 00    	jle    320 <grep+0xf0>
    m += n;
 265:	01 c6                	add    %eax,%esi
    p = buf;
 267:	bb e0 0e 00 00       	mov    $0xee0,%ebx
    buf[m] = '\0';
 26c:	c6 86 e0 0e 00 00 00 	movb   $0x0,0xee0(%esi)
 273:	89 75 e4             	mov    %esi,-0x1c(%ebp)
 276:	8d 76 00             	lea    0x0(%esi),%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    while((q = strchr(p, '\n')) != 0){
 280:	83 ec 08             	sub    $0x8,%esp
 283:	6a 0a                	push   $0xa
 285:	53                   	push   %ebx
 286:	e8 75 01 00 00       	call   400 <strchr>
 28b:	83 c4 10             	add    $0x10,%esp
 28e:	85 c0                	test   %eax,%eax
 290:	89 c6                	mov    %eax,%esi
 292:	74 44                	je     2d8 <grep+0xa8>
      if(match(pattern, p)){
 294:	83 ec 08             	sub    $0x8,%esp
      *q = 0;
 297:	c6 06 00             	movb   $0x0,(%esi)
 29a:	8d 7e 01             	lea    0x1(%esi),%edi
      if(match(pattern, p)){
 29d:	53                   	push   %ebx
 29e:	ff 75 08             	pushl  0x8(%ebp)
 2a1:	e8 2a ff ff ff       	call   1d0 <match>
 2a6:	83 c4 10             	add    $0x10,%esp
 2a9:	85 c0                	test   %eax,%eax
 2ab:	75 0b                	jne    2b8 <grep+0x88>
      p = q+1;
 2ad:	89 fb                	mov    %edi,%ebx
 2af:	eb cf                	jmp    280 <grep+0x50>
 2b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        write(1, p, q+1 - p);
 2b8:	89 f8                	mov    %edi,%eax
 2ba:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 2bd:	c6 06 0a             	movb   $0xa,(%esi)
        write(1, p, q+1 - p);
 2c0:	29 d8                	sub    %ebx,%eax
 2c2:	50                   	push   %eax
 2c3:	53                   	push   %ebx
      p = q+1;
 2c4:	89 fb                	mov    %edi,%ebx
        write(1, p, q+1 - p);
 2c6:	6a 01                	push   $0x1
 2c8:	e8 04 03 00 00       	call   5d1 <write>
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	eb ae                	jmp    280 <grep+0x50>
 2d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(p == buf)
 2d8:	81 fb e0 0e 00 00    	cmp    $0xee0,%ebx
 2de:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 2e1:	74 2d                	je     310 <grep+0xe0>
    if(m > 0){
 2e3:	85 f6                	test   %esi,%esi
 2e5:	0f 8e 55 ff ff ff    	jle    240 <grep+0x10>
      m -= p - buf;
 2eb:	89 d8                	mov    %ebx,%eax
      memmove(buf, p, m);
 2ed:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 2f0:	2d e0 0e 00 00       	sub    $0xee0,%eax
 2f5:	29 c6                	sub    %eax,%esi
      memmove(buf, p, m);
 2f7:	56                   	push   %esi
 2f8:	53                   	push   %ebx
 2f9:	68 e0 0e 00 00       	push   $0xee0
 2fe:	e8 4d 02 00 00       	call   550 <memmove>
 303:	83 c4 10             	add    $0x10,%esp
 306:	e9 35 ff ff ff       	jmp    240 <grep+0x10>
 30b:	90                   	nop
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m = 0;
 310:	31 f6                	xor    %esi,%esi
 312:	e9 29 ff ff ff       	jmp    240 <grep+0x10>
 317:	89 f6                	mov    %esi,%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}
 320:	8d 65 f4             	lea    -0xc(%ebp),%esp
 323:	5b                   	pop    %ebx
 324:	5e                   	pop    %esi
 325:	5f                   	pop    %edi
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    
 328:	66 90                	xchg   %ax,%ax
 32a:	66 90                	xchg   %ax,%ax
 32c:	66 90                	xchg   %ax,%ax
 32e:	66 90                	xchg   %ax,%ax

00000330 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	8b 45 08             	mov    0x8(%ebp),%eax
 337:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 33a:	89 c2                	mov    %eax,%edx
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 340:	83 c1 01             	add    $0x1,%ecx
 343:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 347:	83 c2 01             	add    $0x1,%edx
 34a:	84 db                	test   %bl,%bl
 34c:	88 5a ff             	mov    %bl,-0x1(%edx)
 34f:	75 ef                	jne    340 <strcpy+0x10>
    ;
  return os;
}
 351:	5b                   	pop    %ebx
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    
 354:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 35a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000360 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
 367:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 36a:	0f b6 02             	movzbl (%edx),%eax
 36d:	0f b6 19             	movzbl (%ecx),%ebx
 370:	84 c0                	test   %al,%al
 372:	75 1c                	jne    390 <strcmp+0x30>
 374:	eb 2a                	jmp    3a0 <strcmp+0x40>
 376:	8d 76 00             	lea    0x0(%esi),%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 380:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 383:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 386:	83 c1 01             	add    $0x1,%ecx
 389:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 38c:	84 c0                	test   %al,%al
 38e:	74 10                	je     3a0 <strcmp+0x40>
 390:	38 d8                	cmp    %bl,%al
 392:	74 ec                	je     380 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 394:	29 d8                	sub    %ebx,%eax
}
 396:	5b                   	pop    %ebx
 397:	5d                   	pop    %ebp
 398:	c3                   	ret    
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3a2:	29 d8                	sub    %ebx,%eax
}
 3a4:	5b                   	pop    %ebx
 3a5:	5d                   	pop    %ebp
 3a6:	c3                   	ret    
 3a7:	89 f6                	mov    %esi,%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003b0 <strlen>:

uint
strlen(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3b6:	80 39 00             	cmpb   $0x0,(%ecx)
 3b9:	74 15                	je     3d0 <strlen+0x20>
 3bb:	31 d2                	xor    %edx,%edx
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
 3c0:	83 c2 01             	add    $0x1,%edx
 3c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3c7:	89 d0                	mov    %edx,%eax
 3c9:	75 f5                	jne    3c0 <strlen+0x10>
    ;
  return n;
}
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 3d0:	31 c0                	xor    %eax,%eax
}
 3d2:	5d                   	pop    %ebp
 3d3:	c3                   	ret    
 3d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ed:	89 d7                	mov    %edx,%edi
 3ef:	fc                   	cld    
 3f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3f2:	89 d0                	mov    %edx,%eax
 3f4:	5f                   	pop    %edi
 3f5:	5d                   	pop    %ebp
 3f6:	c3                   	ret    
 3f7:	89 f6                	mov    %esi,%esi
 3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000400 <strchr>:

char*
strchr(const char *s, char c)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	53                   	push   %ebx
 404:	8b 45 08             	mov    0x8(%ebp),%eax
 407:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 40a:	0f b6 10             	movzbl (%eax),%edx
 40d:	84 d2                	test   %dl,%dl
 40f:	74 1d                	je     42e <strchr+0x2e>
    if(*s == c)
 411:	38 d3                	cmp    %dl,%bl
 413:	89 d9                	mov    %ebx,%ecx
 415:	75 0d                	jne    424 <strchr+0x24>
 417:	eb 17                	jmp    430 <strchr+0x30>
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 420:	38 ca                	cmp    %cl,%dl
 422:	74 0c                	je     430 <strchr+0x30>
  for(; *s; s++)
 424:	83 c0 01             	add    $0x1,%eax
 427:	0f b6 10             	movzbl (%eax),%edx
 42a:	84 d2                	test   %dl,%dl
 42c:	75 f2                	jne    420 <strchr+0x20>
      return (char*)s;
  return 0;
 42e:	31 c0                	xor    %eax,%eax
}
 430:	5b                   	pop    %ebx
 431:	5d                   	pop    %ebp
 432:	c3                   	ret    
 433:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000440 <gets>:

char*
gets(char *buf, int max)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 446:	31 f6                	xor    %esi,%esi
 448:	89 f3                	mov    %esi,%ebx
{
 44a:	83 ec 1c             	sub    $0x1c,%esp
 44d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 450:	eb 2f                	jmp    481 <gets+0x41>
 452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 458:	8d 45 e7             	lea    -0x19(%ebp),%eax
 45b:	83 ec 04             	sub    $0x4,%esp
 45e:	6a 01                	push   $0x1
 460:	50                   	push   %eax
 461:	6a 00                	push   $0x0
 463:	e8 61 01 00 00       	call   5c9 <read>
    if(cc < 1)
 468:	83 c4 10             	add    $0x10,%esp
 46b:	85 c0                	test   %eax,%eax
 46d:	7e 1c                	jle    48b <gets+0x4b>
      break;
    buf[i++] = c;
 46f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 473:	83 c7 01             	add    $0x1,%edi
 476:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 479:	3c 0a                	cmp    $0xa,%al
 47b:	74 23                	je     4a0 <gets+0x60>
 47d:	3c 0d                	cmp    $0xd,%al
 47f:	74 1f                	je     4a0 <gets+0x60>
  for(i=0; i+1 < max; ){
 481:	83 c3 01             	add    $0x1,%ebx
 484:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 487:	89 fe                	mov    %edi,%esi
 489:	7c cd                	jl     458 <gets+0x18>
 48b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 48d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 490:	c6 03 00             	movb   $0x0,(%ebx)
}
 493:	8d 65 f4             	lea    -0xc(%ebp),%esp
 496:	5b                   	pop    %ebx
 497:	5e                   	pop    %esi
 498:	5f                   	pop    %edi
 499:	5d                   	pop    %ebp
 49a:	c3                   	ret    
 49b:	90                   	nop
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4a0:	8b 75 08             	mov    0x8(%ebp),%esi
 4a3:	8b 45 08             	mov    0x8(%ebp),%eax
 4a6:	01 de                	add    %ebx,%esi
 4a8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4aa:	c6 03 00             	movb   $0x0,(%ebx)
}
 4ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b0:	5b                   	pop    %ebx
 4b1:	5e                   	pop    %esi
 4b2:	5f                   	pop    %edi
 4b3:	5d                   	pop    %ebp
 4b4:	c3                   	ret    
 4b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	56                   	push   %esi
 4c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c5:	83 ec 08             	sub    $0x8,%esp
 4c8:	6a 00                	push   $0x0
 4ca:	ff 75 08             	pushl  0x8(%ebp)
 4cd:	e8 1f 01 00 00       	call   5f1 <open>
  if(fd < 0)
 4d2:	83 c4 10             	add    $0x10,%esp
 4d5:	85 c0                	test   %eax,%eax
 4d7:	78 27                	js     500 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4d9:	83 ec 08             	sub    $0x8,%esp
 4dc:	ff 75 0c             	pushl  0xc(%ebp)
 4df:	89 c3                	mov    %eax,%ebx
 4e1:	50                   	push   %eax
 4e2:	e8 22 01 00 00       	call   609 <fstat>
  close(fd);
 4e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4ea:	89 c6                	mov    %eax,%esi
  close(fd);
 4ec:	e8 e8 00 00 00       	call   5d9 <close>
  return r;
 4f1:	83 c4 10             	add    $0x10,%esp
}
 4f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4f7:	89 f0                	mov    %esi,%eax
 4f9:	5b                   	pop    %ebx
 4fa:	5e                   	pop    %esi
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret    
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 500:	be ff ff ff ff       	mov    $0xffffffff,%esi
 505:	eb ed                	jmp    4f4 <stat+0x34>
 507:	89 f6                	mov    %esi,%esi
 509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000510 <atoi>:

int
atoi(const char *s)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	53                   	push   %ebx
 514:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 517:	0f be 11             	movsbl (%ecx),%edx
 51a:	8d 42 d0             	lea    -0x30(%edx),%eax
 51d:	3c 09                	cmp    $0x9,%al
  n = 0;
 51f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 524:	77 1f                	ja     545 <atoi+0x35>
 526:	8d 76 00             	lea    0x0(%esi),%esi
 529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 530:	8d 04 80             	lea    (%eax,%eax,4),%eax
 533:	83 c1 01             	add    $0x1,%ecx
 536:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 53a:	0f be 11             	movsbl (%ecx),%edx
 53d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 540:	80 fb 09             	cmp    $0x9,%bl
 543:	76 eb                	jbe    530 <atoi+0x20>
  return n;
}
 545:	5b                   	pop    %ebx
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    
 548:	90                   	nop
 549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000550 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	56                   	push   %esi
 554:	53                   	push   %ebx
 555:	8b 5d 10             	mov    0x10(%ebp),%ebx
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 55e:	85 db                	test   %ebx,%ebx
 560:	7e 14                	jle    576 <memmove+0x26>
 562:	31 d2                	xor    %edx,%edx
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 568:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 56c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 56f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 572:	39 d3                	cmp    %edx,%ebx
 574:	75 f2                	jne    568 <memmove+0x18>
  return vdst;
}
 576:	5b                   	pop    %ebx
 577:	5e                   	pop    %esi
 578:	5d                   	pop    %ebp
 579:	c3                   	ret    
 57a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000580 <srand>:

static uint seed = 1;

void
srand(uint s)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
  seed = s;
 583:	8b 45 08             	mov    0x8(%ebp),%eax
}
 586:	5d                   	pop    %ebp
  seed = s;
 587:	a3 a0 0e 00 00       	mov    %eax,0xea0
}
 58c:	c3                   	ret    
 58d:	8d 76 00             	lea    0x0(%esi),%esi

00000590 <random>:

uint
random(void)
{
  seed = seed
    * 1103515245
 590:	69 05 a0 0e 00 00 6d 	imul   $0x41c64e6d,0xea0,%eax
 597:	4e c6 41 
{
 59a:	55                   	push   %ebp
 59b:	89 e5                	mov    %esp,%ebp
    + 12345
    % (1 << 31);
  return seed;
}
 59d:	5d                   	pop    %ebp
    + 12345
 59e:	05 39 30 00 00       	add    $0x3039,%eax
  seed = seed
 5a3:	a3 a0 0e 00 00       	mov    %eax,0xea0
}
 5a8:	c3                   	ret    

000005a9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5a9:	b8 01 00 00 00       	mov    $0x1,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <exit>:
SYSCALL(exit)
 5b1:	b8 02 00 00 00       	mov    $0x2,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <wait>:
SYSCALL(wait)
 5b9:	b8 03 00 00 00       	mov    $0x3,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <pipe>:
SYSCALL(pipe)
 5c1:	b8 04 00 00 00       	mov    $0x4,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <read>:
SYSCALL(read)
 5c9:	b8 05 00 00 00       	mov    $0x5,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <write>:
SYSCALL(write)
 5d1:	b8 10 00 00 00       	mov    $0x10,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <close>:
SYSCALL(close)
 5d9:	b8 15 00 00 00       	mov    $0x15,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <kill>:
SYSCALL(kill)
 5e1:	b8 06 00 00 00       	mov    $0x6,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <exec>:
SYSCALL(exec)
 5e9:	b8 07 00 00 00       	mov    $0x7,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <open>:
SYSCALL(open)
 5f1:	b8 0f 00 00 00       	mov    $0xf,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <mknod>:
SYSCALL(mknod)
 5f9:	b8 11 00 00 00       	mov    $0x11,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <unlink>:
SYSCALL(unlink)
 601:	b8 12 00 00 00       	mov    $0x12,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <fstat>:
SYSCALL(fstat)
 609:	b8 08 00 00 00       	mov    $0x8,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <link>:
SYSCALL(link)
 611:	b8 13 00 00 00       	mov    $0x13,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <mkdir>:
SYSCALL(mkdir)
 619:	b8 14 00 00 00       	mov    $0x14,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <chdir>:
SYSCALL(chdir)
 621:	b8 09 00 00 00       	mov    $0x9,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <dup>:
SYSCALL(dup)
 629:	b8 0a 00 00 00       	mov    $0xa,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <getpid>:
SYSCALL(getpid)
 631:	b8 0b 00 00 00       	mov    $0xb,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <sbrk>:
SYSCALL(sbrk)
 639:	b8 0c 00 00 00       	mov    $0xc,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <sleep>:
SYSCALL(sleep)
 641:	b8 0d 00 00 00       	mov    $0xd,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <uptime>:
SYSCALL(uptime)
 649:	b8 0e 00 00 00       	mov    $0xe,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <sem_init>:
SYSCALL(sem_init)
 651:	b8 16 00 00 00       	mov    $0x16,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <sem_acquire>:
SYSCALL(sem_acquire)
 659:	b8 17 00 00 00       	mov    $0x17,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <sem_release>:
SYSCALL(sem_release)
 661:	b8 18 00 00 00       	mov    $0x18,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <setvar>:
SYSCALL(setvar)
 669:	b8 19 00 00 00       	mov    $0x19,%eax
 66e:	cd 40                	int    $0x40
 670:	c3                   	ret    

00000671 <getvar>:
SYSCALL(getvar)
 671:	b8 1a 00 00 00       	mov    $0x1a,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <modvar>:
SYSCALL(modvar)
 679:	b8 1b 00 00 00       	mov    $0x1b,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    
 681:	66 90                	xchg   %ax,%ax
 683:	66 90                	xchg   %ax,%ax
 685:	66 90                	xchg   %ax,%ax
 687:	66 90                	xchg   %ax,%ax
 689:	66 90                	xchg   %ax,%ax
 68b:	66 90                	xchg   %ax,%ax
 68d:	66 90                	xchg   %ax,%ax
 68f:	90                   	nop

00000690 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 699:	85 d2                	test   %edx,%edx
{
 69b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 69e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 6a0:	79 76                	jns    718 <printint+0x88>
 6a2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6a6:	74 70                	je     718 <printint+0x88>
    x = -xx;
 6a8:	f7 d8                	neg    %eax
    neg = 1;
 6aa:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6b1:	31 f6                	xor    %esi,%esi
 6b3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 6b6:	eb 0a                	jmp    6c2 <printint+0x32>
 6b8:	90                   	nop
 6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 6c0:	89 fe                	mov    %edi,%esi
 6c2:	31 d2                	xor    %edx,%edx
 6c4:	8d 7e 01             	lea    0x1(%esi),%edi
 6c7:	f7 f1                	div    %ecx
 6c9:	0f b6 92 c8 0a 00 00 	movzbl 0xac8(%edx),%edx
  }while((x /= base) != 0);
 6d0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 6d2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 6d5:	75 e9                	jne    6c0 <printint+0x30>
  if(neg)
 6d7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 6da:	85 c0                	test   %eax,%eax
 6dc:	74 08                	je     6e6 <printint+0x56>
    buf[i++] = '-';
 6de:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 6e3:	8d 7e 02             	lea    0x2(%esi),%edi
 6e6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 6ea:	8b 7d c0             	mov    -0x40(%ebp),%edi
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
 6f0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 6f3:	83 ec 04             	sub    $0x4,%esp
 6f6:	83 ee 01             	sub    $0x1,%esi
 6f9:	6a 01                	push   $0x1
 6fb:	53                   	push   %ebx
 6fc:	57                   	push   %edi
 6fd:	88 45 d7             	mov    %al,-0x29(%ebp)
 700:	e8 cc fe ff ff       	call   5d1 <write>

  while(--i >= 0)
 705:	83 c4 10             	add    $0x10,%esp
 708:	39 de                	cmp    %ebx,%esi
 70a:	75 e4                	jne    6f0 <printint+0x60>
    putc(fd, buf[i]);
}
 70c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 70f:	5b                   	pop    %ebx
 710:	5e                   	pop    %esi
 711:	5f                   	pop    %edi
 712:	5d                   	pop    %ebp
 713:	c3                   	ret    
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 718:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 71f:	eb 90                	jmp    6b1 <printint+0x21>
 721:	eb 0d                	jmp    730 <printf>
 723:	90                   	nop
 724:	90                   	nop
 725:	90                   	nop
 726:	90                   	nop
 727:	90                   	nop
 728:	90                   	nop
 729:	90                   	nop
 72a:	90                   	nop
 72b:	90                   	nop
 72c:	90                   	nop
 72d:	90                   	nop
 72e:	90                   	nop
 72f:	90                   	nop

00000730 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 739:	8b 75 0c             	mov    0xc(%ebp),%esi
 73c:	0f b6 1e             	movzbl (%esi),%ebx
 73f:	84 db                	test   %bl,%bl
 741:	0f 84 b3 00 00 00    	je     7fa <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 747:	8d 45 10             	lea    0x10(%ebp),%eax
 74a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 74d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 74f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 752:	eb 2f                	jmp    783 <printf+0x53>
 754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 758:	83 f8 25             	cmp    $0x25,%eax
 75b:	0f 84 a7 00 00 00    	je     808 <printf+0xd8>
  write(fd, &c, 1);
 761:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 764:	83 ec 04             	sub    $0x4,%esp
 767:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 76a:	6a 01                	push   $0x1
 76c:	50                   	push   %eax
 76d:	ff 75 08             	pushl  0x8(%ebp)
 770:	e8 5c fe ff ff       	call   5d1 <write>
 775:	83 c4 10             	add    $0x10,%esp
 778:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 77b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 77f:	84 db                	test   %bl,%bl
 781:	74 77                	je     7fa <printf+0xca>
    if(state == 0){
 783:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 785:	0f be cb             	movsbl %bl,%ecx
 788:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 78b:	74 cb                	je     758 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 78d:	83 ff 25             	cmp    $0x25,%edi
 790:	75 e6                	jne    778 <printf+0x48>
      if(c == 'd'){
 792:	83 f8 64             	cmp    $0x64,%eax
 795:	0f 84 05 01 00 00    	je     8a0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 79b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 7a1:	83 f9 70             	cmp    $0x70,%ecx
 7a4:	74 72                	je     818 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7a6:	83 f8 73             	cmp    $0x73,%eax
 7a9:	0f 84 99 00 00 00    	je     848 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7af:	83 f8 63             	cmp    $0x63,%eax
 7b2:	0f 84 08 01 00 00    	je     8c0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7b8:	83 f8 25             	cmp    $0x25,%eax
 7bb:	0f 84 ef 00 00 00    	je     8b0 <printf+0x180>
  write(fd, &c, 1);
 7c1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 7c4:	83 ec 04             	sub    $0x4,%esp
 7c7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7cb:	6a 01                	push   $0x1
 7cd:	50                   	push   %eax
 7ce:	ff 75 08             	pushl  0x8(%ebp)
 7d1:	e8 fb fd ff ff       	call   5d1 <write>
 7d6:	83 c4 0c             	add    $0xc,%esp
 7d9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 7dc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 7df:	6a 01                	push   $0x1
 7e1:	50                   	push   %eax
 7e2:	ff 75 08             	pushl  0x8(%ebp)
 7e5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7e8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 7ea:	e8 e2 fd ff ff       	call   5d1 <write>
  for(i = 0; fmt[i]; i++){
 7ef:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 7f3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7f6:	84 db                	test   %bl,%bl
 7f8:	75 89                	jne    783 <printf+0x53>
    }
  }
}
 7fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7fd:	5b                   	pop    %ebx
 7fe:	5e                   	pop    %esi
 7ff:	5f                   	pop    %edi
 800:	5d                   	pop    %ebp
 801:	c3                   	ret    
 802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 808:	bf 25 00 00 00       	mov    $0x25,%edi
 80d:	e9 66 ff ff ff       	jmp    778 <printf+0x48>
 812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 818:	83 ec 0c             	sub    $0xc,%esp
 81b:	b9 10 00 00 00       	mov    $0x10,%ecx
 820:	6a 00                	push   $0x0
 822:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 825:	8b 45 08             	mov    0x8(%ebp),%eax
 828:	8b 17                	mov    (%edi),%edx
 82a:	e8 61 fe ff ff       	call   690 <printint>
        ap++;
 82f:	89 f8                	mov    %edi,%eax
 831:	83 c4 10             	add    $0x10,%esp
      state = 0;
 834:	31 ff                	xor    %edi,%edi
        ap++;
 836:	83 c0 04             	add    $0x4,%eax
 839:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 83c:	e9 37 ff ff ff       	jmp    778 <printf+0x48>
 841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 848:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 84b:	8b 08                	mov    (%eax),%ecx
        ap++;
 84d:	83 c0 04             	add    $0x4,%eax
 850:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 853:	85 c9                	test   %ecx,%ecx
 855:	0f 84 8e 00 00 00    	je     8e9 <printf+0x1b9>
        while(*s != 0){
 85b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 85e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 860:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 862:	84 c0                	test   %al,%al
 864:	0f 84 0e ff ff ff    	je     778 <printf+0x48>
 86a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 86d:	89 de                	mov    %ebx,%esi
 86f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 872:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 875:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 878:	83 ec 04             	sub    $0x4,%esp
          s++;
 87b:	83 c6 01             	add    $0x1,%esi
 87e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 881:	6a 01                	push   $0x1
 883:	57                   	push   %edi
 884:	53                   	push   %ebx
 885:	e8 47 fd ff ff       	call   5d1 <write>
        while(*s != 0){
 88a:	0f b6 06             	movzbl (%esi),%eax
 88d:	83 c4 10             	add    $0x10,%esp
 890:	84 c0                	test   %al,%al
 892:	75 e4                	jne    878 <printf+0x148>
 894:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 897:	31 ff                	xor    %edi,%edi
 899:	e9 da fe ff ff       	jmp    778 <printf+0x48>
 89e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 8a0:	83 ec 0c             	sub    $0xc,%esp
 8a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8a8:	6a 01                	push   $0x1
 8aa:	e9 73 ff ff ff       	jmp    822 <printf+0xf2>
 8af:	90                   	nop
  write(fd, &c, 1);
 8b0:	83 ec 04             	sub    $0x4,%esp
 8b3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 8b6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 8b9:	6a 01                	push   $0x1
 8bb:	e9 21 ff ff ff       	jmp    7e1 <printf+0xb1>
        putc(fd, *ap);
 8c0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 8c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 8c6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 8c8:	6a 01                	push   $0x1
        ap++;
 8ca:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 8cd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 8d0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8d3:	50                   	push   %eax
 8d4:	ff 75 08             	pushl  0x8(%ebp)
 8d7:	e8 f5 fc ff ff       	call   5d1 <write>
        ap++;
 8dc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 8df:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8e2:	31 ff                	xor    %edi,%edi
 8e4:	e9 8f fe ff ff       	jmp    778 <printf+0x48>
          s = "(null)";
 8e9:	bb be 0a 00 00       	mov    $0xabe,%ebx
        while(*s != 0){
 8ee:	b8 28 00 00 00       	mov    $0x28,%eax
 8f3:	e9 72 ff ff ff       	jmp    86a <printf+0x13a>
 8f8:	66 90                	xchg   %ax,%ax
 8fa:	66 90                	xchg   %ax,%ax
 8fc:	66 90                	xchg   %ax,%ax
 8fe:	66 90                	xchg   %ax,%ax

00000900 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 900:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 901:	a1 c0 0e 00 00       	mov    0xec0,%eax
{
 906:	89 e5                	mov    %esp,%ebp
 908:	57                   	push   %edi
 909:	56                   	push   %esi
 90a:	53                   	push   %ebx
 90b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 90e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 918:	39 c8                	cmp    %ecx,%eax
 91a:	8b 10                	mov    (%eax),%edx
 91c:	73 32                	jae    950 <free+0x50>
 91e:	39 d1                	cmp    %edx,%ecx
 920:	72 04                	jb     926 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 922:	39 d0                	cmp    %edx,%eax
 924:	72 32                	jb     958 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 926:	8b 73 fc             	mov    -0x4(%ebx),%esi
 929:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 92c:	39 fa                	cmp    %edi,%edx
 92e:	74 30                	je     960 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 930:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 933:	8b 50 04             	mov    0x4(%eax),%edx
 936:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 939:	39 f1                	cmp    %esi,%ecx
 93b:	74 3a                	je     977 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 93d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 93f:	a3 c0 0e 00 00       	mov    %eax,0xec0
}
 944:	5b                   	pop    %ebx
 945:	5e                   	pop    %esi
 946:	5f                   	pop    %edi
 947:	5d                   	pop    %ebp
 948:	c3                   	ret    
 949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 950:	39 d0                	cmp    %edx,%eax
 952:	72 04                	jb     958 <free+0x58>
 954:	39 d1                	cmp    %edx,%ecx
 956:	72 ce                	jb     926 <free+0x26>
{
 958:	89 d0                	mov    %edx,%eax
 95a:	eb bc                	jmp    918 <free+0x18>
 95c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 960:	03 72 04             	add    0x4(%edx),%esi
 963:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 966:	8b 10                	mov    (%eax),%edx
 968:	8b 12                	mov    (%edx),%edx
 96a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 96d:	8b 50 04             	mov    0x4(%eax),%edx
 970:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 973:	39 f1                	cmp    %esi,%ecx
 975:	75 c6                	jne    93d <free+0x3d>
    p->s.size += bp->s.size;
 977:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 97a:	a3 c0 0e 00 00       	mov    %eax,0xec0
    p->s.size += bp->s.size;
 97f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 982:	8b 53 f8             	mov    -0x8(%ebx),%edx
 985:	89 10                	mov    %edx,(%eax)
}
 987:	5b                   	pop    %ebx
 988:	5e                   	pop    %esi
 989:	5f                   	pop    %edi
 98a:	5d                   	pop    %ebp
 98b:	c3                   	ret    
 98c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000990 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	57                   	push   %edi
 994:	56                   	push   %esi
 995:	53                   	push   %ebx
 996:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 999:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 99c:	8b 15 c0 0e 00 00    	mov    0xec0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a2:	8d 78 07             	lea    0x7(%eax),%edi
 9a5:	c1 ef 03             	shr    $0x3,%edi
 9a8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 9ab:	85 d2                	test   %edx,%edx
 9ad:	0f 84 9d 00 00 00    	je     a50 <malloc+0xc0>
 9b3:	8b 02                	mov    (%edx),%eax
 9b5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 9b8:	39 cf                	cmp    %ecx,%edi
 9ba:	76 6c                	jbe    a28 <malloc+0x98>
 9bc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 9c2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 9c7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 9ca:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 9d1:	eb 0e                	jmp    9e1 <malloc+0x51>
 9d3:	90                   	nop
 9d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9da:	8b 48 04             	mov    0x4(%eax),%ecx
 9dd:	39 f9                	cmp    %edi,%ecx
 9df:	73 47                	jae    a28 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9e1:	39 05 c0 0e 00 00    	cmp    %eax,0xec0
 9e7:	89 c2                	mov    %eax,%edx
 9e9:	75 ed                	jne    9d8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 9eb:	83 ec 0c             	sub    $0xc,%esp
 9ee:	56                   	push   %esi
 9ef:	e8 45 fc ff ff       	call   639 <sbrk>
  if(p == (char*)-1)
 9f4:	83 c4 10             	add    $0x10,%esp
 9f7:	83 f8 ff             	cmp    $0xffffffff,%eax
 9fa:	74 1c                	je     a18 <malloc+0x88>
  hp->s.size = nu;
 9fc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9ff:	83 ec 0c             	sub    $0xc,%esp
 a02:	83 c0 08             	add    $0x8,%eax
 a05:	50                   	push   %eax
 a06:	e8 f5 fe ff ff       	call   900 <free>
  return freep;
 a0b:	8b 15 c0 0e 00 00    	mov    0xec0,%edx
      if((p = morecore(nunits)) == 0)
 a11:	83 c4 10             	add    $0x10,%esp
 a14:	85 d2                	test   %edx,%edx
 a16:	75 c0                	jne    9d8 <malloc+0x48>
        return 0;
  }
}
 a18:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a1b:	31 c0                	xor    %eax,%eax
}
 a1d:	5b                   	pop    %ebx
 a1e:	5e                   	pop    %esi
 a1f:	5f                   	pop    %edi
 a20:	5d                   	pop    %ebp
 a21:	c3                   	ret    
 a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a28:	39 cf                	cmp    %ecx,%edi
 a2a:	74 54                	je     a80 <malloc+0xf0>
        p->s.size -= nunits;
 a2c:	29 f9                	sub    %edi,%ecx
 a2e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a31:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a34:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 a37:	89 15 c0 0e 00 00    	mov    %edx,0xec0
}
 a3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a40:	83 c0 08             	add    $0x8,%eax
}
 a43:	5b                   	pop    %ebx
 a44:	5e                   	pop    %esi
 a45:	5f                   	pop    %edi
 a46:	5d                   	pop    %ebp
 a47:	c3                   	ret    
 a48:	90                   	nop
 a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 a50:	c7 05 c0 0e 00 00 c4 	movl   $0xec4,0xec0
 a57:	0e 00 00 
 a5a:	c7 05 c4 0e 00 00 c4 	movl   $0xec4,0xec4
 a61:	0e 00 00 
    base.s.size = 0;
 a64:	b8 c4 0e 00 00       	mov    $0xec4,%eax
 a69:	c7 05 c8 0e 00 00 00 	movl   $0x0,0xec8
 a70:	00 00 00 
 a73:	e9 44 ff ff ff       	jmp    9bc <malloc+0x2c>
 a78:	90                   	nop
 a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 a80:	8b 08                	mov    (%eax),%ecx
 a82:	89 0a                	mov    %ecx,(%edx)
 a84:	eb b1                	jmp    a37 <malloc+0xa7>
