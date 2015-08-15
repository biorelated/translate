module fasta;

import std.file;
import std.exception;
import std.algorithm;
import std.string;

immutable int[dchar] dnaEncoding;

static this(){
  dnaEncoding = ['A':0,'C':1,'G': 2,'T':3];
}

struct FastaRecord {
  string header;
  string sequence;

  size_t size(){
    return sequence.length;
  }
}

int toBinary(dchar c){
  return (c in dnaEncoding) ? dnaEncoding[c] : 5;
}

auto seq2Binary(string seq){
  return seq.dup.map!(c=>toBinary(c));
}

auto fastaRecords(string filename) {
  static auto toFastaRecord(S)(S str) {
    auto res = findSplit(str, "\n");
    auto header = res[0];
    auto seq = res[2];
    return FastaRecord(header, removechars(seq, "\n"));
  }

  string text = cast(string)std.file.read(filename);

  enforce(text.length > 0 && text[0] == '>');
  text = text[1 .. $];

  auto records = splitter(text, '>');
  return map!toFastaRecord(records);
}
