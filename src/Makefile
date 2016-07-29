-include $(SRC_ROOT)/include/config/auto.conf
obj-$(CONFIG_TEST)     += test
obj-$(CONFIG_TEST2)	+= test2

ALL:
	$(foreach  dir,$(obj-y),make -C $(dir);)


clean:
	$(foreach  dir,$(obj-y),make -C $(dir) clean;)
	$(foreach  dir,$(obj-),make -C $(dir) clean;)


.PHONY : ALL clean  distclean
