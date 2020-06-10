# vim:fileencoding=utf-8:noet

cnt = 0

def msg(pl, format='%Y-%m-%d', istime=False):
    global cnt
    cnt += 1
    return [{
	'contents': f'hello, world {cnt}',
	'highlight_groups': ['information:highlighted'],
    }]

