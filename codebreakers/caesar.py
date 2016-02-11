from sys import argv
from string import uppercase, lowercase

def encoded_letter(c, key):
    if c.lower() in lowercase:
        ind = lowercase.index(c.lower())
        new_ind = (ind + key) % 26
    if c in uppercase:
        return uppercase[new_ind]
    elif c in lowercase:
        return lowercase[new_ind]
    else:
        return c

def main():
    key = int(argv[1])
    message = " ".join(argv[2:])
    encoded = [encoded_letter(c, key) for c in message]
    print "".join(encoded)

if __name__ == '__main__':
    main()
