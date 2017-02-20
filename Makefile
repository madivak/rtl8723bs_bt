CC ?=
PREFIX ?=

rtk_hciattach:hciattach.c hciattach_rtk.o  
	$(CC) -o rtk_hciattach hciattach.c hciattach_rtk.o  

hciattach_rtk.o:hciattach_rtk.c
	$(CC) -c hciattach_rtk.c

clean:
	rm -f *.o  rtk_hciattach

install:
	mkdir -p $(PREFIX)/lib/firmware/rtl_bt
	cp -p rtlbt_* $(PREFIX)/lib/firmware/rtl_bt/.
	cp -p rtk_hciattach $(PREFIX)/sbin/
