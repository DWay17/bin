#!/usr/bin/env python3
import csv
import pprint
import sys
import pandas as pd

def	process_file(file, col):
    print(f"Processing file: {file}")
    dialect = csv.Sniffer().sniff(open(file).read(8*1024))
    # print dialect to debug (main fields nl, sep, quotechar)
    print(f"Dialect: ", end='')
    # use \x notaion for \n in dialect to debug without newlines    
    print(f"  newline: {repr(dialect.lineterminator)}", end='')
    print(f"  delimiter: {repr(dialect.delimiter)}", end='')  
    print(f"  quotechar: {repr(dialect.quotechar)}")
    data = pd.read_csv(file, dialect=dialect)
    # print metadata
    print(f"Columns: {data.columns}")
    # use same col order for agg
    agg = pd.DataFrame(columns=data.columns)
	# group by col concat other uniq fields
    # agg = data.groupby(col).agg(lambda x: ' + '.join(set(x))).reset_index()
    agg = data.groupby(col).agg(lambda x: ' + '.join(map(str, set(x)))).reset_index()
    # use same col order for agg
    agg = agg[data.columns]
    # write to file with \t and \n
    agg.to_csv(f"{file}-agg-{col}.tsv", index=False, sep='\t')

def main():
    # use files given by command line parameter
    if len(sys.argv) == 3:
        file = sys.argv[1]
        col = sys.argv[2]
        process_file(file, col)
    else:
        print("Usage: python script.py <file> <column>")

if __name__ == "__main__":
    main()
