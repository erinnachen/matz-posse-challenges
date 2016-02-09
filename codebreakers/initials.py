from sys import argv

def main():
    initials = [name[0].upper() for name in argv[1:]]
    print "".join(initials)

if __name__ == '__main__':
    main()
