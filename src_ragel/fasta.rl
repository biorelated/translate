module fasta;

%%{
  machine fasta;

  newline = '\r'? '\n';
  hspace = [ \t\v];
  whitespace = space | newline;
  identifier = (any - space)+;
  description = ((any - hspace) [^\r\n]*);
  letters = (any - space - '>')+;
  sequence = whitespace* letters? (whitespace+ letters)*;
  fasta_entry = '>' identifier (hspace+ description)? newline sequence whitespace*;
  main := whitespace* (fasta_entry)*;
      write data;
}%%

#import std.conv;

struct FastaRecord{
  string header;
  string sequence;
}

FastaRecord parseFastaRecord(string str){
  char* p = cast(char*)str.ptr;
}
