PHONY += menuconfig silentoldconfig clean distclean

Q            := @
obj          := $(CURDIR)/kconfig
SUBDIR       := kconfig
Kconfig      := Kconfig
SRC_DIR     += src
rm-distclean += include .config bin

export SRC_ROOT := $(shell pwd)
export CFLAGS += -I$(SRC_ROOT)/include/



ifeq ($(quiet),silent_)
silent := -s
endif

ALL:
	$(foreach  dir,$(SRC_DIR),make -C $(dir);)

menuconfig : $(obj)/mconf $(obj)/conf
	$(Q)$< $(Kconfig)
	$(Q)$(MAKE) silentoldconfig

$(obj)/mconf:
	$(Q)$(MAKE) -C $(SUBDIR)

silentoldconfig: $(obj)/conf
	$(Q)mkdir -p include/generated include/config bin
	$(Q)$< -s --silentoldconfig $(Kconfig)

clean:
	$(foreach  dir,$(SRC_DIR),make -C $(dir) clean;)
	-rm -rf bin/*
distclean:clean
	-rm -rf  $(rm-distclean)
	$(MAKE)  -C kconfig clean

.PHONY : ALL
