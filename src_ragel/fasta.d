
#line 1 "fasta.rl"
module fasta;


#line 7 "fasta.d"
static const byte[] _fasta_key_offsets = [
	0, 0, 3, 9, 12, 14, 15, 19
];

static const char[] _fasta_trans_keys = [
	32u, 9u, 13u, 10u, 12u, 13u, 32u, 9u, 
	11u, 9u, 11u, 32u, 10u, 13u, 10u, 32u, 
	62u, 9u, 13u, 62u, 0
];

static const byte[] _fasta_single_lengths = [
	0, 1, 4, 3, 2, 1, 2, 1
];

static const byte[] _fasta_range_lengths = [
	0, 1, 1, 0, 0, 0, 1, 0
];

static const byte[] _fasta_index_offsets = [
	0, 0, 3, 9, 13, 16, 18, 22
];

static const byte[] _fasta_trans_targs = [
	0, 0, 2, 7, 0, 5, 3, 3, 
	2, 3, 3, 3, 4, 7, 5, 4, 
	7, 0, 6, 1, 6, 0, 1, 7, 
	0
];

static const int fasta_start = 6;
static const int fasta_first_final = 6;
static const int fasta_error = 0;

static const int fasta_en_main = 6;


#line 16 "fasta.rl"


import std.conv;

struct FastaRecord{
  string header;
  string sequence;
}


FastaRecord parseFastaRecord(string str){
  char* p = cast(char*)str.ptr;
  char* pe
}
