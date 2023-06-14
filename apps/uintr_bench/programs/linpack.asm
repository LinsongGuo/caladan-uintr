
linpack.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <daxpy.part.0>:

  return value;
}
/******************************************************************************/

void daxpy ( int n, double da, double dx[], int incx, double dy[], int incy )
       0:	49 89 f2             	mov    %rsi,%r10
       3:	48 63 f2             	movslq %edx,%rsi
       6:	49 89 c9             	mov    %rcx,%r9
  }
/*
  Code for unequal increments or equal increments
  not equal to 1.
*/
  if ( incx != 1 || incy != 1 )
       9:	83 fe 01             	cmp    $0x1,%esi
       c:	0f 85 be 00 00 00    	jne    d0 <daxpy.part.0+0xd0>
      12:	41 83 f8 01          	cmp    $0x1,%r8d
      16:	0f 85 b4 00 00 00    	jne    d0 <daxpy.part.0+0xd0>
*/
  else
  {
    m = n % 4;

    for ( i = 0; i < m; i++ )
      1c:	89 fe                	mov    %edi,%esi
      1e:	83 e6 03             	and    $0x3,%esi
      21:	74 20                	je     43 <daxpy.part.0+0x43>
      23:	31 c0                	xor    %eax,%eax
    {
      dy[i] = dy[i] + da * dx[i];
      25:	f2 41 0f 10 0c c2    	movsd  (%r10,%rax,8),%xmm1
      2b:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
      2f:	f2 41 0f 58 0c c1    	addsd  (%r9,%rax,8),%xmm1
      35:	f2 41 0f 11 0c c1    	movsd  %xmm1,(%r9,%rax,8)
    for ( i = 0; i < m; i++ )
      3b:	48 83 c0 01          	add    $0x1,%rax
      3f:	39 c6                	cmp    %eax,%esi
      41:	7f e2                	jg     25 <daxpy.part.0+0x25>
    }

    for ( i = m; i < n; i = i + 4 )
      43:	39 f7                	cmp    %esi,%edi
      45:	0f 8e 7d 00 00 00    	jle    c8 <daxpy.part.0+0xc8>
      4b:	8d 4f ff             	lea    -0x1(%rdi),%ecx
      4e:	4c 63 c6             	movslq %esi,%r8
      51:	48 29 f1             	sub    %rsi,%rcx
      54:	4a 8d 14 c5 00 00 00 	lea    0x0(,%r8,8),%rdx
      5b:	00 
      5c:	83 e1 fc             	and    $0xfffffffc,%ecx
      5f:	49 8d 04 11          	lea    (%r9,%rdx,1),%rax
      63:	4c 01 d2             	add    %r10,%rdx
      66:	4c 01 c1             	add    %r8,%rcx
      69:	49 8d 4c c9 20       	lea    0x20(%r9,%rcx,8),%rcx
      6e:	66 90                	xchg   %ax,%ax
    {
      dy[i  ] = dy[i  ] + da * dx[i  ];
      70:	f2 0f 10 0a          	movsd  (%rdx),%xmm1
    for ( i = m; i < n; i = i + 4 )
      74:	48 83 c0 20          	add    $0x20,%rax
      78:	48 83 c2 20          	add    $0x20,%rdx
      dy[i  ] = dy[i  ] + da * dx[i  ];
      7c:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
      80:	f2 0f 58 48 e0       	addsd  -0x20(%rax),%xmm1
      85:	f2 0f 11 48 e0       	movsd  %xmm1,-0x20(%rax)
      dy[i+1] = dy[i+1] + da * dx[i+1];
      8a:	f2 0f 10 4a e8       	movsd  -0x18(%rdx),%xmm1
      8f:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
      93:	f2 0f 58 48 e8       	addsd  -0x18(%rax),%xmm1
      98:	f2 0f 11 48 e8       	movsd  %xmm1,-0x18(%rax)
      dy[i+2] = dy[i+2] + da * dx[i+2];
      9d:	f2 0f 10 4a f0       	movsd  -0x10(%rdx),%xmm1
      a2:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
      a6:	f2 0f 58 48 f0       	addsd  -0x10(%rax),%xmm1
      ab:	f2 0f 11 48 f0       	movsd  %xmm1,-0x10(%rax)
      dy[i+3] = dy[i+3] + da * dx[i+3];
      b0:	f2 0f 10 4a f8       	movsd  -0x8(%rdx),%xmm1
      b5:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
      b9:	f2 0f 58 48 f8       	addsd  -0x8(%rax),%xmm1
      be:	f2 0f 11 48 f8       	movsd  %xmm1,-0x8(%rax)
    for ( i = m; i < n; i = i + 4 )
      c3:	48 39 c1             	cmp    %rax,%rcx
      c6:	75 a8                	jne    70 <daxpy.part.0+0x70>
    }
  }
  return;
}
      c8:	c3                   	ret    
      c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
      ix = 0;
      d0:	31 d2                	xor    %edx,%edx
    if ( 0 <= incx )
      d2:	85 f6                	test   %esi,%esi
      d4:	78 62                	js     138 <daxpy.part.0+0x138>
      iy = 0;
      d6:	31 c0                	xor    %eax,%eax
    if ( 0 <= incy )
      d8:	45 85 c0             	test   %r8d,%r8d
      db:	78 43                	js     120 <daxpy.part.0+0x120>
    for ( i = 0; i < n; i++ )
      dd:	85 ff                	test   %edi,%edi
      df:	7e e7                	jle    c8 <daxpy.part.0+0xc8>
      e1:	48 63 d2             	movslq %edx,%rdx
      e4:	4d 63 c0             	movslq %r8d,%r8
      e7:	48 98                	cltq   
      e9:	48 c1 e6 03          	shl    $0x3,%rsi
      ed:	49 8d 0c d2          	lea    (%r10,%rdx,8),%rcx
      f1:	49 c1 e0 03          	shl    $0x3,%r8
      f5:	49 8d 04 c1          	lea    (%r9,%rax,8),%rax
      f9:	31 d2                	xor    %edx,%edx
      fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
      dy[iy] = dy[iy] + da * dx[ix];
     100:	f2 0f 10 09          	movsd  (%rcx),%xmm1
    for ( i = 0; i < n; i++ )
     104:	83 c2 01             	add    $0x1,%edx
     107:	48 01 f1             	add    %rsi,%rcx
      dy[iy] = dy[iy] + da * dx[ix];
     10a:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
     10e:	f2 0f 58 08          	addsd  (%rax),%xmm1
     112:	f2 0f 11 08          	movsd  %xmm1,(%rax)
    for ( i = 0; i < n; i++ )
     116:	4c 01 c0             	add    %r8,%rax
     119:	39 d7                	cmp    %edx,%edi
     11b:	75 e3                	jne    100 <daxpy.part.0+0x100>
     11d:	c3                   	ret    
     11e:	66 90                	xchg   %ax,%ax
      iy = ( - n + 1 ) * incy;
     120:	b8 01 00 00 00       	mov    $0x1,%eax
     125:	29 f8                	sub    %edi,%eax
     127:	41 0f af c0          	imul   %r8d,%eax
    for ( i = 0; i < n; i++ )
     12b:	85 ff                	test   %edi,%edi
     12d:	7f b2                	jg     e1 <daxpy.part.0+0xe1>
     12f:	eb 97                	jmp    c8 <daxpy.part.0+0xc8>
     131:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
      ix = ( - n + 1 ) * incx;
     138:	ba 01 00 00 00       	mov    $0x1,%edx
      iy = 0;
     13d:	31 c0                	xor    %eax,%eax
      ix = ( - n + 1 ) * incx;
     13f:	29 fa                	sub    %edi,%edx
     141:	0f af d6             	imul   %esi,%edx
    if ( 0 <= incy )
     144:	45 85 c0             	test   %r8d,%r8d
     147:	79 94                	jns    dd <daxpy.part.0+0xdd>
     149:	eb d5                	jmp    120 <daxpy.part.0+0x120>
     14b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000150 <dscal.part.0>:
  }
  return;
}
/******************************************************************************/

void dscal ( int n, double sa, double x[], int incx )
     150:	48 63 d7             	movslq %edi,%rdx
     153:	48 89 d1             	mov    %rdx,%rcx
  if ( n <= 0 )
  {
  }
  else if ( incx == 1 )
  {
    m = n % 5;
     156:	48 69 d2 67 66 66 66 	imul   $0x66666667,%rdx,%rdx
     15d:	89 c8                	mov    %ecx,%eax
     15f:	c1 f8 1f             	sar    $0x1f,%eax
     162:	48 c1 fa 21          	sar    $0x21,%rdx
     166:	29 c2                	sub    %eax,%edx
     168:	8d 04 92             	lea    (%rdx,%rdx,4),%eax

    for ( i = 0; i < m; i++ )
     16b:	89 ca                	mov    %ecx,%edx
     16d:	29 c2                	sub    %eax,%edx
     16f:	74 21                	je     192 <dscal.part.0+0x42>
     171:	8d 7a ff             	lea    -0x1(%rdx),%edi
     174:	48 89 f0             	mov    %rsi,%rax
     177:	48 8d 7c fe 08       	lea    0x8(%rsi,%rdi,8),%rdi
    {
      x[i] = sa * x[i];
     17c:	f2 0f 10 08          	movsd  (%rax),%xmm1
    for ( i = 0; i < m; i++ )
     180:	48 83 c0 08          	add    $0x8,%rax
      x[i] = sa * x[i];
     184:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
     188:	f2 0f 11 48 f8       	movsd  %xmm1,-0x8(%rax)
    for ( i = 0; i < m; i++ )
     18d:	48 39 c7             	cmp    %rax,%rdi
     190:	75 ea                	jne    17c <dscal.part.0+0x2c>
    }

    for ( i = m; i < n; i = i + 5 )
     192:	39 d1                	cmp    %edx,%ecx
     194:	7e 5a                	jle    1f0 <dscal.part.0+0xa0>
     196:	48 63 c2             	movslq %edx,%rax
     199:	48 8d 04 c6          	lea    (%rsi,%rax,8),%rax
     19d:	0f 1f 00             	nopl   (%rax)
    {
      x[i]   = sa * x[i];
     1a0:	f2 0f 10 08          	movsd  (%rax),%xmm1
    for ( i = m; i < n; i = i + 5 )
     1a4:	83 c2 05             	add    $0x5,%edx
     1a7:	48 83 c0 28          	add    $0x28,%rax
      x[i]   = sa * x[i];
     1ab:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
     1af:	f2 0f 11 48 d8       	movsd  %xmm1,-0x28(%rax)
      x[i+1] = sa * x[i+1];
     1b4:	f2 0f 10 48 e0       	movsd  -0x20(%rax),%xmm1
     1b9:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
     1bd:	f2 0f 11 48 e0       	movsd  %xmm1,-0x20(%rax)
      x[i+2] = sa * x[i+2];
     1c2:	f2 0f 10 48 e8       	movsd  -0x18(%rax),%xmm1
     1c7:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
     1cb:	f2 0f 11 48 e8       	movsd  %xmm1,-0x18(%rax)
      x[i+3] = sa * x[i+3];
     1d0:	f2 0f 10 48 f0       	movsd  -0x10(%rax),%xmm1
     1d5:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
     1d9:	f2 0f 11 48 f0       	movsd  %xmm1,-0x10(%rax)
      x[i+4] = sa * x[i+4];
     1de:	f2 0f 10 48 f8       	movsd  -0x8(%rax),%xmm1
     1e3:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
     1e7:	f2 0f 11 48 f8       	movsd  %xmm1,-0x8(%rax)
    for ( i = m; i < n; i = i + 5 )
     1ec:	39 d1                	cmp    %edx,%ecx
     1ee:	7f b0                	jg     1a0 <dscal.part.0+0x50>
      x[ix] = sa * x[ix];
      ix = ix + incx;
    }
  }
  return;
}
     1f0:	c3                   	ret    
     1f1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     1f8:	00 00 00 00 
     1fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000200 <cpu_time>:
{
     200:	f3 0f 1e fa          	endbr64 
     204:	48 83 ec 08          	sub    $0x8,%rsp

extern __inline void
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_clui (void)
{
  __builtin_ia32_clui ();
     208:	f3 0f 01 ee          	clui   
  value = ( double ) clock ( ) 
     20c:	e8 00 00 00 00       	call   211 <cpu_time+0x11>

extern __inline void
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_stui (void)
{
  __builtin_ia32_stui ();
     211:	f3 0f 01 ef          	stui   
     215:	66 0f ef c0          	pxor   %xmm0,%xmm0
     219:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     21e:	f2 0f 5e 05 00 00 00 	divsd  0x0(%rip),%xmm0        # 226 <cpu_time+0x26>
     225:	00 
}
     226:	48 83 c4 08          	add    $0x8,%rsp
     22a:	c3                   	ret    
     22b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000230 <daxpy>:
{
     230:	f3 0f 1e fa          	endbr64 
  if ( da == 0.0 )
     234:	66 0f 2e 05 00 00 00 	ucomisd 0x0(%rip),%xmm0        # 23c <daxpy+0xc>
     23b:	00 
     23c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
     242:	0f 9b c0             	setnp  %al
     245:	41 0f 45 c1          	cmovne %r9d,%eax
     249:	84 c0                	test   %al,%al
     24b:	75 13                	jne    260 <daxpy+0x30>
     24d:	85 ff                	test   %edi,%edi
     24f:	7e 0f                	jle    260 <daxpy+0x30>
     251:	e9 aa fd ff ff       	jmp    0 <daxpy.part.0>
     256:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
     25d:	00 00 00 
}
     260:	c3                   	ret    
     261:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     268:	00 00 00 00 
     26c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000270 <ddot>:
{
     270:	f3 0f 1e fa          	endbr64 
  if ( n <= 0 )
     274:	85 ff                	test   %edi,%edi
     276:	0f 8e 34 01 00 00    	jle    3b0 <ddot+0x140>
  if ( incx != 1 || incy != 1 )
     27c:	83 fa 01             	cmp    $0x1,%edx
     27f:	0f 85 bb 00 00 00    	jne    340 <ddot+0xd0>
     285:	41 83 f8 01          	cmp    $0x1,%r8d
     289:	0f 85 b1 00 00 00    	jne    340 <ddot+0xd0>
    m = n % 5;
     28f:	48 63 c7             	movslq %edi,%rax
     292:	89 fa                	mov    %edi,%edx
     294:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
     29b:	c1 fa 1f             	sar    $0x1f,%edx
     29e:	48 c1 f8 21          	sar    $0x21,%rax
     2a2:	29 d0                	sub    %edx,%eax
     2a4:	8d 14 80             	lea    (%rax,%rax,4),%edx
    for ( i = 0; i < m; i++ )
     2a7:	89 f8                	mov    %edi,%eax
     2a9:	29 d0                	sub    %edx,%eax
     2ab:	0f 84 07 01 00 00    	je     3b8 <ddot+0x148>
     2b1:	31 d2                	xor    %edx,%edx
  dtemp = 0.0;
     2b3:	66 0f ef c0          	pxor   %xmm0,%xmm0
      dtemp = dtemp + dx[i] * dy[i];
     2b7:	f2 0f 10 0c d6       	movsd  (%rsi,%rdx,8),%xmm1
     2bc:	f2 0f 59 0c d1       	mulsd  (%rcx,%rdx,8),%xmm1
    for ( i = 0; i < m; i++ )
     2c1:	48 83 c2 01          	add    $0x1,%rdx
      dtemp = dtemp + dx[i] * dy[i];
     2c5:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
    for ( i = 0; i < m; i++ )
     2c9:	39 d0                	cmp    %edx,%eax
     2cb:	7f ea                	jg     2b7 <ddot+0x47>
    for ( i = m; i < n; i = i + 5 )
     2cd:	39 c7                	cmp    %eax,%edi
     2cf:	0f 8e f3 00 00 00    	jle    3c8 <ddot+0x158>
     2d5:	48 98                	cltq   
     2d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     2de:	00 00 
      dtemp = dtemp + dx[i  ] * dy[i  ] 
     2e0:	f2 0f 10 0c c6       	movsd  (%rsi,%rax,8),%xmm1
     2e5:	f2 0f 59 0c c1       	mulsd  (%rcx,%rax,8),%xmm1
     2ea:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
                    + dx[i+1] * dy[i+1] 
     2ee:	f2 0f 10 44 c6 08    	movsd  0x8(%rsi,%rax,8),%xmm0
     2f4:	f2 0f 59 44 c1 08    	mulsd  0x8(%rcx,%rax,8),%xmm0
     2fa:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
                    + dx[i+2] * dy[i+2] 
     2fe:	f2 0f 10 44 c6 10    	movsd  0x10(%rsi,%rax,8),%xmm0
     304:	f2 0f 59 44 c1 10    	mulsd  0x10(%rcx,%rax,8),%xmm0
     30a:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
                    + dx[i+3] * dy[i+3] 
     30e:	f2 0f 10 44 c6 18    	movsd  0x18(%rsi,%rax,8),%xmm0
     314:	f2 0f 59 44 c1 18    	mulsd  0x18(%rcx,%rax,8),%xmm0
     31a:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
                    + dx[i+4] * dy[i+4];
     31e:	f2 0f 10 44 c6 20    	movsd  0x20(%rsi,%rax,8),%xmm0
     324:	f2 0f 59 44 c1 20    	mulsd  0x20(%rcx,%rax,8),%xmm0
    for ( i = m; i < n; i = i + 5 )
     32a:	48 83 c0 05          	add    $0x5,%rax
      dtemp = dtemp + dx[i  ] * dy[i  ] 
     32e:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
    for ( i = m; i < n; i = i + 5 )
     332:	39 c7                	cmp    %eax,%edi
     334:	7f aa                	jg     2e0 <ddot+0x70>
     336:	c3                   	ret    
     337:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     33e:	00 00 
      ix = 0;
     340:	45 31 d2             	xor    %r10d,%r10d
    if ( 0 <= incx )
     343:	85 d2                	test   %edx,%edx
     345:	79 0d                	jns    354 <ddot+0xe4>
      ix = ( - n + 1 ) * incx;
     347:	41 ba 01 00 00 00    	mov    $0x1,%r10d
     34d:	41 29 fa             	sub    %edi,%r10d
     350:	44 0f af d2          	imul   %edx,%r10d
      iy = 0;
     354:	31 c0                	xor    %eax,%eax
    if ( 0 <= incy )
     356:	45 85 c0             	test   %r8d,%r8d
     359:	79 0b                	jns    366 <ddot+0xf6>
      iy = ( - n + 1 ) * incy;
     35b:	b8 01 00 00 00       	mov    $0x1,%eax
     360:	29 f8                	sub    %edi,%eax
     362:	41 0f af c0          	imul   %r8d,%eax
     366:	48 63 d2             	movslq %edx,%rdx
     369:	48 98                	cltq   
     36b:	4d 63 d2             	movslq %r10d,%r10
     36e:	4d 63 c0             	movslq %r8d,%r8
     371:	4c 8d 0c d5 00 00 00 	lea    0x0(,%rdx,8),%r9
     378:	00 
     379:	4a 8d 34 d6          	lea    (%rsi,%r10,8),%rsi
      iy = 0;
     37d:	66 0f ef c0          	pxor   %xmm0,%xmm0
     381:	49 c1 e0 03          	shl    $0x3,%r8
     385:	48 8d 14 c1          	lea    (%rcx,%rax,8),%rdx
     389:	31 c0                	xor    %eax,%eax
     38b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
      dtemp = dtemp + dx[ix] * dy[iy];
     390:	f2 0f 10 0e          	movsd  (%rsi),%xmm1
     394:	f2 0f 59 0a          	mulsd  (%rdx),%xmm1
    for ( i = 0; i < n; i++ )
     398:	83 c0 01             	add    $0x1,%eax
     39b:	4c 01 ce             	add    %r9,%rsi
     39e:	4c 01 c2             	add    %r8,%rdx
      dtemp = dtemp + dx[ix] * dy[iy];
     3a1:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
    for ( i = 0; i < n; i++ )
     3a5:	39 c7                	cmp    %eax,%edi
     3a7:	75 e7                	jne    390 <ddot+0x120>
     3a9:	c3                   	ret    
     3aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    return dtemp;
     3b0:	66 0f ef c0          	pxor   %xmm0,%xmm0
}
     3b4:	c3                   	ret    
     3b5:	0f 1f 00             	nopl   (%rax)
  dtemp = 0.0;
     3b8:	66 0f ef c0          	pxor   %xmm0,%xmm0
     3bc:	e9 14 ff ff ff       	jmp    2d5 <ddot+0x65>
     3c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
     3c8:	c3                   	ret    
     3c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000003d0 <dgesl>:
{
     3d0:	f3 0f 1e fa          	endbr64 
     3d4:	41 57                	push   %r15
     3d6:	41 89 d3             	mov    %edx,%r11d
     3d9:	41 56                	push   %r14
     3db:	41 55                	push   %r13
     3dd:	41 54                	push   %r12
     3df:	4d 89 c4             	mov    %r8,%r12
     3e2:	55                   	push   %rbp
     3e3:	48 89 cd             	mov    %rcx,%rbp
     3e6:	53                   	push   %rbx
     3e7:	89 f3                	mov    %esi,%ebx
     3e9:	48 83 ec 10          	sub    $0x10,%rsp
     3ed:	48 89 3c 24          	mov    %rdi,(%rsp)
  if ( job == 0 )
     3f1:	45 85 c9             	test   %r9d,%r9d
     3f4:	0f 84 36 01 00 00    	je     530 <dgesl+0x160>
    for ( k = 1; k <= n; k++ )
     3fa:	85 d2                	test   %edx,%edx
     3fc:	0f 8e 8a 00 00 00    	jle    48c <dgesl+0xbc>
     402:	4c 63 ee             	movslq %esi,%r13
     405:	48 8b 34 24          	mov    (%rsp),%rsi
     409:	49 63 fb             	movslq %r11d,%rdi
     40c:	89 5c 24 08          	mov    %ebx,0x8(%rsp)
     410:	44 89 5c 24 0c       	mov    %r11d,0xc(%rsp)
     415:	49 89 ec             	mov    %rbp,%r12
     418:	45 31 f6             	xor    %r14d,%r14d
     41b:	4c 89 c1             	mov    %r8,%rcx
     41e:	4a 8d 04 ed 00 00 00 	lea    0x0(,%r13,8),%rax
     425:	00 
     426:	48 89 f3             	mov    %rsi,%rbx
     429:	48 89 f5             	mov    %rsi,%rbp
     42c:	49 89 fd             	mov    %rdi,%r13
     42f:	48 8d 50 08          	lea    0x8(%rax),%rdx
     433:	49 89 c3             	mov    %rax,%r11
     436:	49 89 d7             	mov    %rdx,%r15
     439:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
      t = ddot ( k-1, a+0+(k-1)*lda, 1, b, 1 );
     440:	48 89 ee             	mov    %rbp,%rsi
     443:	44 89 f7             	mov    %r14d,%edi
     446:	ba 01 00 00 00       	mov    $0x1,%edx
    for ( k = 1; k <= n; k++ )
     44b:	4c 01 dd             	add    %r11,%rbp
      t = ddot ( k-1, a+0+(k-1)*lda, 1, b, 1 );
     44e:	41 b8 01 00 00 00    	mov    $0x1,%r8d
     454:	e8 00 00 00 00       	call   459 <dgesl+0x89>
     459:	66 0f 28 c8          	movapd %xmm0,%xmm1
      b[k-1] = ( b[k-1] - t ) / a[k-1+(k-1)*lda];
     45d:	f2 42 0f 10 04 f1    	movsd  (%rcx,%r14,8),%xmm0
     463:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
     467:	f2 0f 5e 03          	divsd  (%rbx),%xmm0
     46b:	f2 42 0f 11 04 f1    	movsd  %xmm0,(%rcx,%r14,8)
    for ( k = 1; k <= n; k++ )
     471:	49 83 c6 01          	add    $0x1,%r14
     475:	4c 01 fb             	add    %r15,%rbx
     478:	4d 39 f5             	cmp    %r14,%r13
     47b:	75 c3                	jne    440 <dgesl+0x70>
     47d:	8b 5c 24 08          	mov    0x8(%rsp),%ebx
     481:	44 8b 5c 24 0c       	mov    0xc(%rsp),%r11d
     486:	4c 89 e5             	mov    %r12,%rbp
     489:	49 89 cc             	mov    %rcx,%r12
    for ( k = n-1; 1 <= k; k-- )
     48c:	45 8d 6b ff          	lea    -0x1(%r11),%r13d
     490:	45 85 ed             	test   %r13d,%r13d
     493:	0f 8e 80 00 00 00    	jle    519 <dgesl+0x149>
     499:	89 da                	mov    %ebx,%edx
     49b:	48 8b 04 24          	mov    (%rsp),%rax
     49f:	4d 63 ed             	movslq %r13d,%r13
     4a2:	f7 da                	neg    %edx
     4a4:	48 63 d2             	movslq %edx,%rdx
     4a7:	4c 8d 34 d5 f8 ff ff 	lea    -0x8(,%rdx,8),%r14
     4ae:	ff 
     4af:	41 8d 53 fe          	lea    -0x2(%r11),%edx
     4b3:	0f af d3             	imul   %ebx,%edx
     4b6:	48 63 d2             	movslq %edx,%rdx
     4b9:	4c 01 ea             	add    %r13,%rdx
     4bc:	48 8d 1c d0          	lea    (%rax,%rdx,8),%rbx
      b[k-1] = b[k-1] + ddot ( n-k, a+k+(k-1)*lda, 1, b+k, 1 );
     4c0:	44 89 df             	mov    %r11d,%edi
     4c3:	4b 8d 0c ec          	lea    (%r12,%r13,8),%rcx
     4c7:	41 b8 01 00 00 00    	mov    $0x1,%r8d
     4cd:	48 89 de             	mov    %rbx,%rsi
     4d0:	f2 43 0f 10 54 ec f8 	movsd  -0x8(%r12,%r13,8),%xmm2
     4d7:	44 29 ef             	sub    %r13d,%edi
     4da:	ba 01 00 00 00       	mov    $0x1,%edx
     4df:	e8 00 00 00 00       	call   4e4 <dgesl+0x114>
      l = ipvt[k-1];
     4e4:	4a 63 44 ad fc       	movslq -0x4(%rbp,%r13,4),%rax
      b[k-1] = b[k-1] + ddot ( n-k, a+k+(k-1)*lda, 1, b+k, 1 );
     4e9:	f2 0f 58 c2          	addsd  %xmm2,%xmm0
     4ed:	f2 43 0f 11 44 ec f8 	movsd  %xmm0,-0x8(%r12,%r13,8)
      if ( l != k )
     4f4:	44 39 e8             	cmp    %r13d,%eax
     4f7:	74 14                	je     50d <dgesl+0x13d>
        t = b[l-1];
     4f9:	49 8d 44 c4 f8       	lea    -0x8(%r12,%rax,8),%rax
     4fe:	f2 0f 10 08          	movsd  (%rax),%xmm1
        b[l-1] = b[k-1];
     502:	f2 0f 11 00          	movsd  %xmm0,(%rax)
        b[k-1] = t;
     506:	f2 43 0f 11 4c ec f8 	movsd  %xmm1,-0x8(%r12,%r13,8)
    for ( k = n-1; 1 <= k; k-- )
     50d:	49 83 ed 01          	sub    $0x1,%r13
     511:	4c 01 f3             	add    %r14,%rbx
     514:	45 85 ed             	test   %r13d,%r13d
     517:	7f a7                	jg     4c0 <dgesl+0xf0>
}
     519:	48 83 c4 10          	add    $0x10,%rsp
     51d:	5b                   	pop    %rbx
     51e:	5d                   	pop    %rbp
     51f:	41 5c                	pop    %r12
     521:	41 5d                	pop    %r13
     523:	41 5e                	pop    %r14
     525:	41 5f                	pop    %r15
     527:	c3                   	ret    
     528:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     52f:	00 
    for ( k = 1; k <= n-1; k++ )
     530:	83 fa 01             	cmp    $0x1,%edx
     533:	0f 8e 17 01 00 00    	jle    650 <dgesl+0x280>
     539:	4c 63 f2             	movslq %edx,%r14
     53c:	45 31 ff             	xor    %r15d,%r15d
     53f:	66 0f ef d2          	pxor   %xmm2,%xmm2
     543:	41 bd 01 00 00 00    	mov    $0x1,%r13d
     549:	4c 89 f0             	mov    %r14,%rax
     54c:	49 89 ce             	mov    %rcx,%r14
     54f:	48 89 c5             	mov    %rax,%rbp
     552:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
      l = ipvt[k-1];
     558:	4b 63 54 ae fc       	movslq -0x4(%r14,%r13,4),%rdx
     55d:	48 89 d0             	mov    %rdx,%rax
      t = b[l-1];
     560:	49 8d 54 d4 f8       	lea    -0x8(%r12,%rdx,8),%rdx
     565:	f2 0f 10 02          	movsd  (%rdx),%xmm0
      if ( l != k )
     569:	44 39 e8             	cmp    %r13d,%eax
     56c:	74 12                	je     580 <dgesl+0x1b0>
        b[l-1] = b[k-1];
     56e:	f2 43 0f 10 4c ec f8 	movsd  -0x8(%r12,%r13,8),%xmm1
     575:	f2 0f 11 0a          	movsd  %xmm1,(%rdx)
        b[k-1] = t;
     579:	f2 43 0f 11 44 ec f8 	movsd  %xmm0,-0x8(%r12,%r13,8)
  if ( da == 0.0 )
     580:	66 0f 2e c2          	ucomisd %xmm2,%xmm0
     584:	7a 02                	jp     588 <dgesl+0x1b8>
     586:	74 28                	je     5b0 <dgesl+0x1e0>
      daxpy ( n-k, t, a+k+(k-1)*lda, 1, b+k, 1 );
     588:	48 8b 34 24          	mov    (%rsp),%rsi
     58c:	49 63 c7             	movslq %r15d,%rax
     58f:	44 89 df             	mov    %r11d,%edi
     592:	4b 8d 0c ec          	lea    (%r12,%r13,8),%rcx
     596:	4c 01 e8             	add    %r13,%rax
     599:	44 29 ef             	sub    %r13d,%edi
     59c:	41 b8 01 00 00 00    	mov    $0x1,%r8d
     5a2:	ba 01 00 00 00       	mov    $0x1,%edx
     5a7:	48 8d 34 c6          	lea    (%rsi,%rax,8),%rsi
     5ab:	e8 50 fa ff ff       	call   0 <daxpy.part.0>
    for ( k = 1; k <= n-1; k++ )
     5b0:	49 83 c5 01          	add    $0x1,%r13
     5b4:	41 01 df             	add    %ebx,%r15d
     5b7:	4c 39 ed             	cmp    %r13,%rbp
     5ba:	75 9c                	jne    558 <dgesl+0x188>
     5bc:	49 89 ee             	mov    %rbp,%r14
     5bf:	41 83 eb 01          	sub    $0x1,%r11d
     5c3:	41 89 dd             	mov    %ebx,%r13d
     5c6:	48 8b 04 24          	mov    (%rsp),%rax
  if ( da == 0.0 )
     5ca:	66 0f ef d2          	pxor   %xmm2,%xmm2
     5ce:	49 63 eb             	movslq %r11d,%rbp
     5d1:	44 0f af db          	imul   %ebx,%r11d
     5d5:	41 f7 d5             	not    %r13d
     5d8:	f7 db                	neg    %ebx
     5da:	4d 63 ed             	movslq %r13d,%r13
     5dd:	48 63 db             	movslq %ebx,%rbx
      t = -b[k-1];
     5e0:	f3 0f 7e 1d 00 00 00 	movq   0x0(%rip),%xmm3        # 5e8 <dgesl+0x218>
     5e7:	00 
     5e8:	49 c1 e5 03          	shl    $0x3,%r13
     5ec:	48 c1 e3 03          	shl    $0x3,%rbx
     5f0:	4d 63 db             	movslq %r11d,%r11
     5f3:	4d 01 de             	add    %r11,%r14
     5f6:	4e 8d 1c d8          	lea    (%rax,%r11,8),%r11
     5fa:	4e 8d 34 f0          	lea    (%rax,%r14,8),%r14
     5fe:	66 90                	xchg   %ax,%ax
      b[k-1] = b[k-1] / a[k-1+(k-1)*lda];
     600:	f2 41 0f 10 04 ec    	movsd  (%r12,%rbp,8),%xmm0
     606:	89 ef                	mov    %ebp,%edi
     608:	f2 41 0f 5e 46 f8    	divsd  -0x8(%r14),%xmm0
     60e:	f2 41 0f 11 04 ec    	movsd  %xmm0,(%r12,%rbp,8)
  if ( n <= 0 )
     614:	85 ed                	test   %ebp,%ebp
     616:	0f 84 fd fe ff ff    	je     519 <dgesl+0x149>
  if ( da == 0.0 )
     61c:	66 0f 2e c2          	ucomisd %xmm2,%xmm0
     620:	7a 02                	jp     624 <dgesl+0x254>
     622:	74 1a                	je     63e <dgesl+0x26e>
      t = -b[k-1];
     624:	66 0f 57 c3          	xorpd  %xmm3,%xmm0
     628:	41 b8 01 00 00 00    	mov    $0x1,%r8d
     62e:	4c 89 e1             	mov    %r12,%rcx
     631:	4c 89 de             	mov    %r11,%rsi
     634:	ba 01 00 00 00       	mov    $0x1,%edx
     639:	e8 c2 f9 ff ff       	call   0 <daxpy.part.0>
    for ( k = n; 1 <= k; k-- )
     63e:	48 83 ed 01          	sub    $0x1,%rbp
     642:	4d 01 ee             	add    %r13,%r14
     645:	49 01 db             	add    %rbx,%r11
     648:	eb b6                	jmp    600 <dgesl+0x230>
     64a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
     650:	0f 85 c3 fe ff ff    	jne    519 <dgesl+0x149>
     656:	41 be 01 00 00 00    	mov    $0x1,%r14d
     65c:	e9 5e ff ff ff       	jmp    5bf <dgesl+0x1ef>
     661:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     668:	00 00 00 00 
     66c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000670 <dscal>:
{
     670:	f3 0f 1e fa          	endbr64 
  if ( n <= 0 )
     674:	85 ff                	test   %edi,%edi
     676:	7e 3e                	jle    6b6 <dscal+0x46>
  else if ( incx == 1 )
     678:	83 fa 01             	cmp    $0x1,%edx
     67b:	74 43                	je     6c0 <dscal+0x50>
      ix = 0;
     67d:	31 c0                	xor    %eax,%eax
    if ( 0 <= incx )
     67f:	85 d2                	test   %edx,%edx
     681:	79 0a                	jns    68d <dscal+0x1d>
      ix = ( - n + 1 ) * incx;
     683:	b8 01 00 00 00       	mov    $0x1,%eax
     688:	29 f8                	sub    %edi,%eax
     68a:	0f af c2             	imul   %edx,%eax
     68d:	48 63 d2             	movslq %edx,%rdx
     690:	48 98                	cltq   
     692:	48 8d 0c d5 00 00 00 	lea    0x0(,%rdx,8),%rcx
     699:	00 
     69a:	48 8d 04 c6          	lea    (%rsi,%rax,8),%rax
      ix = 0;
     69e:	31 d2                	xor    %edx,%edx
      x[ix] = sa * x[ix];
     6a0:	f2 0f 10 08          	movsd  (%rax),%xmm1
    for ( i = 0; i < n; i++ )
     6a4:	83 c2 01             	add    $0x1,%edx
      x[ix] = sa * x[ix];
     6a7:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
     6ab:	f2 0f 11 08          	movsd  %xmm1,(%rax)
    for ( i = 0; i < n; i++ )
     6af:	48 01 c8             	add    %rcx,%rax
     6b2:	39 d7                	cmp    %edx,%edi
     6b4:	75 ea                	jne    6a0 <dscal+0x30>
}
     6b6:	c3                   	ret    
     6b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     6be:	00 00 
     6c0:	e9 8b fa ff ff       	jmp    150 <dscal.part.0>
     6c5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     6cc:	00 00 00 00 

00000000000006d0 <idamax>:
    Input, int INCX, the increment between successive entries of SX.

    Output, int IDAMAX, the index of the element of maximum
    absolute value.
*/
{
     6d0:	f3 0f 1e fa          	endbr64 
  int ix;
  int value;

  value = 0;

  if ( n < 1 || incx <= 0 )
     6d4:	85 ff                	test   %edi,%edi
     6d6:	7e 78                	jle    750 <idamax+0x80>
     6d8:	85 d2                	test   %edx,%edx
     6da:	7e 74                	jle    750 <idamax+0x80>

  value = 1;

  if ( n == 1 )
  {
    return value;
     6dc:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  if ( n == 1 )
     6e2:	83 ff 01             	cmp    $0x1,%edi
     6e5:	74 61                	je     748 <idamax+0x78>
  }

  if ( incx == 1 )
  {
    dmax = r8_abs ( dx[0] );
     6e7:	f2 0f 10 06          	movsd  (%rsi),%xmm0
    Output, double R8_ABS, the absolute value of X.
*/
{
  double value;

  if ( 0.0 <= x )
     6eb:	66 0f ef d2          	pxor   %xmm2,%xmm2
  if ( incx == 1 )
     6ef:	83 fa 01             	cmp    $0x1,%edx
     6f2:	74 6c                	je     760 <idamax+0x90>
  if ( 0.0 <= x )
     6f4:	66 0f 2f c2          	comisd %xmm2,%xmm0
     6f8:	73 08                	jae    702 <idamax+0x32>
  {
    value = x;
  } 
  else
  {
    value = -x;
     6fa:	66 0f 57 05 00 00 00 	xorpd  0x0(%rip),%xmm0        # 702 <idamax+0x32>
     701:	00 
    for ( i = 1; i < n; i++ )
     702:	48 63 d2             	movslq %edx,%rdx
        dmax = r8_abs ( dx[i] );
     705:	41 b8 01 00 00 00    	mov    $0x1,%r8d
     70b:	b8 01 00 00 00       	mov    $0x1,%eax
    value = -x;
     710:	f3 0f 7e 1d 00 00 00 	movq   0x0(%rip),%xmm3        # 718 <idamax+0x48>
     717:	00 
     718:	48 c1 e2 03          	shl    $0x3,%rdx
     71c:	48 01 d6             	add    %rdx,%rsi
     71f:	90                   	nop
      if ( dmax < r8_abs ( dx[ix] ) )
     720:	f2 0f 10 0e          	movsd  (%rsi),%xmm1
  if ( 0.0 <= x )
     724:	66 0f 2f ca          	comisd %xmm2,%xmm1
     728:	73 04                	jae    72e <idamax+0x5e>
    value = -x;
     72a:	66 0f 57 cb          	xorpd  %xmm3,%xmm1
        value = i + 1;
     72e:	83 c0 01             	add    $0x1,%eax
        dmax = r8_abs ( dx[ix] );
     731:	66 0f 2f c8          	comisd %xmm0,%xmm1
     735:	f2 0f 5f c8          	maxsd  %xmm0,%xmm1
     739:	44 0f 47 c0          	cmova  %eax,%r8d
     73d:	66 0f 28 c1          	movapd %xmm1,%xmm0
    for ( i = 1; i < n; i++ )
     741:	48 01 d6             	add    %rdx,%rsi
     744:	39 c7                	cmp    %eax,%edi
     746:	7f d8                	jg     720 <idamax+0x50>
}
     748:	44 89 c0             	mov    %r8d,%eax
     74b:	c3                   	ret    
     74c:	0f 1f 40 00          	nopl   0x0(%rax)
    return value;
     750:	45 31 c0             	xor    %r8d,%r8d
}
     753:	44 89 c0             	mov    %r8d,%eax
     756:	c3                   	ret    
     757:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     75e:	00 00 
  if ( 0.0 <= x )
     760:	66 0f 2f c2          	comisd %xmm2,%xmm0
     764:	73 08                	jae    76e <idamax+0x9e>
    value = -x;
     766:	66 0f 57 05 00 00 00 	xorpd  0x0(%rip),%xmm0        # 76e <idamax+0x9e>
     76d:	00 
     76e:	f3 0f 7e 1d 00 00 00 	movq   0x0(%rip),%xmm3        # 776 <idamax+0xa6>
     775:	00 
     776:	48 83 c6 08          	add    $0x8,%rsi
{
     77a:	41 b8 01 00 00 00    	mov    $0x1,%r8d
      if ( dmax < r8_abs ( dx[i] ) )
     780:	f2 0f 10 0e          	movsd  (%rsi),%xmm1
  if ( 0.0 <= x )
     784:	66 0f 2f ca          	comisd %xmm2,%xmm1
     788:	73 04                	jae    78e <idamax+0xbe>
    value = -x;
     78a:	66 0f 57 cb          	xorpd  %xmm3,%xmm1
        value = i + 1;
     78e:	83 c2 01             	add    $0x1,%edx
        dmax = r8_abs ( dx[i] );
     791:	66 0f 2f c8          	comisd %xmm0,%xmm1
     795:	f2 0f 5f c8          	maxsd  %xmm0,%xmm1
     799:	44 0f 47 c2          	cmova  %edx,%r8d
     79d:	66 0f 28 c1          	movapd %xmm1,%xmm0
    for ( i = 1; i < n; i++ )
     7a1:	48 83 c6 08          	add    $0x8,%rsi
     7a5:	39 d7                	cmp    %edx,%edi
     7a7:	7f d7                	jg     780 <idamax+0xb0>
}
     7a9:	44 89 c0             	mov    %r8d,%eax
     7ac:	c3                   	ret    
     7ad:	0f 1f 00             	nopl   (%rax)

00000000000007b0 <dgefa>:
{
     7b0:	f3 0f 1e fa          	endbr64 
     7b4:	41 57                	push   %r15
     7b6:	49 89 ff             	mov    %rdi,%r15
     7b9:	41 56                	push   %r14
     7bb:	41 55                	push   %r13
     7bd:	41 89 d5             	mov    %edx,%r13d
     7c0:	41 54                	push   %r12
     7c2:	55                   	push   %rbp
     7c3:	89 f5                	mov    %esi,%ebp
     7c5:	53                   	push   %rbx
     7c6:	48 83 ec 58          	sub    $0x58,%rsp
     7ca:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
  for ( k = 1; k <= n-1; k++ )
     7cf:	83 fa 01             	cmp    $0x1,%edx
     7d2:	0f 8e e5 01 00 00    	jle    9bd <dgefa+0x20d>
     7d8:	48 63 c6             	movslq %esi,%rax
     7db:	45 31 e4             	xor    %r12d,%r12d
     7de:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
     7e3:	66 0f ef e4          	pxor   %xmm4,%xmm4
     7e7:	48 8d 0c c5 08 00 00 	lea    0x8(,%rax,8),%rcx
     7ee:	00 
     7ef:	48 c1 e0 03          	shl    $0x3,%rax
     7f3:	41 be 01 00 00 00    	mov    $0x1,%r14d
    t = -1.0 / a[k-1+(k-1)*lda];
     7f9:	45 89 e2             	mov    %r12d,%r10d
     7fc:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
     801:	8d 4e 01             	lea    0x1(%rsi),%ecx
     804:	4d 89 f4             	mov    %r14,%r12
     807:	f2 0f 10 2d 00 00 00 	movsd  0x0(%rip),%xmm5        # 80f <dgefa+0x5f>
     80e:	00 
     80f:	89 4c 24 3c          	mov    %ecx,0x3c(%rsp)
     813:	48 63 ca             	movslq %edx,%rcx
     816:	48 89 04 24          	mov    %rax,(%rsp)
     81a:	8d 42 01             	lea    0x1(%rdx),%eax
     81d:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
  for ( k = 1; k <= n-1; k++ )
     822:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%rsp)
     829:	00 
  info = 0;
     82a:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%rsp)
     831:	00 
     832:	89 44 24 48          	mov    %eax,0x48(%rsp)
     836:	eb 3c                	jmp    874 <dgefa+0xc4>
     838:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     83f:	00 
     840:	44 89 64 24 4c       	mov    %r12d,0x4c(%rsp)
     845:	42 8d 44 15 00       	lea    0x0(%rbp,%r10,1),%eax
     84a:	89 44 24 24          	mov    %eax,0x24(%rsp)
  for ( k = 1; k <= n-1; k++ )
     84e:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
     853:	8b 74 24 3c          	mov    0x3c(%rsp),%esi
     857:	49 83 c4 01          	add    $0x1,%r12
     85b:	48 01 4c 24 10       	add    %rcx,0x10(%rsp)
     860:	44 8b 54 24 24       	mov    0x24(%rsp),%r10d
     865:	01 74 24 38          	add    %esi,0x38(%rsp)
     869:	4c 3b 64 24 30       	cmp    0x30(%rsp),%r12
     86e:	0f 84 64 01 00 00    	je     9d8 <dgefa+0x228>
    l = idamax ( n-k+1, a+(k-1)+(k-1)*lda, 1 ) + k - 1;
     874:	8b 7c 24 48          	mov    0x48(%rsp),%edi
     878:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
     87d:	ba 01 00 00 00       	mov    $0x1,%edx
     882:	45 89 ee             	mov    %r13d,%r14d
     885:	45 29 e6             	sub    %r12d,%r14d
     888:	41 8d 5c 24 01       	lea    0x1(%r12),%ebx
     88d:	44 29 e7             	sub    %r12d,%edi
     890:	e8 00 00 00 00       	call   895 <dgefa+0xe5>
     895:	46 8d 1c 20          	lea    (%rax,%r12,1),%r11d
    ipvt[k-1] = l;
     899:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    l = idamax ( n-k+1, a+(k-1)+(k-1)*lda, 1 ) + k - 1;
     89e:	45 8d 4b ff          	lea    -0x1(%r11),%r9d
    ipvt[k-1] = l;
     8a2:	46 89 4c a0 fc       	mov    %r9d,-0x4(%rax,%r12,4)
    if ( a[l-1+(k-1)*lda] == 0.0 )
     8a7:	43 8d 44 13 fe       	lea    -0x2(%r11,%r10,1),%eax
     8ac:	48 98                	cltq   
     8ae:	49 8d 04 c7          	lea    (%r15,%rax,8),%rax
     8b2:	f2 0f 10 00          	movsd  (%rax),%xmm0
     8b6:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
     8ba:	7a 02                	jp     8be <dgefa+0x10e>
     8bc:	74 82                	je     840 <dgefa+0x90>
      a[l-1+(k-1)*lda] = a[k-1+(k-1)*lda];
     8be:	48 63 54 24 38       	movslq 0x38(%rsp),%rdx
     8c3:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
     8c8:	49 8d 14 d7          	lea    (%r15,%rdx,8),%rdx
     8cc:	f2 0f 10 0a          	movsd  (%rdx),%xmm1
    if ( l != k )
     8d0:	45 39 e1             	cmp    %r12d,%r9d
     8d3:	74 0c                	je     8e1 <dgefa+0x131>
      a[l-1+(k-1)*lda] = a[k-1+(k-1)*lda];
     8d5:	f2 0f 11 08          	movsd  %xmm1,(%rax)
      a[k-1+(k-1)*lda] = t;
     8d9:	66 0f 28 c8          	movapd %xmm0,%xmm1
     8dd:	f2 0f 11 02          	movsd  %xmm0,(%rdx)
    t = -1.0 / a[k-1+(k-1)*lda];
     8e1:	66 0f 28 c5          	movapd %xmm5,%xmm0
     8e5:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
     8ea:	ba 01 00 00 00       	mov    $0x1,%edx
     8ef:	44 89 f7             	mov    %r14d,%edi
     8f2:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     8f6:	48 8d 70 08          	lea    0x8(%rax),%rsi
     8fa:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
  else if ( incx == 1 )
     8ff:	e8 4c f8 ff ff       	call   150 <dscal.part.0>
    for ( j = k+1; j <= n; j++ )
     904:	41 39 dd             	cmp    %ebx,%r13d
     907:	0f 8c 38 ff ff ff    	jl     845 <dgefa+0x95>
     90d:	42 8d 44 15 00       	lea    0x0(%rbp,%r10,1),%eax
     912:	4d 63 db             	movslq %r11d,%r11
     915:	4c 89 64 24 50       	mov    %r12,0x50(%rsp)
     91a:	44 89 f7             	mov    %r14d,%edi
     91d:	89 44 24 24          	mov    %eax,0x24(%rsp)
     921:	48 98                	cltq   
     923:	4d 29 e3             	sub    %r12,%r11
     926:	41 89 ee             	mov    %ebp,%r14d
     929:	4c 01 e0             	add    %r12,%rax
     92c:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
     931:	49 8d 0c c7          	lea    (%r15,%rax,8),%rcx
     935:	8b 44 24 38          	mov    0x38(%rsp),%eax
     939:	45 89 ef             	mov    %r13d,%r15d
     93c:	45 89 cd             	mov    %r9d,%r13d
     93f:	01 e8                	add    %ebp,%eax
     941:	48 89 cd             	mov    %rcx,%rbp
     944:	41 89 c4             	mov    %eax,%r12d
     947:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     94e:	00 00 
      t = a[l-1+(j-1)*lda];
     950:	f2 42 0f 10 44 dd f0 	movsd  -0x10(%rbp,%r11,8),%xmm0
      if ( l != k )
     957:	44 3b 6c 24 20       	cmp    0x20(%rsp),%r13d
     95c:	74 1b                	je     979 <dgefa+0x1c9>
        a[l-1+(j-1)*lda] = a[k-1+(j-1)*lda];
     95e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
     963:	49 63 d4             	movslq %r12d,%rdx
     966:	48 8d 14 d0          	lea    (%rax,%rdx,8),%rdx
     96a:	f2 0f 10 0a          	movsd  (%rdx),%xmm1
     96e:	f2 42 0f 11 4c dd f0 	movsd  %xmm1,-0x10(%rbp,%r11,8)
        a[k-1+(j-1)*lda] = t;
     975:	f2 0f 11 02          	movsd  %xmm0,(%rdx)
  if ( da == 0.0 )
     979:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
     97d:	7a 02                	jp     981 <dgefa+0x1d1>
     97f:	74 18                	je     999 <dgefa+0x1e9>
     981:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
     986:	41 b8 01 00 00 00    	mov    $0x1,%r8d
     98c:	48 89 e9             	mov    %rbp,%rcx
     98f:	ba 01 00 00 00       	mov    $0x1,%edx
     994:	e8 67 f6 ff ff       	call   0 <daxpy.part.0>
    for ( j = k+1; j <= n; j++ )
     999:	83 c3 01             	add    $0x1,%ebx
     99c:	48 03 2c 24          	add    (%rsp),%rbp
     9a0:	45 01 f4             	add    %r14d,%r12d
     9a3:	41 39 df             	cmp    %ebx,%r15d
     9a6:	7d a8                	jge    950 <dgefa+0x1a0>
     9a8:	45 89 fd             	mov    %r15d,%r13d
     9ab:	4c 8b 64 24 50       	mov    0x50(%rsp),%r12
     9b0:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
     9b5:	44 89 f5             	mov    %r14d,%ebp
     9b8:	e9 91 fe ff ff       	jmp    84e <dgefa+0x9e>
     9bd:	48 63 c2             	movslq %edx,%rax
  info = 0;
     9c0:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%rsp)
     9c7:	00 
     9c8:	66 0f ef e4          	pxor   %xmm4,%xmm4
     9cc:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
     9d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  ipvt[n-1] = n;
     9d8:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
     9dd:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
     9e2:	44 89 6c 88 fc       	mov    %r13d,-0x4(%rax,%rcx,4)
  if ( a[n-1+(n-1)*lda] == 0.0 )
     9e7:	41 8d 45 ff          	lea    -0x1(%r13),%eax
     9eb:	0f af e8             	imul   %eax,%ebp
     9ee:	01 e8                	add    %ebp,%eax
     9f0:	48 98                	cltq   
     9f2:	66 41 0f 2e 24 c7    	ucomisd (%r15,%rax,8),%xmm4
     9f8:	7a 0b                	jp     a05 <dgefa+0x255>
     9fa:	44 0f 45 6c 24 4c    	cmovne 0x4c(%rsp),%r13d
     a00:	44 89 6c 24 4c       	mov    %r13d,0x4c(%rsp)
}
     a05:	8b 44 24 4c          	mov    0x4c(%rsp),%eax
     a09:	48 83 c4 58          	add    $0x58,%rsp
     a0d:	5b                   	pop    %rbx
     a0e:	5d                   	pop    %rbp
     a0f:	41 5c                	pop    %r12
     a11:	41 5d                	pop    %r13
     a13:	41 5e                	pop    %r14
     a15:	41 5f                	pop    %r15
     a17:	c3                   	ret    
     a18:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     a1f:	00 

0000000000000a20 <r8_abs>:
{
     a20:	f3 0f 1e fa          	endbr64 
  if ( 0.0 <= x )
     a24:	66 0f 2f 05 00 00 00 	comisd 0x0(%rip),%xmm0        # a2c <r8_abs+0xc>
     a2b:	00 
     a2c:	72 02                	jb     a30 <r8_abs+0x10>
  }
  return value;
}
     a2e:	c3                   	ret    
     a2f:	90                   	nop
    value = -x;
     a30:	66 0f 57 05 00 00 00 	xorpd  0x0(%rip),%xmm0        # a38 <r8_abs+0x18>
     a37:	00 
}
     a38:	c3                   	ret    
     a39:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000a40 <r8_epsilon>:

  Parameters:

    Output, double R8_EPSILON, the R8 round-off unit.
*/
{
     a40:	f3 0f 1e fa          	endbr64 
  const double value = 2.220446049250313E-016;

  return value;
}
     a44:	f2 0f 10 05 00 00 00 	movsd  0x0(%rip),%xmm0        # a4c <r8_epsilon+0xc>
     a4b:	00 
     a4c:	c3                   	ret    
     a4d:	0f 1f 00             	nopl   (%rax)

0000000000000a50 <r8_max>:

    Input, double X, Y, the quantities to compare.

    Output, double R8_MAX, the maximum of X and Y.
*/
{
     a50:	f3 0f 1e fa          	endbr64 
  {
    value = x;
  } 
  else
  {
    value = y;
     a54:	f2 0f 5f c1          	maxsd  %xmm1,%xmm0
  }
  return value;
}
     a58:	c3                   	ret    
     a59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000a60 <r8_random>:
    elements must be between 0 and 4095, and ISEED(4) must be odd.
    On exit, the seed is updated.

    Output, double R8_RANDOM, the next pseudorandom number.
*/
{
     a60:	f3 0f 1e fa          	endbr64 
     a64:	53                   	push   %rbx
  double r = 1.0 / 4096.0;
  double value;
/*
  Multiply the seed by the multiplier modulo 2**48.
*/
  it4 = iseed[3] * m4;
     a65:	8b 47 0c             	mov    0xc(%rdi),%eax
{
     a68:	48 89 fa             	mov    %rdi,%rdx
*/
  value = 
      r * ( ( double ) ( it1 ) 
    + r * ( ( double ) ( it2 ) 
    + r * ( ( double ) ( it3 ) 
    + r * ( ( double ) ( it4 ) ) ) ) );
     a6b:	66 0f ef c9          	pxor   %xmm1,%xmm1
  it3 = it3 + iseed[2] * m4 + iseed[3] * m3;
     a6f:	44 8b 57 08          	mov    0x8(%rdi),%r10d
  it2 = it2 + iseed[1] * m4 + iseed[2] * m3 + iseed[3] * m2;
     a73:	8b 5a 04             	mov    0x4(%rdx),%ebx
    + r * ( ( double ) ( it3 ) 
     a76:	66 0f ef c0          	pxor   %xmm0,%xmm0
  it4 = iseed[3] * m4;
     a7a:	69 f0 f5 09 00 00    	imul   $0x9f5,%eax,%esi
    + r * ( ( double ) ( it4 ) ) ) ) );
     a80:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # a88 <r8_random+0x28>
     a87:	00 
  it3 = it3 + iseed[2] * m4 + iseed[3] * m3;
     a88:	41 69 fa f5 09 00 00 	imul   $0x9f5,%r10d,%edi
     a8f:	89 f1                	mov    %esi,%ecx
     a91:	c1 f9 1f             	sar    $0x1f,%ecx
     a94:	c1 e9 14             	shr    $0x14,%ecx
     a97:	44 8d 0c 0e          	lea    (%rsi,%rcx,1),%r9d
     a9b:	41 81 e1 ff 0f 00 00 	and    $0xfff,%r9d
     aa2:	41 29 c9             	sub    %ecx,%r9d
  it3 = it4 / ipw2;
     aa5:	85 f6                	test   %esi,%esi
     aa7:	8d 8e ff 0f 00 00    	lea    0xfff(%rsi),%ecx
     aad:	0f 49 ce             	cmovns %esi,%ecx
    + r * ( ( double ) ( it4 ) ) ) ) );
     ab0:	f2 41 0f 2a c9       	cvtsi2sd %r9d,%xmm1
  iseed[3] = it4;
     ab5:	44 89 4a 0c          	mov    %r9d,0xc(%rdx)
  it3 = it4 / ipw2;
     ab9:	c1 f9 0c             	sar    $0xc,%ecx
  it3 = it3 + iseed[2] * m4 + iseed[3] * m3;
     abc:	8d 34 0f             	lea    (%rdi,%rcx,1),%esi
     abf:	69 c8 cc 09 00 00    	imul   $0x9cc,%eax,%ecx
    + r * ( ( double ) ( it4 ) ) ) ) );
     ac5:	f2 0f 59 ca          	mulsd  %xmm2,%xmm1
  it3 = it3 + iseed[2] * m4 + iseed[3] * m3;
     ac9:	01 f1                	add    %esi,%ecx
  it3 = it3 - ipw2 * it2;
     acb:	89 ce                	mov    %ecx,%esi
  it2 = it3 / ipw2;
     acd:	8d b9 ff 0f 00 00    	lea    0xfff(%rcx),%edi
     ad3:	c1 fe 1f             	sar    $0x1f,%esi
     ad6:	c1 ee 14             	shr    $0x14,%esi
     ad9:	44 8d 04 31          	lea    (%rcx,%rsi,1),%r8d
     add:	41 81 e0 ff 0f 00 00 	and    $0xfff,%r8d
     ae4:	41 29 f0             	sub    %esi,%r8d
  it2 = it2 + iseed[1] * m4 + iseed[2] * m3 + iseed[3] * m2;
     ae7:	69 f3 f5 09 00 00    	imul   $0x9f5,%ebx,%esi
  it2 = it3 / ipw2;
     aed:	85 c9                	test   %ecx,%ecx
     aef:	0f 48 cf             	cmovs  %edi,%ecx
    + r * ( ( double ) ( it3 ) 
     af2:	f2 41 0f 2a c0       	cvtsi2sd %r8d,%xmm0
  iseed[2] = it3;
     af7:	44 89 42 08          	mov    %r8d,0x8(%rdx)
  it2 = it3 / ipw2;
     afb:	c1 f9 0c             	sar    $0xc,%ecx
  it2 = it2 + iseed[1] * m4 + iseed[2] * m3 + iseed[3] * m2;
     afe:	01 f1                	add    %esi,%ecx
     b00:	41 69 f2 cc 09 00 00 	imul   $0x9cc,%r10d,%esi
    + r * ( ( double ) ( it4 ) ) ) ) );
     b07:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
    + r * ( ( double ) ( it2 ) 
     b0b:	66 0f ef c0          	pxor   %xmm0,%xmm0
  it2 = it2 + iseed[1] * m4 + iseed[2] * m3 + iseed[3] * m2;
     b0f:	01 f1                	add    %esi,%ecx
     b11:	69 f0 42 01 00 00    	imul   $0x142,%eax,%esi
    + r * ( ( double ) ( it3 ) 
     b17:	f2 0f 59 ca          	mulsd  %xmm2,%xmm1
  it2 = it2 + iseed[1] * m4 + iseed[2] * m3 + iseed[3] * m2;
     b1b:	01 ce                	add    %ecx,%esi
  it2 = it2 - ipw2 * it1;
     b1d:	89 f1                	mov    %esi,%ecx
  it1 = it2 / ipw2;
     b1f:	44 8d 9e ff 0f 00 00 	lea    0xfff(%rsi),%r11d
     b26:	c1 f9 1f             	sar    $0x1f,%ecx
     b29:	c1 e9 14             	shr    $0x14,%ecx
     b2c:	8d 3c 0e             	lea    (%rsi,%rcx,1),%edi
     b2f:	81 e7 ff 0f 00 00    	and    $0xfff,%edi
     b35:	29 cf                	sub    %ecx,%edi
  it1 = it1 + iseed[0] * m4 + iseed[1] * m3 + iseed[2] * m2 + iseed[3] * m1;
     b37:	69 0a f5 09 00 00    	imul   $0x9f5,(%rdx),%ecx
  it1 = it2 / ipw2;
     b3d:	85 f6                	test   %esi,%esi
     b3f:	41 0f 48 f3          	cmovs  %r11d,%esi
  it1 = it1 + iseed[0] * m4 + iseed[1] * m3 + iseed[2] * m2 + iseed[3] * m1;
     b43:	69 db cc 09 00 00    	imul   $0x9cc,%ebx,%ebx
  iseed[1] = it2;
     b49:	89 7a 04             	mov    %edi,0x4(%rdx)
  it1 = it1 + iseed[0] * m4 + iseed[1] * m3 + iseed[2] * m2 + iseed[3] * m1;
     b4c:	45 69 d2 42 01 00 00 	imul   $0x142,%r10d,%r10d
  it1 = it2 / ipw2;
     b53:	c1 fe 0c             	sar    $0xc,%esi
  it1 = it1 + iseed[0] * m4 + iseed[1] * m3 + iseed[2] * m2 + iseed[3] * m1;
     b56:	69 c0 ee 01 00 00    	imul   $0x1ee,%eax,%eax
     b5c:	01 f1                	add    %esi,%ecx
    + r * ( ( double ) ( it2 ) 
     b5e:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
  it1 = it1 + iseed[0] * m4 + iseed[1] * m3 + iseed[2] * m2 + iseed[3] * m1;
     b62:	01 d9                	add    %ebx,%ecx

  return value;
}
     b64:	5b                   	pop    %rbx
  it1 = it1 + iseed[0] * m4 + iseed[1] * m3 + iseed[2] * m2 + iseed[3] * m1;
     b65:	44 01 d1             	add    %r10d,%ecx
     b68:	01 c8                	add    %ecx,%eax
  it1 = ( it1 % ipw2 );
     b6a:	89 c1                	mov    %eax,%ecx
    + r * ( ( double ) ( it3 ) 
     b6c:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
      r * ( ( double ) ( it1 ) 
     b70:	66 0f ef c9          	pxor   %xmm1,%xmm1
  it1 = ( it1 % ipw2 );
     b74:	c1 f9 1f             	sar    $0x1f,%ecx
     b77:	c1 e9 14             	shr    $0x14,%ecx
    + r * ( ( double ) ( it2 ) 
     b7a:	f2 0f 59 c2          	mulsd  %xmm2,%xmm0
  it1 = ( it1 % ipw2 );
     b7e:	01 c8                	add    %ecx,%eax
     b80:	25 ff 0f 00 00       	and    $0xfff,%eax
     b85:	29 c8                	sub    %ecx,%eax
      r * ( ( double ) ( it1 ) 
     b87:	f2 0f 2a c8          	cvtsi2sd %eax,%xmm1
  iseed[0] = it1;
     b8b:	89 02                	mov    %eax,(%rdx)
    + r * ( ( double ) ( it2 ) 
     b8d:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
  value = 
     b91:	f2 0f 59 c2          	mulsd  %xmm2,%xmm0
}
     b95:	c3                   	ret    
     b96:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
     b9d:	00 00 00 

0000000000000ba0 <r8mat_gen>:

    Input, integer N, the order of the matrix.

    Output, double R8MAT_GEN[LDA*N], the N by N matrix.
*/
{
     ba0:	f3 0f 1e fa          	endbr64 
     ba4:	41 57                	push   %r15
     ba6:	41 56                	push   %r14
     ba8:	41 55                	push   %r13
     baa:	41 54                	push   %r12
     bac:	55                   	push   %rbp
     bad:	89 f5                	mov    %esi,%ebp
     baf:	53                   	push   %rbx
     bb0:	48 63 df             	movslq %edi,%rbx
     bb3:	48 83 ec 38          	sub    $0x38,%rsp
     bb7:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
     bbe:	00 00 
     bc0:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
     bc5:	31 c0                	xor    %eax,%eax
  __builtin_ia32_clui ();
     bc7:	f3 0f 01 ee          	clui   
  _clui();
  double *a;
  int i;
  int init[4] = { 1, 2, 3, 1325 };
     bcb:	48 b8 01 00 00 00 02 	movabs $0x200000001,%rax
     bd2:	00 00 00 
  int j;

  // _clui();
  a = ( double * ) malloc ( lda * n * sizeof ( double ) );
     bd5:	89 df                	mov    %ebx,%edi
  int init[4] = { 1, 2, 3, 1325 };
     bd7:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
     bdc:	48 b8 03 00 00 00 2d 	movabs $0x52d00000003,%rax
     be3:	05 00 00 
  a = ( double * ) malloc ( lda * n * sizeof ( double ) );
     be6:	0f af fe             	imul   %esi,%edi
  int init[4] = { 1, 2, 3, 1325 };
     be9:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  a = ( double * ) malloc ( lda * n * sizeof ( double ) );
     bee:	48 63 ff             	movslq %edi,%rdi
     bf1:	48 c1 e7 03          	shl    $0x3,%rdi
     bf5:	e8 00 00 00 00       	call   bfa <r8mat_gen+0x5a>
     bfa:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  // _stui();

  for ( j = 1; j <= n; j++ )
     bff:	85 ed                	test   %ebp,%ebp
     c01:	7e 55                	jle    c58 <r8mat_gen+0xb8>
     c03:	f2 0f 10 1d 00 00 00 	movsd  0x0(%rip),%xmm3        # c0b <r8mat_gen+0x6b>
     c0a:	00 
     c0b:	41 bd 01 00 00 00    	mov    $0x1,%r13d
     c11:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
     c16:	4c 8d 34 dd 00 00 00 	lea    0x0(,%rbx,8),%r14
     c1d:	00 
     c1e:	48 89 c3             	mov    %rax,%rbx
     c21:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
{
     c28:	41 bf 01 00 00 00    	mov    $0x1,%r15d
     c2e:	66 90                	xchg   %ax,%ax
  {
    for ( i = 1; i <= n; i++ )
    {
      a[i-1+(j-1)*lda] = r8_random ( init ) - 0.5;
     c30:	4c 89 e7             	mov    %r12,%rdi
     c33:	e8 00 00 00 00       	call   c38 <r8mat_gen+0x98>
     c38:	f2 0f 5c c3          	subsd  %xmm3,%xmm0
     c3c:	f2 42 0f 11 44 fb f8 	movsd  %xmm0,-0x8(%rbx,%r15,8)
    for ( i = 1; i <= n; i++ )
     c43:	49 83 c7 01          	add    $0x1,%r15
     c47:	44 39 fd             	cmp    %r15d,%ebp
     c4a:	7d e4                	jge    c30 <r8mat_gen+0x90>
  for ( j = 1; j <= n; j++ )
     c4c:	41 83 c5 01          	add    $0x1,%r13d
     c50:	4c 01 f3             	add    %r14,%rbx
     c53:	44 39 ed             	cmp    %r13d,%ebp
     c56:	7d d0                	jge    c28 <r8mat_gen+0x88>
  __builtin_ia32_stui ();
     c58:	f3 0f 01 ef          	stui   
    }
  }
  
  _stui();
  return a;
}
     c5c:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
     c61:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
     c68:	00 00 
     c6a:	75 14                	jne    c80 <r8mat_gen+0xe0>
     c6c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
     c71:	48 83 c4 38          	add    $0x38,%rsp
     c75:	5b                   	pop    %rbx
     c76:	5d                   	pop    %rbp
     c77:	41 5c                	pop    %r12
     c79:	41 5d                	pop    %r13
     c7b:	41 5e                	pop    %r14
     c7d:	41 5f                	pop    %r15
     c7f:	c3                   	ret    
     c80:	e8 00 00 00 00       	call   c85 <r8mat_gen+0xe5>
     c85:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     c8c:	00 00 00 00 

0000000000000c90 <linpack>:
long long linpack() {
     c90:	f3 0f 1e fa          	endbr64 
     c94:	41 57                	push   %r15
  a = r8mat_gen ( LDA, N );
     c96:	be d0 07 00 00       	mov    $0x7d0,%esi
     c9b:	bf d1 07 00 00       	mov    $0x7d1,%edi
long long linpack() {
     ca0:	41 56                	push   %r14
     ca2:	41 55                	push   %r13
     ca4:	41 54                	push   %r12
     ca6:	55                   	push   %rbp
     ca7:	53                   	push   %rbx
     ca8:	48 83 ec 28          	sub    $0x28,%rsp
  a = r8mat_gen ( LDA, N );
     cac:	e8 00 00 00 00       	call   cb1 <linpack+0x21>
     cb1:	48 89 c3             	mov    %rax,%rbx
     cb4:	48 89 04 24          	mov    %rax,(%rsp)
  __builtin_ia32_clui ();
     cb8:	f3 0f 01 ee          	clui   
  b = ( double * ) malloc ( N * sizeof ( double ) );
     cbc:	bf 80 3e 00 00       	mov    $0x3e80,%edi
     cc1:	e8 00 00 00 00       	call   cc6 <linpack+0x36>
  ipvt = ( int * ) malloc ( N * sizeof ( int ) );
     cc6:	bf 40 1f 00 00       	mov    $0x1f40,%edi
  b = ( double * ) malloc ( N * sizeof ( double ) );
     ccb:	49 89 c5             	mov    %rax,%r13
  ipvt = ( int * ) malloc ( N * sizeof ( int ) );
     cce:	e8 00 00 00 00       	call   cd3 <linpack+0x43>
  resid = ( double * ) malloc ( N * sizeof ( double ) );
     cd3:	bf 80 3e 00 00       	mov    $0x3e80,%edi
  ipvt = ( int * ) malloc ( N * sizeof ( int ) );
     cd8:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  resid = ( double * ) malloc ( N * sizeof ( double ) );
     cdd:	e8 00 00 00 00       	call   ce2 <linpack+0x52>
  rhs = ( double * ) malloc ( N * sizeof ( double ) );
     ce2:	be 01 00 00 00       	mov    $0x1,%esi
     ce7:	bf 80 3e 00 00       	mov    $0x3e80,%edi
  resid = ( double * ) malloc ( N * sizeof ( double ) );
     cec:	49 89 c6             	mov    %rax,%r14
  rhs = ( double * ) malloc ( N * sizeof ( double ) );
     cef:	e8 00 00 00 00       	call   cf4 <linpack+0x64>
  x = ( double * ) malloc ( N * sizeof ( double ) );
     cf4:	bf 80 3e 00 00       	mov    $0x3e80,%edi
  rhs = ( double * ) malloc ( N * sizeof ( double ) );
     cf9:	49 89 c4             	mov    %rax,%r12
  x = ( double * ) malloc ( N * sizeof ( double ) );
     cfc:	e8 00 00 00 00       	call   d01 <linpack+0x71>
     d01:	48 89 c5             	mov    %rax,%rbp
  __builtin_ia32_stui ();
     d04:	f3 0f 01 ef          	stui   
  a_max = 0.0;
     d08:	66 0f ef db          	pxor   %xmm3,%xmm3
     d0c:	66 0f 28 d3          	movapd %xmm3,%xmm2
     d10:	48 8d 93 80 3e 00 00 	lea    0x3e80(%rbx),%rdx
     d17:	48 8d 8b 00 c5 e8 01 	lea    0x1e8c500(%rbx),%rcx
    for ( i = 0; i < N; i++ )
     d1e:	48 8d 82 80 c1 ff ff 	lea    -0x3e80(%rdx),%rax
     d25:	0f 1f 00             	nopl   (%rax)
    value = y;
     d28:	f2 0f 5f 10          	maxsd  (%rax),%xmm2
    for ( i = 0; i < N; i++ )
     d2c:	48 83 c0 08          	add    $0x8,%rax
     d30:	48 39 d0             	cmp    %rdx,%rax
     d33:	75 f3                	jne    d28 <linpack+0x98>
  for ( j = 0; j < N; j++ )
     d35:	48 8d 90 88 3e 00 00 	lea    0x3e88(%rax),%rdx
     d3c:	48 39 ca             	cmp    %rcx,%rdx
     d3f:	75 dd                	jne    d1e <linpack+0x8e>
     d41:	f2 0f 10 25 00 00 00 	movsd  0x0(%rip),%xmm4        # d49 <linpack+0xb9>
     d48:	00 
     d49:	4c 8d bd 80 3e 00 00 	lea    0x3e80(%rbp),%r15
     d50:	48 89 e8             	mov    %rbp,%rax
    x[i] = 1.0;
     d53:	f2 0f 11 20          	movsd  %xmm4,(%rax)
  for ( i = 0; i < N; i++ )
     d57:	48 83 c0 08          	add    $0x8,%rax
     d5b:	4c 39 f8             	cmp    %r15,%rax
     d5e:	75 f3                	jne    d53 <linpack+0xc3>
     d60:	48 8b 04 24          	mov    (%rsp),%rax
     d64:	4c 89 eb             	mov    %r13,%rbx
     d67:	4c 89 e9             	mov    %r13,%rcx
  for ( i = 0; i < N; i++ )
     d6a:	31 ff                	xor    %edi,%edi
     d6c:	48 8d b0 80 86 e8 01 	lea    0x1e88680(%rax),%rsi
    b[i] = 0.0;
     d73:	48 c7 01 00 00 00 00 	movq   $0x0,(%rcx)
    for ( j = 0; j < N; j++ )
     d7a:	48 8d 86 80 79 17 fe 	lea    -0x1e88680(%rsi),%rax
    b[i] = 0.0;
     d81:	48 89 ea             	mov    %rbp,%rdx
     d84:	66 0f 28 cb          	movapd %xmm3,%xmm1
     d88:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     d8f:	00 
      b[i] = b[i] + a[i+j*LDA] * x[j];
     d90:	f2 0f 10 00          	movsd  (%rax),%xmm0
     d94:	f2 0f 59 02          	mulsd  (%rdx),%xmm0
    for ( j = 0; j < N; j++ )
     d98:	48 05 88 3e 00 00    	add    $0x3e88,%rax
     d9e:	48 83 c2 08          	add    $0x8,%rdx
      b[i] = b[i] + a[i+j*LDA] * x[j];
     da2:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
     da6:	f2 0f 11 09          	movsd  %xmm1,(%rcx)
    for ( j = 0; j < N; j++ )
     daa:	48 39 f0             	cmp    %rsi,%rax
     dad:	75 e1                	jne    d90 <linpack+0x100>
  for ( i = 0; i < N; i++ )
     daf:	83 c7 01             	add    $0x1,%edi
     db2:	48 83 c1 08          	add    $0x8,%rcx
     db6:	48 8d 70 08          	lea    0x8(%rax),%rsi
     dba:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
     dc0:	75 b1                	jne    d73 <linpack+0xe3>
     dc2:	f2 0f 11 54 24 10    	movsd  %xmm2,0x10(%rsp)
  __builtin_ia32_clui ();
     dc8:	f3 0f 01 ee          	clui   
  value = ( double ) clock ( ) 
     dcc:	e8 00 00 00 00       	call   dd1 <linpack+0x141>
  __builtin_ia32_stui ();
     dd1:	f3 0f 01 ef          	stui   
  info = dgefa ( a, LDA, N, ipvt );
     dd5:	ba d0 07 00 00       	mov    $0x7d0,%edx
     dda:	be d1 07 00 00       	mov    $0x7d1,%esi
     ddf:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
     de4:	48 8b 3c 24          	mov    (%rsp),%rdi
     de8:	e8 00 00 00 00       	call   ded <linpack+0x15d>
  __builtin_ia32_clui ();
     ded:	f3 0f 01 ee          	clui   
  if ( info != 0 )
     df1:	f2 0f 10 54 24 10    	movsd  0x10(%rsp),%xmm2
     df7:	85 c0                	test   %eax,%eax
     df9:	0f 85 1b 02 00 00    	jne    101a <linpack+0x38a>
     dff:	f2 0f 11 54 24 10    	movsd  %xmm2,0x10(%rsp)
  __builtin_ia32_stui ();
     e05:	f3 0f 01 ef          	stui   
  __builtin_ia32_clui ();
     e09:	f3 0f 01 ee          	clui   
  value = ( double ) clock ( ) 
     e0d:	e8 00 00 00 00       	call   e12 <linpack+0x182>
  __builtin_ia32_stui ();
     e12:	f3 0f 01 ef          	stui   
  __builtin_ia32_clui ();
     e16:	f3 0f 01 ee          	clui   
     e1a:	e8 00 00 00 00       	call   e1f <linpack+0x18f>
  __builtin_ia32_stui ();
     e1f:	f3 0f 01 ef          	stui   
  dgesl ( a, LDA, N, ipvt, b, job );
     e23:	45 31 c9             	xor    %r9d,%r9d
     e26:	ba d0 07 00 00       	mov    $0x7d0,%edx
     e2b:	be d1 07 00 00       	mov    $0x7d1,%esi
     e30:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
     e35:	48 8b 3c 24          	mov    (%rsp),%rdi
     e39:	4d 89 e8             	mov    %r13,%r8
     e3c:	e8 00 00 00 00       	call   e41 <linpack+0x1b1>
  __builtin_ia32_clui ();
     e41:	f3 0f 01 ee          	clui   
  value = ( double ) clock ( ) 
     e45:	e8 00 00 00 00       	call   e4a <linpack+0x1ba>
  __builtin_ia32_stui ();
     e4a:	f3 0f 01 ef          	stui   
  __builtin_ia32_clui ();
     e4e:	f3 0f 01 ee          	clui   
  free ( a );
     e52:	48 8b 3c 24          	mov    (%rsp),%rdi
     e56:	e8 00 00 00 00       	call   e5b <linpack+0x1cb>
  __builtin_ia32_stui ();
     e5b:	f3 0f 01 ef          	stui   
  a = r8mat_gen ( LDA, N );
     e5f:	bf d1 07 00 00       	mov    $0x7d1,%edi
     e64:	be d0 07 00 00       	mov    $0x7d0,%esi
     e69:	e8 00 00 00 00       	call   e6e <linpack+0x1de>
     e6e:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # e75 <linpack+0x1e5>
     e75:	f2 0f 10 54 24 10    	movsd  0x10(%rsp),%xmm2
     e7b:	66 0f ef db          	pxor   %xmm3,%xmm3
     e7f:	48 89 c7             	mov    %rax,%rdi
     e82:	48 89 e8             	mov    %rbp,%rax
     e85:	66 48 0f 6e e1       	movq   %rcx,%xmm4
    x[i] = 1.0;
     e8a:	f2 0f 11 20          	movsd  %xmm4,(%rax)
  for ( i = 0; i < N; i++ )
     e8e:	48 83 c0 08          	add    $0x8,%rax
     e92:	4c 39 f8             	cmp    %r15,%rax
     e95:	75 f3                	jne    e8a <linpack+0x1fa>
     e97:	48 8d 8f 80 86 e8 01 	lea    0x1e88680(%rdi),%rcx
     e9e:	45 31 c9             	xor    %r9d,%r9d
     ea1:	48 89 ce             	mov    %rcx,%rsi
    for ( j = 0; j < N; j++ )
     ea4:	48 8d 86 80 79 17 fe 	lea    -0x1e88680(%rsi),%rax
  for ( i = 0; i < N; i++ )
     eab:	48 89 ea             	mov    %rbp,%rdx
     eae:	66 0f 28 cb          	movapd %xmm3,%xmm1
     eb2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
      rhs[i] = rhs[i] + a[i+j*LDA] * x[j];
     eb8:	f2 0f 10 00          	movsd  (%rax),%xmm0
     ebc:	f2 0f 59 02          	mulsd  (%rdx),%xmm0
    for ( j = 0; j < N; j++ )
     ec0:	48 05 88 3e 00 00    	add    $0x3e88,%rax
     ec6:	48 83 c2 08          	add    $0x8,%rdx
      rhs[i] = rhs[i] + a[i+j*LDA] * x[j];
     eca:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
    for ( j = 0; j < N; j++ )
     ece:	48 39 c6             	cmp    %rax,%rsi
     ed1:	75 e5                	jne    eb8 <linpack+0x228>
     ed3:	f2 43 0f 11 0c cc    	movsd  %xmm1,(%r12,%r9,8)
  for ( i = 0; i < N; i++ )
     ed9:	49 83 c1 01          	add    $0x1,%r9
     edd:	48 83 c6 08          	add    $0x8,%rsi
     ee1:	49 81 f9 d0 07 00 00 	cmp    $0x7d0,%r9
     ee8:	75 ba                	jne    ea4 <linpack+0x214>
     eea:	f3 0f 7e 2d 00 00 00 	movq   0x0(%rip),%xmm5        # ef2 <linpack+0x262>
     ef1:	00 
     ef2:	31 f6                	xor    %esi,%esi
    resid[i] = -rhs[i];
     ef4:	f2 41 0f 10 0c f4    	movsd  (%r12,%rsi,8),%xmm1
     efa:	48 8d 81 80 79 17 fe 	lea    -0x1e88680(%rcx),%rax
     f01:	4c 89 ea             	mov    %r13,%rdx
     f04:	66 0f 57 cd          	xorpd  %xmm5,%xmm1
    for ( j = 0; j < N; j++ )
     f08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     f0f:	00 
      resid[i] = resid[i] + a[i+j*LDA] * b[j];
     f10:	f2 0f 10 00          	movsd  (%rax),%xmm0
     f14:	f2 0f 59 02          	mulsd  (%rdx),%xmm0
    for ( j = 0; j < N; j++ )
     f18:	48 05 88 3e 00 00    	add    $0x3e88,%rax
     f1e:	48 83 c2 08          	add    $0x8,%rdx
      resid[i] = resid[i] + a[i+j*LDA] * b[j];
     f22:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
    for ( j = 0; j < N; j++ )
     f26:	48 39 c1             	cmp    %rax,%rcx
     f29:	75 e5                	jne    f10 <linpack+0x280>
     f2b:	f2 41 0f 11 0c f6    	movsd  %xmm1,(%r14,%rsi,8)
  for ( i = 0; i < N; i++ )
     f31:	48 83 c6 01          	add    $0x1,%rsi
     f35:	48 83 c1 08          	add    $0x8,%rcx
     f39:	48 81 fe d0 07 00 00 	cmp    $0x7d0,%rsi
     f40:	75 b2                	jne    ef4 <linpack+0x264>
     f42:	4c 89 f0             	mov    %r14,%rax
     f45:	49 8d 96 80 3e 00 00 	lea    0x3e80(%r14),%rdx
  resid_max = 0.0;
     f4c:	66 0f 28 cb          	movapd %xmm3,%xmm1
    resid_max = r8_max ( resid_max, r8_abs ( resid[i] ) );
     f50:	f2 0f 10 00          	movsd  (%rax),%xmm0
  if ( 0.0 <= x )
     f54:	66 0f 2f c3          	comisd %xmm3,%xmm0
     f58:	73 04                	jae    f5e <linpack+0x2ce>
    value = -x;
     f5a:	66 0f 57 c5          	xorpd  %xmm5,%xmm0
  for ( i = 0; i < N; i++ )
     f5e:	48 83 c0 08          	add    $0x8,%rax
    value = y;
     f62:	f2 0f 5f c8          	maxsd  %xmm0,%xmm1
  for ( i = 0; i < N; i++ )
     f66:	48 39 c2             	cmp    %rax,%rdx
     f69:	75 e5                	jne    f50 <linpack+0x2c0>
     f6b:	49 8d 85 80 3e 00 00 	lea    0x3e80(%r13),%rax
  b_max = 0.0;
     f72:	66 0f 28 e3          	movapd %xmm3,%xmm4
    b_max = r8_max ( b_max, r8_abs ( b[i] ) );
     f76:	f2 0f 10 03          	movsd  (%rbx),%xmm0
  if ( 0.0 <= x )
     f7a:	66 0f 2f c3          	comisd %xmm3,%xmm0
     f7e:	73 04                	jae    f84 <linpack+0x2f4>
    value = -x;
     f80:	66 0f 57 c5          	xorpd  %xmm5,%xmm0
  for ( i = 0; i < N; i++ )
     f84:	48 83 c3 08          	add    $0x8,%rbx
    value = y;
     f88:	f2 0f 5f e0          	maxsd  %xmm0,%xmm4
  for ( i = 0; i < N; i++ )
     f8c:	48 39 d8             	cmp    %rbx,%rax
     f8f:	75 e5                	jne    f76 <linpack+0x2e6>
     f91:	f2 0f 11 64 24 18    	movsd  %xmm4,0x18(%rsp)
     f97:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
     f9d:	f2 0f 11 14 24       	movsd  %xmm2,(%rsp)
  __builtin_ia32_clui ();
     fa2:	f3 0f 01 ee          	clui   
  free ( a );
     fa6:	e8 00 00 00 00       	call   fab <linpack+0x31b>
  free ( b );
     fab:	4c 89 ef             	mov    %r13,%rdi
     fae:	e8 00 00 00 00       	call   fb3 <linpack+0x323>
  free ( ipvt );
     fb3:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
     fb8:	e8 00 00 00 00       	call   fbd <linpack+0x32d>
  free ( resid );
     fbd:	4c 89 f7             	mov    %r14,%rdi
     fc0:	e8 00 00 00 00       	call   fc5 <linpack+0x335>
  free ( rhs );
     fc5:	4c 89 e7             	mov    %r12,%rdi
     fc8:	e8 00 00 00 00       	call   fcd <linpack+0x33d>
  free ( x );
     fcd:	48 89 ef             	mov    %rbp,%rdi
     fd0:	e8 00 00 00 00       	call   fd5 <linpack+0x345>
  __builtin_ia32_stui ();
     fd5:	f3 0f 01 ef          	stui   
  residn = resid_max / ( double ) N / a_max / b_max / eps;
     fd9:	f2 0f 10 14 24       	movsd  (%rsp),%xmm2
     fde:	f2 0f 10 4c 24 10    	movsd  0x10(%rsp),%xmm1
     fe4:	f2 0f 5e 0d 00 00 00 	divsd  0x0(%rip),%xmm1        # fec <linpack+0x35c>
     feb:	00 
     fec:	66 0f 28 c1          	movapd %xmm1,%xmm0
     ff0:	f2 0f 10 64 24 18    	movsd  0x18(%rsp),%xmm4
     ff6:	f2 0f 5e c2          	divsd  %xmm2,%xmm0
     ffa:	f2 0f 5e c4          	divsd  %xmm4,%xmm0
     ffe:	f2 0f 59 05 00 00 00 	mulsd  0x0(%rip),%xmm0        # 1006 <linpack+0x376>
    1005:	00 
}
    1006:	48 83 c4 28          	add    $0x28,%rsp
    100a:	5b                   	pop    %rbx
    100b:	5d                   	pop    %rbp
    100c:	41 5c                	pop    %r12
    100e:	41 5d                	pop    %r13
    1010:	41 5e                	pop    %r14
    1012:	41 5f                	pop    %r15
  return (long long)residn;
    1014:	f2 48 0f 2c c0       	cvttsd2si %xmm0,%rax
}
    1019:	c3                   	ret    
}

__fortify_function int
printf (const char *__restrict __fmt, ...)
{
  return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
    101a:	bf 0a 00 00 00       	mov    $0xa,%edi
    101f:	e8 00 00 00 00       	call   1024 <linpack+0x394>
    1024:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 102b <linpack+0x39b>
    102b:	e8 00 00 00 00       	call   1030 <linpack+0x3a0>
    1030:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 1037 <linpack+0x3a7>
    1037:	e8 00 00 00 00       	call   103c <linpack+0x3ac>
    103c:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 1043 <linpack+0x3b3>
    1043:	e8 00 00 00 00       	call   1048 <linpack+0x3b8>
    exit(-1);
    1048:	83 cf ff             	or     $0xffffffff,%edi
    104b:	e8 00 00 00 00       	call   1050 <timestamp>

0000000000001050 <timestamp>:

  Parameters:

    None
*/
{
    1050:	f3 0f 1e fa          	endbr64 
    1054:	48 83 ec 18          	sub    $0x18,%rsp
  static char time_buffer[TIME_SIZE];
  const struct tm *tm;
  size_t len;
  time_t now;

  now = time ( NULL );
    1058:	31 ff                	xor    %edi,%edi
{
    105a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1061:	00 00 
    1063:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1068:	31 c0                	xor    %eax,%eax
  now = time ( NULL );
    106a:	e8 00 00 00 00       	call   106f <timestamp+0x1f>
  tm = localtime ( &now );
    106f:	48 89 e7             	mov    %rsp,%rdi
  now = time ( NULL );
    1072:	48 89 04 24          	mov    %rax,(%rsp)
  tm = localtime ( &now );
    1076:	e8 00 00 00 00       	call   107b <timestamp+0x2b>

  len = strftime ( time_buffer, TIME_SIZE, "%d %B %Y %I:%M:%S %p", tm );
    107b:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 1082 <timestamp+0x32>
    1082:	be 28 00 00 00       	mov    $0x28,%esi
    1087:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 108e <timestamp+0x3e>
  tm = localtime ( &now );
    108e:	48 89 c1             	mov    %rax,%rcx
  len = strftime ( time_buffer, TIME_SIZE, "%d %B %Y %I:%M:%S %p", tm );
    1091:	e8 00 00 00 00       	call   1096 <timestamp+0x46>

  // printf ( "%s\n", time_buffer );

  return;
# undef TIME_SIZE
}
    1096:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    109b:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    10a2:	00 00 
    10a4:	75 05                	jne    10ab <timestamp+0x5b>
    10a6:	48 83 c4 18          	add    $0x18,%rsp
    10aa:	c3                   	ret    
    10ab:	e8 00 00 00 00       	call   10b0 <timestamp+0x60>
