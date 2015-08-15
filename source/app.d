import std.getopt;
import std.file;
import std.parallelism;
import std.stdio;
import fasta;
import translate;

void print_aa(FastaRecord seq){
  writeln(">", seq.header,"\n",translate_seq(seq.sequence));
}

void translate_file(string infile){
  auto seqs = fastaRecords(infile);
  foreach(FastaRecord rec; seqs.parallel){
    print_aa(rec);
  }
}

void main(string[] args){
  string inputfile;
  string outputfile;

  auto helpfile = getopt(args,
      "inputfile|i","INPUT FILE", &inputfile,
      "output|o", "OUTPUT FILE", &outputfile
      );

  /* if (helpInfo.helpWanted){ */
  /* defaultGetoptPrinter("A program to translate DNA to Protein",helpInfo.options); }*/

  if(exists(inputfile)) {
    translate_file(inputfile);
  }else{
    writeln("Missing argument -i <INPUT FILE>");
  }
}
