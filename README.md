# tpch_skew_linux

TPC-H with skew factor (Zipf distribution) enabled. Use `dbgen` with `-z` option to input the skew when generating benchmark data. There are several makefile available for different OSs and settings. Try them if the default makefile doesn't work.

The original is the linux version on github. Multiple makefiles have been prepared for multiple distributions including Mac OS.

```sh
make
./dbgen -s 10 -z 3
for i in `ls *.tbl`; do sed 's/|$//' $i > ${i/tbl/csv}; echo $i; done;
```

Create the database in PostgreSQL, then run

```sh
\i setup/setup.sql
```