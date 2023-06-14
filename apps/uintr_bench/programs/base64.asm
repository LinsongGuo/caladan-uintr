
base64.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <encode_size>:

typedef unsigned int uint;
const char* chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
static char decode_table[256];

int encode_size(int size) {
   0:	f3 0f 1e fa          	endbr64 
  return (int)(size * 4 / 3.0) + 6;
   4:	c1 e7 02             	shl    $0x2,%edi
   7:	66 0f ef c0          	pxor   %xmm0,%xmm0
   b:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   f:	f2 0f 5e 05 00 00 00 	divsd  0x0(%rip),%xmm0        # 17 <encode_size+0x17>
  16:	00 
  17:	f2 0f 2c c0          	cvttsd2si %xmm0,%eax
  1b:	83 c0 06             	add    $0x6,%eax
}
  1e:	c3                   	ret    
  1f:	90                   	nop

0000000000000020 <decode_size>:

int decode_size(int size) {
  20:	f3 0f 1e fa          	endbr64 
  return (int)(size * 3 / 4.0) + 6;
  24:	8d 04 7f             	lea    (%rdi,%rdi,2),%eax
  27:	66 0f ef c0          	pxor   %xmm0,%xmm0
  2b:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
  2f:	f2 0f 59 05 00 00 00 	mulsd  0x0(%rip),%xmm0        # 37 <decode_size+0x17>
  36:	00 
  37:	f2 0f 2c c0          	cvttsd2si %xmm0,%eax
  3b:	83 c0 06             	add    $0x6,%eax
}
  3e:	c3                   	ret    
  3f:	90                   	nop

0000000000000040 <init_decode_table>:

void init_decode_table() {
  40:	f3 0f 1e fa          	endbr64 
  44:	b9 bf ff ff ff       	mov    $0xffffffbf,%ecx
  49:	31 c0                	xor    %eax,%eax
    char ch = (char)i;
    char code = -1;
    if (ch >= 'A' && ch <= 'Z') code = ch - 0x41;
    if (ch >= 'a' && ch <= 'z') code = ch - 0x47;
    if (ch >= '0' && ch <= '9') code = ch + 0x04; 
    if (ch == '+' || ch == '-') code = 0x3E;
  4b:	bf 3e 00 00 00       	mov    $0x3e,%edi
  50:	4c 8d 05 00 00 00 00 	lea    0x0(%rip),%r8        # 57 <init_decode_table+0x17>
  57:	eb 1a                	jmp    73 <init_decode_table+0x33>
  59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    if (ch == '/' || ch == '_') code = 0x3F;
    decode_table[i] = code;
  60:	41 88 14 00          	mov    %dl,(%r8,%rax,1)
  for (int i = 0; i < 256; i++) {
  64:	48 83 c0 01          	add    $0x1,%rax
  68:	83 c1 01             	add    $0x1,%ecx
  6b:	48 3d 00 01 00 00    	cmp    $0x100,%rax
  71:	74 36                	je     a9 <init_decode_table+0x69>
    if (ch >= 'A' && ch <= 'Z') code = ch - 0x41;
  73:	80 f9 19             	cmp    $0x19,%cl
  76:	76 32                	jbe    aa <init_decode_table+0x6a>
    if (ch >= 'a' && ch <= 'z') code = ch - 0x47;
  78:	8d 50 9f             	lea    -0x61(%rax),%edx
  7b:	80 fa 19             	cmp    $0x19,%dl
  7e:	76 33                	jbe    b3 <init_decode_table+0x73>
    char code = -1;
  80:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    if (ch >= '0' && ch <= '9') code = ch + 0x04; 
  85:	8d 70 d0             	lea    -0x30(%rax),%esi
  88:	40 80 fe 09          	cmp    $0x9,%sil
  8c:	76 20                	jbe    ae <init_decode_table+0x6e>
    if (ch == '+' || ch == '-') code = 0x3E;
  8e:	8d 70 d5             	lea    -0x2b(%rax),%esi
  91:	81 e6 fd 00 00 00    	and    $0xfd,%esi
  97:	0f 44 d7             	cmove  %edi,%edx
    if (ch == '/' || ch == '_') code = 0x3F;
  9a:	3c 2f                	cmp    $0x2f,%al
  9c:	74 04                	je     a2 <init_decode_table+0x62>
  9e:	3c 5f                	cmp    $0x5f,%al
  a0:	75 be                	jne    60 <init_decode_table+0x20>
  a2:	ba 3f 00 00 00       	mov    $0x3f,%edx
  a7:	eb b7                	jmp    60 <init_decode_table+0x20>
  }
}
  a9:	c3                   	ret    
    if (ch >= 'A' && ch <= 'Z') code = ch - 0x41;
  aa:	89 ca                	mov    %ecx,%edx
    if (ch >= 'a' && ch <= 'z') code = ch - 0x47;
  ac:	eb d7                	jmp    85 <init_decode_table+0x45>
    if (ch >= '0' && ch <= '9') code = ch + 0x04; 
  ae:	8d 50 04             	lea    0x4(%rax),%edx
  b1:	eb db                	jmp    8e <init_decode_table+0x4e>
    if (ch >= 'a' && ch <= 'z') code = ch - 0x47;
  b3:	8d 50 b9             	lea    -0x47(%rax),%edx
    if (ch >= '0' && ch <= '9') code = ch + 0x04; 
  b6:	eb d6                	jmp    8e <init_decode_table+0x4e>
  b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  bf:	00 

00000000000000c0 <decode>:

#define next_char(x) char x = decode_table[(unsigned char)*str++]; if (x < 0) return 1;

int decode(int size, const char* str, int* out_size, char** output) {
  c0:	f3 0f 1e fa          	endbr64 
  c4:	41 55                	push   %r13
  c6:	41 89 fd             	mov    %edi,%r13d
  c9:	41 54                	push   %r12
  cb:	49 89 cc             	mov    %rcx,%r12
  ce:	55                   	push   %rbp
  cf:	48 89 d5             	mov    %rdx,%rbp
  d2:	53                   	push   %rbx
  d3:	48 89 f3             	mov    %rsi,%rbx
  d6:	48 83 ec 08          	sub    $0x8,%rsp

extern __inline void
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_clui (void)
{
  __builtin_ia32_clui ();
  da:	f3 0f 01 ee          	clui   
  return (int)(size * 3 / 4.0) + 6;
  de:	66 0f ef c0          	pxor   %xmm0,%xmm0
  e2:	8d 04 7f             	lea    (%rdi,%rdi,2),%eax
  e5:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
  e9:	f2 0f 59 05 00 00 00 	mulsd  0x0(%rip),%xmm0        # f1 <decode+0x31>
  f0:	00 
  f1:	f2 0f 2c f8          	cvttsd2si %xmm0,%edi
  f5:	83 c7 06             	add    $0x6,%edi
  _clui();
  *output = (char*) malloc( decode_size(size) );
  f8:	48 63 ff             	movslq %edi,%rdi
  fb:	e8 00 00 00 00       	call   100 <decode+0x40>
 100:	48 89 c6             	mov    %rax,%rsi
 103:	49 89 04 24          	mov    %rax,(%r12)

extern __inline void
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_stui (void)
{
  __builtin_ia32_stui ();
 107:	f3 0f 01 ef          	stui   
  _stui();

  char *out = *output;
  while (size > 0 && (str[size - 1] == '\n' || str[size - 1] == '\r' || str[size - 1] == '=')) size--;
 10b:	48 b9 ff db ff ff ff 	movabs $0xdfffffffffffdbff,%rcx
 112:	ff ff df 
 115:	49 63 c5             	movslq %r13d,%rax
 118:	45 85 ed             	test   %r13d,%r13d
 11b:	7e 11                	jle    12e <decode+0x6e>
 11d:	0f 1f 00             	nopl   (%rax)
 120:	0f b6 54 03 ff       	movzbl -0x1(%rbx,%rax,1),%edx
 125:	80 fa 3d             	cmp    $0x3d,%dl
 128:	0f 86 f2 00 00 00    	jbe    220 <decode+0x160>
  const char* ends = str + size - 4;
 12e:	4c 8d 44 03 fc       	lea    -0x4(%rbx,%rax,1),%r8
  while (1) {
    if (str > ends) break;
 133:	4c 39 c3             	cmp    %r8,%rbx
 136:	0f 87 aa 00 00 00    	ja     1e6 <decode+0x126>
    while (*str == '\n' || *str == '\r') str++;

    if (str > ends) break;
    next_char(a); next_char(b); next_char(c); next_char(d);
 13c:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 143 <decode+0x83>
 143:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    while (*str == '\n' || *str == '\r') str++;
 148:	0f b6 03             	movzbl (%rbx),%eax
 14b:	3c 0d                	cmp    $0xd,%al
 14d:	74 09                	je     158 <decode+0x98>
 14f:	3c 0a                	cmp    $0xa,%al
 151:	75 15                	jne    168 <decode+0xa8>
 153:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 158:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
 15c:	48 83 c3 01          	add    $0x1,%rbx
 160:	3c 0a                	cmp    $0xa,%al
 162:	74 f4                	je     158 <decode+0x98>
 164:	3c 0d                	cmp    $0xd,%al
 166:	74 f0                	je     158 <decode+0x98>
    if (str > ends) break;
 168:	49 39 d8             	cmp    %rbx,%r8
 16b:	72 79                	jb     1e6 <decode+0x126>
    next_char(a); next_char(b); next_char(c); next_char(d);
 16d:	0f b6 0c 07          	movzbl (%rdi,%rax,1),%ecx
 171:	84 c9                	test   %cl,%cl
 173:	0f 88 e4 00 00 00    	js     25d <decode+0x19d>
 179:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
 17d:	0f b6 04 07          	movzbl (%rdi,%rax,1),%eax
 181:	84 c0                	test   %al,%al
 183:	0f 88 d4 00 00 00    	js     25d <decode+0x19d>
 189:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
 18d:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
 191:	84 d2                	test   %dl,%dl
 193:	0f 88 c4 00 00 00    	js     25d <decode+0x19d>
 199:	44 0f b6 53 03       	movzbl 0x3(%rbx),%r10d
 19e:	4c 8d 4b 04          	lea    0x4(%rbx),%r9
 1a2:	46 0f b6 14 17       	movzbl (%rdi,%r10,1),%r10d
 1a7:	45 84 d2             	test   %r10b,%r10b
 1aa:	0f 88 ad 00 00 00    	js     25d <decode+0x19d>

    *out++ = (char)(a << 2 | b >> 4);
 1b0:	41 89 c3             	mov    %eax,%r11d
 1b3:	c1 e1 02             	shl    $0x2,%ecx
 1b6:	48 83 c6 03          	add    $0x3,%rsi
 1ba:	4c 89 cb             	mov    %r9,%rbx
 1bd:	41 c0 fb 04          	sar    $0x4,%r11b
    *out++ = (char)(b << 4 | c >> 2);
 1c1:	c1 e0 04             	shl    $0x4,%eax
    *out++ = (char)(a << 2 | b >> 4);
 1c4:	44 09 d9             	or     %r11d,%ecx
 1c7:	88 4e fd             	mov    %cl,-0x3(%rsi)
    *out++ = (char)(b << 4 | c >> 2);
 1ca:	89 d1                	mov    %edx,%ecx
    *out++ = (char)(c << 6 | d >> 0);
 1cc:	c1 e2 06             	shl    $0x6,%edx
    *out++ = (char)(b << 4 | c >> 2);
 1cf:	c0 f9 02             	sar    $0x2,%cl
    *out++ = (char)(c << 6 | d >> 0);
 1d2:	44 09 d2             	or     %r10d,%edx
    *out++ = (char)(b << 4 | c >> 2);
 1d5:	09 c8                	or     %ecx,%eax
 1d7:	88 46 fe             	mov    %al,-0x2(%rsi)
    *out++ = (char)(c << 6 | d >> 0);
 1da:	88 56 ff             	mov    %dl,-0x1(%rsi)
    if (str > ends) break;
 1dd:	4d 39 c8             	cmp    %r9,%r8
 1e0:	0f 83 62 ff ff ff    	jae    148 <decode+0x88>
  }

  int mod = (str - ends) % 4;
 1e6:	48 89 d8             	mov    %rbx,%rax
 1e9:	4c 29 c0             	sub    %r8,%rax
 1ec:	48 99                	cqto   
 1ee:	48 c1 ea 3e          	shr    $0x3e,%rdx
 1f2:	48 01 d0             	add    %rdx,%rax
 1f5:	83 e0 03             	and    $0x3,%eax
 1f8:	48 29 d0             	sub    %rdx,%rax
  if (mod == 2) {
 1fb:	48 83 f8 02          	cmp    $0x2,%rax
 1ff:	74 6c                	je     26d <decode+0x1ad>
    next_char(a); next_char(b);
    *out++ = (char)(a << 2 | b >> 4);
  } else if (mod == 3) {
 201:	48 83 f8 03          	cmp    $0x3,%rax
 205:	74 38                	je     23f <decode+0x17f>
    next_char(a); next_char(b); next_char(c);
    *out++ = (char)(a << 2 | b >> 4);
    *out++ = (char)(b << 4 | c >> 2);
  }

  *out = '\0';
 207:	c6 06 00             	movb   $0x0,(%rsi)
  *out_size = out - *output;
 20a:	49 2b 34 24          	sub    (%r12),%rsi
  return 0;
 20e:	31 c0                	xor    %eax,%eax
  *out_size = out - *output;
 210:	89 75 00             	mov    %esi,0x0(%rbp)
}
 213:	48 83 c4 08          	add    $0x8,%rsp
 217:	5b                   	pop    %rbx
 218:	5d                   	pop    %rbp
 219:	41 5c                	pop    %r12
 21b:	41 5d                	pop    %r13
 21d:	c3                   	ret    
 21e:	66 90                	xchg   %ax,%ax
  while (size > 0 && (str[size - 1] == '\n' || str[size - 1] == '\r' || str[size - 1] == '=')) size--;
 220:	48 0f a3 d1          	bt     %rdx,%rcx
 224:	0f 82 04 ff ff ff    	jb     12e <decode+0x6e>
 22a:	8d 50 ff             	lea    -0x1(%rax),%edx
 22d:	48 83 e8 01          	sub    $0x1,%rax
 231:	0f 85 e9 fe ff ff    	jne    120 <decode+0x60>
  const char* ends = str + size - 4;
 237:	48 63 c2             	movslq %edx,%rax
 23a:	e9 ef fe ff ff       	jmp    12e <decode+0x6e>
    next_char(a); next_char(b); next_char(c);
 23f:	0f b6 03             	movzbl (%rbx),%eax
 242:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 249 <decode+0x189>
 249:	0f b6 14 01          	movzbl (%rcx,%rax,1),%edx
 24d:	84 d2                	test   %dl,%dl
 24f:	78 0c                	js     25d <decode+0x19d>
 251:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
 255:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
 259:	84 c0                	test   %al,%al
 25b:	79 42                	jns    29f <decode+0x1df>
}
 25d:	48 83 c4 08          	add    $0x8,%rsp
    next_char(a); next_char(b); next_char(c); next_char(d);
 261:	b8 01 00 00 00       	mov    $0x1,%eax
}
 266:	5b                   	pop    %rbx
 267:	5d                   	pop    %rbp
 268:	41 5c                	pop    %r12
 26a:	41 5d                	pop    %r13
 26c:	c3                   	ret    
    next_char(a); next_char(b);
 26d:	0f b6 03             	movzbl (%rbx),%eax
 270:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 277 <decode+0x1b7>
 277:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
 27b:	84 c0                	test   %al,%al
 27d:	78 de                	js     25d <decode+0x19d>
 27f:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
 283:	0f b6 14 0a          	movzbl (%rdx,%rcx,1),%edx
 287:	84 d2                	test   %dl,%dl
 289:	78 d2                	js     25d <decode+0x19d>
    *out++ = (char)(a << 2 | b >> 4);
 28b:	c1 e0 02             	shl    $0x2,%eax
 28e:	c0 fa 04             	sar    $0x4,%dl
 291:	48 83 c6 01          	add    $0x1,%rsi
 295:	09 d0                	or     %edx,%eax
 297:	88 46 ff             	mov    %al,-0x1(%rsi)
 29a:	e9 68 ff ff ff       	jmp    207 <decode+0x147>
    next_char(a); next_char(b); next_char(c);
 29f:	0f b6 7b 02          	movzbl 0x2(%rbx),%edi
 2a3:	0f b6 0c 39          	movzbl (%rcx,%rdi,1),%ecx
 2a7:	84 c9                	test   %cl,%cl
 2a9:	78 b2                	js     25d <decode+0x19d>
    *out++ = (char)(a << 2 | b >> 4);
 2ab:	c1 e2 02             	shl    $0x2,%edx
 2ae:	89 c7                	mov    %eax,%edi
    *out++ = (char)(b << 4 | c >> 2);
 2b0:	c0 f9 02             	sar    $0x2,%cl
 2b3:	48 83 c6 02          	add    $0x2,%rsi
    *out++ = (char)(a << 2 | b >> 4);
 2b7:	40 c0 ff 04          	sar    $0x4,%dil
    *out++ = (char)(b << 4 | c >> 2);
 2bb:	c1 e0 04             	shl    $0x4,%eax
    *out++ = (char)(a << 2 | b >> 4);
 2be:	09 fa                	or     %edi,%edx
    *out++ = (char)(b << 4 | c >> 2);
 2c0:	09 c8                	or     %ecx,%eax
    *out++ = (char)(a << 2 | b >> 4);
 2c2:	88 56 fe             	mov    %dl,-0x2(%rsi)
    *out++ = (char)(b << 4 | c >> 2);
 2c5:	88 46 ff             	mov    %al,-0x1(%rsi)
 2c8:	e9 3a ff ff ff       	jmp    207 <decode+0x147>
 2cd:	0f 1f 00             	nopl   (%rax)

00000000000002d0 <encode>:

void encode(int size, const char* str, int* out_size, char** output) {
 2d0:	f3 0f 1e fa          	endbr64 
 2d4:	41 55                	push   %r13
 2d6:	41 89 fd             	mov    %edi,%r13d
 2d9:	41 54                	push   %r12
 2db:	49 89 cc             	mov    %rcx,%r12
 2de:	55                   	push   %rbp
 2df:	48 89 d5             	mov    %rdx,%rbp
 2e2:	53                   	push   %rbx
 2e3:	48 89 f3             	mov    %rsi,%rbx
 2e6:	48 83 ec 08          	sub    $0x8,%rsp
  __builtin_ia32_clui ();
 2ea:	f3 0f 01 ee          	clui   
  return (int)(size * 4 / 3.0) + 6;
 2ee:	66 0f ef c0          	pxor   %xmm0,%xmm0
 2f2:	8d 04 bd 00 00 00 00 	lea    0x0(,%rdi,4),%eax
 2f9:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
 2fd:	f2 0f 5e 05 00 00 00 	divsd  0x0(%rip),%xmm0        # 305 <encode+0x35>
 304:	00 
 305:	f2 0f 2c f8          	cvttsd2si %xmm0,%edi
 309:	83 c7 06             	add    $0x6,%edi
  _clui();
  *output = (char*) malloc( encode_size(size) );
 30c:	48 63 ff             	movslq %edi,%rdi
 30f:	e8 00 00 00 00       	call   314 <encode+0x44>
 314:	49 89 04 24          	mov    %rax,(%r12)
  __builtin_ia32_stui ();
 318:	f3 0f 01 ef          	stui   
  _stui();

  char *out = *output;
  const char* ends = str + (size - size % 3);
 31c:	49 63 fd             	movslq %r13d,%rdi
 31f:	44 89 ea             	mov    %r13d,%edx
 322:	48 69 ff 56 55 55 55 	imul   $0x55555556,%rdi,%rdi
 329:	c1 fa 1f             	sar    $0x1f,%edx
 32c:	48 c1 ef 20          	shr    $0x20,%rdi
 330:	29 d7                	sub    %edx,%edi
 332:	44 8d 0c 7f          	lea    (%rdi,%rdi,2),%r9d
 336:	44 89 ef             	mov    %r13d,%edi
 339:	44 29 cf             	sub    %r9d,%edi
 33c:	4d 63 c9             	movslq %r9d,%r9
 33f:	4e 8d 04 0b          	lea    (%rbx,%r9,1),%r8
  uint n;
  while (str != ends) {
 343:	4c 39 c3             	cmp    %r8,%rbx
 346:	74 73                	je     3bb <encode+0xeb>
 348:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 34f <encode+0x7f>
 34f:	49 89 c2             	mov    %rax,%r10
  char *out = *output;
 352:	48 89 c1             	mov    %rax,%rcx
 355:	0f 1f 00             	nopl   (%rax)
    uint32_t n = __builtin_bswap32(*(uint32_t*)str);
 358:	8b 03                	mov    (%rbx),%eax
 35a:	48 83 c1 04          	add    $0x4,%rcx
    *out++ = chars[(n >> 26) & 63];
    *out++ = chars[(n >> 20) & 63];
    *out++ = chars[(n >> 14) & 63];
    *out++ = chars[(n >> 8) & 63];
    str += 3;
 35e:	48 83 c3 03          	add    $0x3,%rbx
    uint32_t n = __builtin_bswap32(*(uint32_t*)str);
 362:	0f c8                	bswap  %eax
    *out++ = chars[(n >> 26) & 63];
 364:	89 c6                	mov    %eax,%esi
 366:	c1 ee 1a             	shr    $0x1a,%esi
 369:	0f b6 14 32          	movzbl (%rdx,%rsi,1),%edx
    *out++ = chars[(n >> 20) & 63];
 36d:	89 c6                	mov    %eax,%esi
 36f:	c1 ee 14             	shr    $0x14,%esi
    *out++ = chars[(n >> 26) & 63];
 372:	88 51 fc             	mov    %dl,-0x4(%rcx)
    *out++ = chars[(n >> 20) & 63];
 375:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 37c <encode+0xac>
 37c:	83 e6 3f             	and    $0x3f,%esi
 37f:	0f b6 34 32          	movzbl (%rdx,%rsi,1),%esi
 383:	40 88 71 fd          	mov    %sil,-0x3(%rcx)
    *out++ = chars[(n >> 14) & 63];
 387:	89 c6                	mov    %eax,%esi
    *out++ = chars[(n >> 8) & 63];
 389:	c1 e8 08             	shr    $0x8,%eax
    *out++ = chars[(n >> 14) & 63];
 38c:	c1 ee 0e             	shr    $0xe,%esi
    *out++ = chars[(n >> 8) & 63];
 38f:	83 e0 3f             	and    $0x3f,%eax
    *out++ = chars[(n >> 14) & 63];
 392:	83 e6 3f             	and    $0x3f,%esi
 395:	0f b6 34 32          	movzbl (%rdx,%rsi,1),%esi
 399:	40 88 71 fe          	mov    %sil,-0x2(%rcx)
    *out++ = chars[(n >> 8) & 63];
 39d:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
 3a1:	88 41 ff             	mov    %al,-0x1(%rcx)
  while (str != ends) {
 3a4:	49 39 d8             	cmp    %rbx,%r8
 3a7:	75 af                	jne    358 <encode+0x88>
    *out++ = chars[(n >> 8) & 63];
 3a9:	48 b8 ac aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaac,%rax
 3b0:	aa aa aa 
 3b3:	4c 0f af c8          	imul   %rax,%r9
 3b7:	4b 8d 04 0a          	lea    (%r10,%r9,1),%rax
  }
  int pd = size % 3;
  if  (pd == 1) {
 3bb:	83 ff 01             	cmp    $0x1,%edi
 3be:	0f 84 7c 00 00 00    	je     440 <encode+0x170>
    n = (uint)*str << 16;
    *out++ = chars[(n >> 18) & 63];
    *out++ = chars[(n >> 12) & 63];
    *out++ = '=';
    *out++ = '=';
  } else if (pd == 2) {
 3c4:	83 ff 02             	cmp    $0x2,%edi
 3c7:	74 17                	je     3e0 <encode+0x110>
    *out++ = chars[(n >> 18) & 63];
    *out++ = chars[(n >> 12) & 63];
    *out++ = chars[(n >> 6) & 63];
    *out++ = '=';
  }
  *out = '\0';
 3c9:	c6 00 00             	movb   $0x0,(%rax)
  *out_size = out - *output;
 3cc:	49 2b 04 24          	sub    (%r12),%rax
 3d0:	89 45 00             	mov    %eax,0x0(%rbp)
}
 3d3:	48 83 c4 08          	add    $0x8,%rsp
 3d7:	5b                   	pop    %rbx
 3d8:	5d                   	pop    %rbp
 3d9:	41 5c                	pop    %r12
 3db:	41 5d                	pop    %r13
 3dd:	c3                   	ret    
 3de:	66 90                	xchg   %ax,%ax
    n = (uint)*str++ << 16;
 3e0:	41 0f be 08          	movsbl (%r8),%ecx
    n |= (uint)*str << 8;
 3e4:	41 0f be 50 01       	movsbl 0x1(%r8),%edx
    *out++ = '=';
 3e9:	48 83 c0 04          	add    $0x4,%rax
    *out++ = chars[(n >> 18) & 63];
 3ed:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 3f4 <encode+0x124>
    n = (uint)*str++ << 16;
 3f4:	c1 e1 10             	shl    $0x10,%ecx
    n |= (uint)*str << 8;
 3f7:	c1 e2 08             	shl    $0x8,%edx
 3fa:	09 ca                	or     %ecx,%edx
    *out++ = chars[(n >> 18) & 63];
 3fc:	89 d1                	mov    %edx,%ecx
 3fe:	c1 e9 12             	shr    $0x12,%ecx
 401:	83 e1 3f             	and    $0x3f,%ecx
 404:	0f b6 0c 0e          	movzbl (%rsi,%rcx,1),%ecx
 408:	88 48 fc             	mov    %cl,-0x4(%rax)
    *out++ = chars[(n >> 12) & 63];
 40b:	89 d1                	mov    %edx,%ecx
 40d:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 414 <encode+0x144>
    *out++ = chars[(n >> 6) & 63];
 414:	c1 ea 06             	shr    $0x6,%edx
    *out++ = chars[(n >> 12) & 63];
 417:	c1 e9 0c             	shr    $0xc,%ecx
    *out++ = chars[(n >> 6) & 63];
 41a:	83 e2 3c             	and    $0x3c,%edx
    *out++ = chars[(n >> 12) & 63];
 41d:	83 e1 3f             	and    $0x3f,%ecx
 420:	0f b6 0c 0e          	movzbl (%rsi,%rcx,1),%ecx
 424:	88 48 fd             	mov    %cl,-0x3(%rax)
    *out++ = chars[(n >> 6) & 63];
 427:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 42e <encode+0x15e>
 42e:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
    *out++ = '=';
 432:	c6 40 ff 3d          	movb   $0x3d,-0x1(%rax)
    *out++ = chars[(n >> 6) & 63];
 436:	88 50 fe             	mov    %dl,-0x2(%rax)
    *out++ = '=';
 439:	eb 8e                	jmp    3c9 <encode+0xf9>
 43b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    n = (uint)*str << 16;
 440:	41 0f be 10          	movsbl (%r8),%edx
    *out++ = chars[(n >> 18) & 63];
 444:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 44b <encode+0x17b>
    *out++ = '=';
 44b:	48 83 c0 04          	add    $0x4,%rax
    n = (uint)*str << 16;
 44f:	c1 e2 10             	shl    $0x10,%edx
    *out++ = chars[(n >> 18) & 63];
 452:	89 d1                	mov    %edx,%ecx
    *out++ = chars[(n >> 12) & 63];
 454:	c1 ea 0c             	shr    $0xc,%edx
    *out++ = chars[(n >> 18) & 63];
 457:	c1 e9 12             	shr    $0x12,%ecx
    *out++ = chars[(n >> 12) & 63];
 45a:	83 e2 30             	and    $0x30,%edx
    *out++ = chars[(n >> 18) & 63];
 45d:	83 e1 3f             	and    $0x3f,%ecx
 460:	0f b6 0c 0e          	movzbl (%rsi,%rcx,1),%ecx
 464:	88 48 fc             	mov    %cl,-0x4(%rax)
    *out++ = chars[(n >> 12) & 63];
 467:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 46e <encode+0x19e>
 46e:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
 472:	88 50 fd             	mov    %dl,-0x3(%rax)
    *out++ = '=';
 475:	ba 3d 3d 00 00       	mov    $0x3d3d,%edx
 47a:	66 89 50 fe          	mov    %dx,-0x2(%rax)
 47e:	e9 46 ff ff ff       	jmp    3c9 <encode+0xf9>
 483:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
 48a:	00 00 00 00 
 48e:	66 90                	xchg   %ax,%ax

0000000000000490 <base64_init>:

void base64_init() {
 490:	f3 0f 1e fa          	endbr64 
  init_decode_table();
 494:	31 c0                	xor    %eax,%eax
 496:	e9 a5 fb ff ff       	jmp    40 <init_decode_table>
 49b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000004a0 <base64>:
  return;
}

long long base64() {
 4a0:	f3 0f 1e fa          	endbr64 
 4a4:	41 57                	push   %r15
 4a6:	41 56                	push   %r14
 4a8:	41 55                	push   %r13
 4aa:	41 54                	push   %r12
 4ac:	55                   	push   %rbp
 4ad:	53                   	push   %rbx
 4ae:	48 83 ec 38          	sub    $0x38,%rsp
 4b2:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 4b9:	00 00 
 4bb:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
 4c0:	31 c0                	xor    %eax,%eax
    case 4: TRIES = 50; break;
    case 5: TRIES = 100; break;
    default: printf("error: %d\\n", arg); return -1;
  }

  init_decode_table();
 4c2:	e8 00 00 00 00       	call   4c7 <base64+0x27>
  __builtin_ia32_clui ();
 4c7:	f3 0f 01 ee          	clui   

  const int STR_SIZE = 10000000;
  
  _clui();
  char *str = (char*) malloc(STR_SIZE + 1);
 4cb:	bf 81 96 98 00       	mov    $0x989681,%edi
 4d0:	e8 00 00 00 00       	call   4d5 <base64+0x35>
 4d5:	49 89 c5             	mov    %rax,%r13
  __builtin_ia32_stui ();
 4d8:	f3 0f 01 ef          	stui   
  _stui();

  for (int i = 0; i < STR_SIZE; i++) { str[i] = 'a'; }
 4dc:	ba 80 96 98 00       	mov    $0x989680,%edx
 4e1:	be 61 00 00 00       	mov    $0x61,%esi
  str[STR_SIZE] = '\0';
  
  long long res = 0;

  int s = 0;
 4e6:	31 ed                	xor    %ebp,%ebp
  clock_t t = clock();
 4e8:	bb 64 00 00 00       	mov    $0x64,%ebx
  for (int i = 0; i < STR_SIZE; i++) { str[i] = 'a'; }
 4ed:	48 89 c7             	mov    %rax,%rdi
 4f0:	4c 8d 64 24 20       	lea    0x20(%rsp),%r12
 4f5:	4c 8d 74 24 18       	lea    0x18(%rsp),%r14
 4fa:	e8 00 00 00 00       	call   4ff <base64+0x5f>
  str[STR_SIZE] = '\0';
 4ff:	41 c6 85 80 96 98 00 	movb   $0x0,0x989680(%r13)
 506:	00 
  clock_t t = clock();
 507:	e8 00 00 00 00       	call   50c <base64+0x6c>
  for (int i = 0; i < TRIES; i++) { 
 50c:	0f 1f 40 00          	nopl   0x0(%rax)
    char *str2; 
    int str2_size;
    encode(STR_SIZE, str, &str2_size, &str2); 
 510:	4c 89 e1             	mov    %r12,%rcx
 513:	4c 89 f2             	mov    %r14,%rdx
 516:	4c 89 ee             	mov    %r13,%rsi
 519:	bf 80 96 98 00       	mov    $0x989680,%edi
 51e:	e8 00 00 00 00       	call   523 <base64+0x83>
    s += str2_size;
 523:	03 6c 24 18          	add    0x18(%rsp),%ebp
  __builtin_ia32_clui ();
 527:	f3 0f 01 ee          	clui   
    _clui();
	free(str2);
 52b:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
 530:	e8 00 00 00 00       	call   535 <base64+0x95>
  __builtin_ia32_stui ();
 535:	f3 0f 01 ef          	stui   
  for (int i = 0; i < TRIES; i++) { 
 539:	83 eb 01             	sub    $0x1,%ebx
 53c:	75 d2                	jne    510 <base64+0x70>
	_stui(); 
  }
  // printf("encode: %d, %.2f\n", s, (float)(clock() - t)/CLOCKS_PER_SEC);
  res += s;
 53e:	48 63 c5             	movslq %ebp,%rax

  char *str2;
  int str2_size;
  encode(STR_SIZE, str, &str2_size, &str2);
 541:	4c 89 f1             	mov    %r14,%rcx
 544:	4c 89 ee             	mov    %r13,%rsi
 547:	bf 80 96 98 00       	mov    $0x989680,%edi
 54c:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
  res += s;
 551:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  s = 0;
  t = clock();
  for (int i = 0; i < TRIES; i++) {
    char *str3;
    int str3_size;
    if (decode(str2_size, str2, &str3_size, &str3) != 0) {
 556:	bb 64 00 00 00       	mov    $0x64,%ebx
  s = 0;
 55b:	31 ed                	xor    %ebp,%ebp
  encode(STR_SIZE, str, &str2_size, &str2);
 55d:	e8 00 00 00 00       	call   562 <base64+0xc2>
  t = clock();
 562:	4c 8d 6c 24 14       	lea    0x14(%rsp),%r13
 567:	e8 00 00 00 00       	call   56c <base64+0xcc>
    if (decode(str2_size, str2, &str3_size, &str3) != 0) {
 56c:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
 571:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
 576:	eb 23                	jmp    59b <base64+0xfb>
 578:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 57f:	00 
      printf("error when decoding");
    }
    s += str3_size;
 580:	03 6c 24 14          	add    0x14(%rsp),%ebp
  __builtin_ia32_clui ();
 584:	f3 0f 01 ee          	clui   
	_clui();
    free(str3);
 588:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
 58d:	e8 00 00 00 00       	call   592 <base64+0xf2>
  __builtin_ia32_stui ();
 592:	f3 0f 01 ef          	stui   
  for (int i = 0; i < TRIES; i++) {
 596:	83 eb 01             	sub    $0x1,%ebx
 599:	74 2a                	je     5c5 <base64+0x125>
    if (decode(str2_size, str2, &str3_size, &str3) != 0) {
 59b:	4c 89 e1             	mov    %r12,%rcx
 59e:	4c 89 ea             	mov    %r13,%rdx
 5a1:	4c 89 fe             	mov    %r15,%rsi
 5a4:	44 89 f7             	mov    %r14d,%edi
 5a7:	e8 00 00 00 00       	call   5ac <base64+0x10c>
 5ac:	85 c0                	test   %eax,%eax
 5ae:	74 d0                	je     580 <base64+0xe0>
}

__fortify_function int
printf (const char *__restrict __fmt, ...)
{
  return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
 5b0:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 5b7 <base64+0x117>
 5b7:	bf 01 00 00 00       	mov    $0x1,%edi
 5bc:	31 c0                	xor    %eax,%eax
 5be:	e8 00 00 00 00       	call   5c3 <base64+0x123>
 5c3:	eb bb                	jmp    580 <base64+0xe0>
	_stui();
  }
  res += s;
 5c5:	48 63 c5             	movslq %ebp,%rax
 5c8:	48 03 44 24 08       	add    0x8(%rsp),%rax
  // printf("decode: %d, %.2f\n", s, (float)(clock() - t)/CLOCKS_PER_SEC);
  return res;
}
 5cd:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
 5d2:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
 5d9:	00 00 
 5db:	75 0f                	jne    5ec <base64+0x14c>
 5dd:	48 83 c4 38          	add    $0x38,%rsp
 5e1:	5b                   	pop    %rbx
 5e2:	5d                   	pop    %rbp
 5e3:	41 5c                	pop    %r12
 5e5:	41 5d                	pop    %r13
 5e7:	41 5e                	pop    %r14
 5e9:	41 5f                	pop    %r15
 5eb:	c3                   	ret    
 5ec:	e8 00 00 00 00       	call   5f1 <base64+0x151>
