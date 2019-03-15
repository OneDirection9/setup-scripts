# generate filename tags for lookupfile plugin
(echo "!_TAG_FILE_SORTED        2       /2=foldcase/";
(find . -not -name '*.o' -not -wholename '*.svn*' -not -wholename '*.git*' -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | \
sort -f)) > filename.tags
