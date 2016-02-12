from sys import argv
from string import uppercase, lowercase

def main():
    keyword = argv[1]
    message = " ".join(argv[2:])
    keys = [lowercase.index(c.lower())+1 for c in keyword]
    letter_count = 0
    encoded = []
    for c in message:
        if c.lower() in lowercase:
            ind = lowercase.index(c.lower())
            new_ind = (ind + keys[letter_count % len(keys)]) % 26
            letter_count += 1
        if c in uppercase:
            encoded.append(uppercase[new_ind])
        elif c in lowercase:
            encoded.append(lowercase[new_ind])
        else:
            encoded.append(c)
    print "".join(encoded)

if __name__ == '__main__':
    main()
