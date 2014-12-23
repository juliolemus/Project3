#include "parser.hpp"

extern int yydebug;
extern int yyparse();

int main(void) {
    yydebug = 0; // Set this to 1 if you want the parser to output debug information and parse process

    yyparse();  

    return 0;
}
