EXTRA_CFLAGS += -g


ifneq ($(KERNELRELEASE),)
# call from kernel build system
obj-m	:= driver.o

else

modules:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

endif

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions

