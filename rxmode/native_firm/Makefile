#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------

ifeq ($(strip $(DEVKITARM)),)
$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

include $(DEVKITARM)/base_rules

TARGET 		:=  patch.bin
BUILD		:=	build
SOURCE		:=	source
TOOLS		:=	../../tools
LD		:=	arm-none-eabi-ld

.PHONY: clean all

all: $(BUILD) arm9payload.bin patch.bin

$(BUILD):
	@[ -d $@ ] || mkdir -p $@
	
arm9payload.bin:
	@cd source/arm9 && make
	
patch.bin: $(BUILD)/0801b564.bin $(BUILD)/0807882c.bin $(BUILD)/0807886c.bin	\
	$(BUILD)/080282f8.bin $(BUILD)/08086140.bin $(BUILD)/08086174.bin	\
	$(BUILD)/080859ec.bin $(BUILD)/08094454.bin	\
	$(BUILD)/0805d63c.bin $(BUILD)/080632b8.bin
	@$(TOOLS)/cfwtool $(BUILD) $(TARGET) n

$(BUILD)/%.bin: $(BUILD)/%.elf
	$(OBJCOPY) -O binary $< $@

$(BUILD)/%.elf: $(BUILD)/%.o
	$(LD) -e 0 -Ttext $(<:$(BUILD)/%.o=0x%) $< -o $@

$(BUILD)/0801b564.o: $(SOURCE)/k9_fix_flags.s $(BUILD)
	$(AS) $< -o $@

$(BUILD)/0807882c.o: $(SOURCE)/p9_emunand_hook_1.s $(BUILD)
	$(AS) $< -o $@

$(BUILD)/0807886c.o: $(SOURCE)/p9_emunand_hook_2.s $(BUILD)
	$(AS) $< -o $@

$(BUILD)/080282f8.o: $(SOURCE)/p9_keyx_spoof.s $(BUILD)
	$(AS) $< -o $@

$(BUILD)/08086140.o: $(SOURCE)/p9_mythread_hook_1.s $(BUILD)
	$(AS) $< -o $@

$(BUILD)/08086174.o: $(SOURCE)/p9_mythread_hook_2.s $(BUILD)
	$(AS) $< -o $@

$(BUILD)/080859ec.o: $(SOURCE)/p9_reboothax_1.s $(BUILD)
	$(AS) $< -o $@

$(BUILD)/08094454.o: $(SOURCE)/p9_reboothax_2.s $(BUILD)
	$(AS) $< -o $@

$(BUILD)/0805d63c.o: $(SOURCE)/p9_signatures_spoof_1.s $(BUILD)
	$(AS) $< -o $@

$(BUILD)/080632b8.o: $(SOURCE)/p9_signatures_spoof_2.s $(BUILD)
	$(AS) $< -o $@
#---------------------------------------------------------------------------------
clean:
	@echo clean ...
	@rm -fr $(BUILD) $(TARGET) *.bin
 
