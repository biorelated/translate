module translate;

import codontable;
import std.string;
import std.conv;
import std.algorithm;
import std.range : chunks;
import std.encoding : AsciiString;

//casts a string to ascii literals
AsciiString ascii(string literal){
  return cast(AsciiString) literal;
}

//split a string into an array of codons
auto to_codons(string seq){
  return ascii(seq).chunks(3).map!(x => cast(string) x);
}

//given a codon return the amino acid equivalent of the codon
int codon2aa(string codon){
  return (codon in standard) ? standard[codon] : 'X';
}

//given a sequence string, translate it to a string of amino acids
auto translate_seq(string seq){
  return to_codons(seq).map!(c => codon2aa(c)).map!(x => cast(char) x );
}
