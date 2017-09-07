head at the end gives you the first 10 lines

````plaintext
find . -name '*.java' | grep View | grep -v /casandra/ | xargs echo grep "^public class"
xargs -n1 gzip
gunzip
gitk --all &
````
