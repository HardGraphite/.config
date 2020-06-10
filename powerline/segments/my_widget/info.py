# vim:fileencoding=utf-8:noet

import i3ipc
import time
import psutil


# last time-stamp
last_time = 0.0

# connection to i3-wm
i3_conn = i3ipc.Connection()
# i3-wm con tree and focused
i3_tree = i3_conn.get_tree()
i3_focused = i3_tree.find_focused()

# memory usage
memory_use = psutil.virtual_memory().percent

# host name and user
try:
    from os import getenv
    from socket import gethostname
    _hostname = gethostname()
    _username = getenv('USER')
    assert isinstance(_hostname, str) and isinstance(_username, str)
except Exception:
    _hostname = '♖'
    _username = '♚'
finally:
    del getenv, gethostname


def _if_interval(interval=1.2) -> bool:
    global last_time
    current_time = time.time()
    if (flag := (current_time - last_time > interval)):
        last_time = current_time
    return flag

def _update_info():
    global i3_tree, i3_focused, memory_use
    if _if_interval():
        i3_tree = i3_conn.get_tree()
        i3_focused = i3_tree.find_focused()
        memory_use = psutil.virtual_memory().percent


def msg(pl, format='%Y-%m-%d', istime=False):
    return [{
        'contents': 'hello, world',
        'highlight_groups': ['information:highlighted'],
    }]


def focused_win(pl, strlen_max=32):
    _update_info()
    
    try:
        name = i3_focused.name.replace(' - ', ' ◁ ')

        if (name_len := len(name)) > strlen_max:
            half_maxlen = strlen_max // 2 - 4
            name = f'{name[:half_maxlen]} ⋯ {name[-half_maxlen:]}'
    except Exception:
        name = '-?-'

    return [{
        'contents': '❏ ' + name,
        'highlight_groups': ['stash'],
    }]


def hostname_username(pl):
    return [{
        'contents': _hostname,
        'draw_inner_divider': True,
        'highlight_groups': ['session'],
    },{
        'contents': _username,
        'draw_inner_divider': False,
        'highlight_groups': ['session'],
    }]


def memory(pl, strlen_max=32):
    _update_info()

    return [{
        'contents': f'Mem {memory_use:.1f}%',
        'highlight_groups': ['uptime'],
    }]
