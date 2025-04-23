import sys
from re import match
def dicti(word):
    dictionary={}
    count=0
    for ch in word:
        if match(r'[ `~!@#$%^\&\*()_\+\-=\[\]\{\}\|;\'\"\.>\,</?A-Za-z0-9]', ch):
            count+=1
        dictionary[ch]=count
        count=0  
    return dictionary
word=sys.argv[1]
result=dicti(word)
for key,value in result.items():
    print(f"{key}:{value}")