#!/usr/bin/python

import hashlib
import json
import random
import sys
import time
from urllib import parse, request


class YoudaoTranslator:
    """youdao translate"""

    url = 'http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule'
    user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'

    @staticmethod
    def generate_salt() -> str:
        """new salt"""

        return str(int(time.time() * 1000) + random.randint(1, 10))

    @staticmethod
    def generate_request(text: str, salt: str, user_agent: str, url: str) -> request.Request:
        """generate a translating request"""

        data = parse.urlencode({
            'i': text,
            'from': 'AUTO',
            'to': 'AUTO',
            'smartresult': 'dict',
            'client': 'fanyideskweb',
            'salt': salt,
            'sign': hashlib.md5(('fanyideskweb' + text + salt \
                + "rY0D^0\'nM0}g5Mm1z%1G4").encode('utf-8')).hexdigest(),
            'doctype': 'json',
            'version': '2.1',
            'keyfrom': 'fanyi.web',
            'action': 'FY_BY_CL1CKBUTTON',
            'typoResult': 'true',
        }).encode('utf-8')

        header = {
            'User-Agent': user_agent,
        }

        req = request.Request(
            url     = url,
            data    = data,
            headers = header,
            method  = 'POST'
        )

        return req

    @staticmethod
    def parse_response(res: str):
        """parse response"""

        res = json.loads(res.read().decode('utf-8'))

        if not res['errorCode'] == 0:
            return None

        tr_result = res['translateResult'][0]
        res_lst = []
        for pair in tr_result:
            assert isinstance(pair, dict)
            res_lst.append(f'{pair["src"]} ⇒ {pair["tgt"]}')

        return '\n'.join(res_lst)

    def translate(self, text: str) -> str:
        req = self.generate_request(
            text,
            self.generate_salt(),
            self.user_agent,
            self.url
        )
        res = self.parse_response(
            request.urlopen(req)
        )
        return res


def main():
    if sys.argv.__len__() < 2:
        exit(1)

    tr = YoudaoTranslator()
    print(tr.translate(' '.join(sys.argv[1:])))


if __name__ == "__main__":
    main()

