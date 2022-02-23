set verbose off

break *0x0000000000401017
commands
	set $rdx=$rsi
	set $rsi=0x402000
	set $rdi=1
  continue
end
run
quit
