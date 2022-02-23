long f(short a, int b, long c){
	short n = a;
	int r = 1;
	
	for(int i=0; i<n;i++){
		r*= b;
	}
	
	if (result > 0){
		return (result & 31) + c;
	} else {
		return ((result+31) & 31) - 31 + c;
	}
}


/*

eax= a
edx = b
ecx = c


eax=0


0x8049e1a <oblicz>      endbr32                                                                                                                                                                       │
│   0x8049e1e <oblicz+4>    push   ebp                                                                                                                                                                    │
│   0x8049e1f <oblicz+5>    mov    ebp,esp                                                                                                                                                                │
│   0x8049e21 <oblicz+7>    sub    esp,0x14                                                                                                                                                               │
│   0x8049e24 <oblicz+10>   call   0x8049e7a <__x86.get_pc_thunk.ax>                                                                                                                                      │
│   0x8049e29 <oblicz+15>   add    eax,0xb91d7                                                                                                                                                            │
│   0x8049e2e <oblicz+20>   mov    eax,DWORD PTR [ebp+0x8]  			mov eax, a                                                                                                                                              │
│   0x8049e31 <oblicz+23>   mov    WORD PTR [ebp-0x14],ax               PTR [ebp-0x14] = a                                                                                                                                  │
│   0x8049e35 <oblicz+27>   mov    DWORD PTR [ebp-0x4],0x1              PTR [ebp-0x4] = 1                                                                                                                                  │
│   0x8049e3c <oblicz+34>   mov    WORD PTR [ebp-0x6],0x0               PTR [ebp-0x6] = 0                                                                                                                                 │
│   0x8049e42 <oblicz+40>   jmp    0x8049e59 <oblicz+63>                
                                                                                                                                  │
│   0x8049e44 <oblicz+42>   mov    eax,DWORD PTR [ebp-0x4]				eax = 1                                                                                                                                                │
│   0x8049e47 <oblicz+45>   imul   eax,DWORD PTR [ebp+0xc]              eax *=   DWORD PTR [ebp-0xc] mnozy pez b                                                                                                                               │
│   0x8049e4b <oblicz+49>   mov    DWORD PTR [ebp-0x4],eax				DWORD PTR [ebp-0x4] = eax = 1*b
0x8049e4e <oblicz+52>   movzx  eax,WORD PTR [ebp-0x6]                   eax = 0                                                                                                                              │
│   0x8049e52 <oblicz+56>   add    eax,0x1                              eax += 0 czyli eax = 1                                                                                                                                  │
│   0x8049e55 <oblicz+59>   mov    WORD PTR [ebp-0x6],ax 				WORD PTR [ebp-0x6] = ax = 1
                                                                                                                                                 │
│   0x8049e59 <oblicz+63>   movzx  eax,WORD PTR [ebp-0x6]               eax =  DWORD PTR [ebp-0x6] = 0                                                                                                                                  │
│   0x8049e5d <oblicz+67>   cmp    ax,WORD PTR [ebp-0x14]               ax ? a(1)                                                                                                                                  │
│   0x8049e61 <oblicz+71>   jl     0x8049e44 <oblicz+42>                if (ax<a) jmp 42  
                                                                                                                               │
│   0x8049e63 <oblicz+73>   mov    eax,DWORD PTR [ebp-0x4]              eax =  DWORD PTR [ebp-0x4] = 1*b = 2                                                                                                                                │
│   0x8049e66 <oblicz+76>   cdq                                         The CDQ (Convert Doubleword to Quadword) instruction extends the sign bit of EAX into the EDX register.  	edx = 0 dla dodatn eax else 1                                                                                                                                │
│   0x8049e67 <oblicz+77>   shr    edx,0x1b 							przesuwa wszystkie bity A w prawo o ilość bitów zdefiniowaną przez B(o 16+11=27) czyli 32bity-27 bitow = 5 bitow =>2^5-1 = 31 dla ujemnej
│   0x8049e6a <oblicz+80>                   add    eax,edx              eax+=edx		2+= 0 => 2                                                                                                                                 │
│   0x8049e6c <oblicz+82>                   and    eax,0x1f             eax & (16+15=31)  =>2&31                                                                                                                                  │
│   0x8049e6f <oblicz+85>                   sub    eax,edx              eax-=edx   => 2-=0  = 2                                                                                                                                  │
│   0x8049e71 <oblicz+87>                   mov    edx,eax              			edx=eax=2                                                                                                                                  │
│   0x8049e73 <oblicz+89>                   mov    eax,DWORD PTR [ebp+0x10] 		eax =  DWORD PTR [ebp+0x10] = c                                                                                                                            │
│   0x8049e76 <oblicz+92>                   add    eax,edx                          eax+=edx   => c+=2   => 3+=2=5                                                                                                                   │
│   0x8049e78 <oblicz+94>                   leave                                                                                                                                                         │
│   0x8049e79 <oblicz+95> */                   
