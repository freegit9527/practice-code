__author__ = 'snowsun'

current_file = open("text.txt")


def read_all_line(f):
    print f.read()


def read_one_line(line_count, f):
    print line_count, ": ", f.readline(),


def rewind(f):
    f.seek(0)


print "First, we look the file:"
print "*" * 20
read_all_line(current_file)
print "*" * 20

print "Next, we rewind our file pointer."
rewind(current_file)

print "Finally, we read three lines:"

current_line = 1
read_one_line(current_line, current_file)

current_line += 1
read_one_line(current_line, current_file)

current_line += 1
read_one_line(current_line, current_file)
