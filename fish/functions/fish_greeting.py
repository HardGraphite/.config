from os import get_terminal_size as get_tsize
from os import environ
from socket import gethostname
from time import strftime

term_cols = get_tsize()[0]
s_smile = ' ( ≧ ◠ ◡ ◠ ≦ ) '
s_hello = ' hello , world '
s_info  = '  [' + environ['USER'] + '@' + gethostname() + \
    ']  ' + strftime('%Y.%m.%d  %H:%M:%S') + '  '

print(f'{s_smile:=^{term_cols}}')
print(f'{s_hello:*^{term_cols}}')
print(f'{s_info:-^{term_cols}}')

