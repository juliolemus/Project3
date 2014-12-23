BISON	= bison -d -v
FLEX		= flex
CC		= gcc
CXX		= g++
TARGET	= lang

all: $(TARGET)

$(TARGET): parser.o lexer.o main.o
	$(CXX) -o $(TARGET) parser.o lexer.o main.o

lexer.o: lexer.l
	$(FLEX) -o lexer.cpp lexer.l
	$(CXX) -c -o lexer.o lexer.cpp

parser.o: parser.y
	$(BISON) -o parser.cpp parser.y
	$(CXX) -c -o parser.o parser.cpp

main.o: main.cpp
	$(CXX) -c -o main.o main.cpp

.PHONY: clean
clean:
	rm -f *.o lexer.cpp parser.cpp parser.hpp parser.output $(TARGET)

.PHONY: run
run: $(TARGET)
	./$(TARGET) < tests/goodtest1.lang
	./$(TARGET) < tests/goodtest2.lang
	./$(TARGET) < tests/goodtest3.lang
	./$(TARGET) < tests/goodtest4.lang
	./$(TARGET) < tests/goodtest5.lang
	./$(TARGET) < tests/goodtest6.lang
	./$(TARGET) < tests/goodtest7.lang
	./$(TARGET) < tests/goodtest8.lang
	./$(TARGET) < tests/goodtest9.lang
	./$(TARGET) < tests/goodtest10.lang
	./$(TARGET) < tests/goodtest11.lang
	./$(TARGET) < tests/goodtest12.lang
	./$(TARGET) < tests/goodtest13.lang
	./$(TARGET) < tests/goodtest14.lang
	./$(TARGET) < tests/goodtest15.lang
	./$(TARGET) < tests/goodtest16.lang
	./$(TARGET) < tests/goodtest17.lang
	./$(TARGET) < tests/goodtest18.lang
	./$(TARGET) < tests/goodtest19.lang
	./$(TARGET) < tests/goodtest20.lang
	./$(TARGET) < tests/goodtest21.lang
	./$(TARGET) < tests/goodtest22.lang
	./$(TARGET) < tests/goodtest23.lang
	./$(TARGET) < tests/goodtest24.lang
	./$(TARGET) < tests/goodtest25.lang
	./$(TARGET) < tests/goodtest26.lang
	./$(TARGET) < tests/goodtest27.lang
	./$(TARGET) < tests/goodtest28.lang
	./$(TARGET) < tests/goodtest29.lang
	./$(TARGET) < tests/goodtest30.lang
	./$(TARGET) < tests/goodtest31.lang
	./$(TARGET) < tests/goodtest32.lang
	./$(TARGET) < tests/goodtest33.lang
	./$(TARGET) < tests/goodtest34.lang
	./$(TARGET) < tests/badtest35.lang
	./$(TARGET) < tests/badtest36.lang
	./$(TARGET) < tests/badtest37.lang
	./$(TARGET) < tests/badtest38.lang
	./$(TARGET) < tests/badtest39.lang
	./$(TARGET) < tests/badtest40.lang
	./$(TARGET) < tests/badtest41.lang
	./$(TARGET) < tests/badtest42.lang
	./$(TARGET) < tests/badtest43.lang
	./$(TARGET) < tests/badtest44.lang
	./$(TARGET) < tests/badtest45.lang
	./$(TARGET) < tests/badtest46.lang
	./$(TARGET) < tests/badtest47.lang
	./$(TARGET) < tests/badtest48.lang
	./$(TARGET) < tests/badtest49.lang
	./$(TARGET) < tests/badtest50.lang