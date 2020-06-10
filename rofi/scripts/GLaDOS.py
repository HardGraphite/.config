#!/usr/bin/python
# modi "Animus" in Rofi


import enum
import json
from os import path, system
import re
from sys import argv, stderr


__cfgfilename = r'GLaDOS.json'
__DEBUG = False
__SEP_CH = ' ▷ '


def load_config() -> dict:
    filepath = path.join(path.dirname(__file__), __cfgfilename)
    assert path.exists(filepath), 'cannot find config file'
    with open(filepath, 'r') as f:
        config = json.load(f)
    return config

class CmdType(enum.Enum):
    MENU = 1
    EXEC = 2

def parse_cmd(config: dict, cmd: str = ''):
    cur_menu = config
    if cmd:
        for name in cmd.split(__SEP_CH):
            name = name.strip()
            if not name in cur_menu:
                raise RuntimeError('menu not found', cur_menu, name)
            cur_menu = cur_menu[name]
    if isinstance(cur_menu, dict):
        return CmdType.MENU, cur_menu.keys()
    elif isinstance(cur_menu, str):
        return CmdType.EXEC, cur_menu
    else:
        raise RuntimeError('type error in config file', cur_menu, type(cur_menu))

def print_menu(parent_menu: str, menu: list):
    print('\0markup-rows\x1ftrue')
    if parent_menu: print(f'\0message\x1f♦ <u>{parent_menu.split(__SEP_CH)[-1]}</u> OPTIONS')
    for item in menu:
        prefix = f'<i>{parent_menu}</i>' + __SEP_CH if parent_menu else ''
        print(f'{prefix}<b><u>{item}</u></b>')

def execute(cmd: str):
    system(cmd)


def main():
    cmdstr = ' '.join(argv[1:]) if len(argv) > 1 else ''
    cmdstr = re.sub(r'<[\w\/]*>', '', cmdstr)
    try:
        _type, _cont = parse_cmd(load_config(), cmdstr)
        if (_type == CmdType.MENU):
            print_menu(cmdstr, _cont)
        elif (_type, CmdType.EXEC):
            execute(_cont)
        else:
            pass
    except RuntimeError as e:
        if __DEBUG:
            print(e, file=stderr)
        exit(1)


if __name__ == "__main__":
    main()

