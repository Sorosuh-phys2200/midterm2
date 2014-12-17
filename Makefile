GRAPH = gnuplot

CC = clang
CFLAGS = -Wall -O0 -g
LFLAGS = -O0 -g
LIBS = -lgsl -lm

all: part1.png part2.png
part1: part1.o white-dwarf-eqs.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)
	
res-part1: part1
	./part1 > res-part1
	
part1.png: part1.gpl res-part1
	$(GRAPH) part1.gpl
	

part2: part2.o white-dwarf-eqs.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)

res-part2: part2
	./part2 > res-part2

part2.png: part2.gpl res-part2
	$(GRAPH) part2.gpl

clean :
	rm -f *~
	rm -f *.o
	rm -f part1 part2

veryclean : clean
	rm -f part1-res part1.png part2-res part2.png
