import sys
import re

def to_acronym(phrase):
    phrase = phrase.replace('-', ' ')
    phrase = re.sub(r'[^\w\s]', '', phrase)  # Remove punctuation except hyphens
    words = phrase.split()
    acronym = ''.join(word[0].upper() for word in words)
    return acronym

full = sys.argv[1]
print(to_acronym(full))
