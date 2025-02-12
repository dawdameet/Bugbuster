start: boot.asm
	nasm -f bin boot.asm -o boot.bin                
	nasm -f bin kernel.asm -o kernel.bin
	qemu-system-x86_64 -drive format=raw,file=os.bin
	