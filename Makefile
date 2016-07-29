PHONY += menuconfig silentoldconfig clean distclean

Q            := @
obj          := $(CURDIR)/kconfig
SUBDIR       := kconfig
Kconfig      := Kconfig
rm-clean     += test
rm-distclean += include .config

ifeq ($(quiet),silent_)
silent := -s
endif

test:test.c
	gcc $(CFLAGS) $< -o $@

menuconfig : $(obj)/mconf $(obj)/conf
	$(Q)$< $(Kconfig)
	$(Q)$(MAKE) silentoldconfig

$(obj)/mconf:
	$(Q)$(MAKE) -C $(SUBDIR)

silentoldconfig: $(obj)/conf
	$(Q)mkdir -p include/generated include/config
	$(Q)$< -s --silentoldconfig $(Kconfig)

clean:
	rm -rf $(rm-clean)

distclean:
	rm -rf $(rm-clean) $(rm-distclean)


