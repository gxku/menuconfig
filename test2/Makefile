obj =test2.o

all:$(obj)
	$(foreach aa,$(obj),gcc $(CFLAGS) $(aa:.o=.c) -o $(aa:.o=);mv $(aa:.o=) $(SRC_ROOT)/bin/)

clean:
	-rm *.o
