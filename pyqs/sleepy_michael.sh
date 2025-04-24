sed -E -n 's/^.:([a-zA-Z0-9]+@[a-zA-Z]+\.com:investor)./\1/p' email.txt > tmp.txt
sed -E -n 's/^.:([a-zA-Z0-9]+@[a-zA-Z]+\.org:investor)./\1/p' email.txt >> tmp.txt 
sed -E -i '/^michael/d' tmp.txt 
sort tmp.txt | uniq