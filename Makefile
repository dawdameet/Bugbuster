ASM := nasm
EMU := qemu-system-x86_64

KERNEL := kernel.bin
ASM_SRC := kernel.asm

all: $(KERNEL)
	@echo "Build complete!"

$(KERNEL): $(ASM_SRC)
	$(ASM) -f bin $(ASM_SRC) -o $(KERNEL)
	@echo "Kernel compiled successfully."

run: $(KERNEL)
	$(EMU) -drive format=raw,file=$(KERNEL)

clean:
	rm -f $(KERNEL)
	@echo "Cleaned up build files."
