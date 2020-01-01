# Read from the file file.txt and print its transposed content to stdout.
awk '{for(i=0;++i<=NF;)a[i]=a[i]?a[i] FS $i:$i}END{for(i=0;i++<NF;)print a[i]}' file.txt
