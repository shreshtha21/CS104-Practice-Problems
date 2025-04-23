import sys
import re

def is_anagram(word1,word2):
    charin1 = []
    charin2 = []
    for i in range(0,len(word1)):
        if re.match(r'[0-9A-Za-z]', word1[i]):
            charin1.append(word1[i].lower())
    for i in range(0,len(word2)):
        if re.match(r'[0-9A-Za-z]', word2[i]):
            charin2.append(word2[i].lower())
    return sorted(charin1)==sorted(charin2)

word1=sys.argv[1]
word2=sys.argv[2]
print(is_anagram(word1,word2))
