PHONY += menuconfig silentoldconfig clean distclean

Q            := @
obj          := $(CURDIR)/kconfig
SUBDIR       := kconfig
Kconfig      := Kconfig
#rm-clean     += test
SRC_DIRS     += test
SRC_DIRS     += test2
rm-distclean += include/config  include/generated .config bin/*

export SRC_ROOT := $(shell pwd)
export CFLAGS += -I$(SRC_ROOT)/include/



ifeq ($(quiet),silent_)
silent := -s
endif

ALL:$(SRC_DIRS)
	$(foreach  dir,$(SRC_DIRS),$(MAKE)  -C $(dir);)
#test:test.c
#	gcc $(CFLAGS) $< -o $@

menuconfig : $(obj)/mconf $(obj)/conf
	$(Q)$< $(Kconfig)
	$(Q)$(MAKE) silentoldconfig

$(obj)/mconf:
	$(Q)$(MAKE) -C $(SUBDIR)

silentoldconfig: $(obj)/conf
	$(Q)mkdir -p include/generated include/config
	$(Q)$< -s --silentoldconfig $(Kconfig)

clean:
	$(foreach  dir,$(SRC_DIRS),make -C $(dir)  clean;)

distclean:clean
	rm -rf  $(rm-distclean)

.PHONY : ALL
