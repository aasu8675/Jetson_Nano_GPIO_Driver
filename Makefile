# Set cross-compiler and architecture
ARCH ?= arm64
CROSS_COMPILE ?= aarch64-oe4t-linux-

# Example makefile for kernel module

# Comment/uncomment the following line to disable/enable debugging
# DEBUG = y

ifneq ($(KERNELRELEASE),)
# Call from kernel build system
obj-m := aesdgpio.o
aesdgpio-y := driver.o
else

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) modules

endif

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions

