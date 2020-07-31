# coding:utf8
import httplib
import time
import json
import socket


def Broadcast():
    host = socket.gethostbyname(socket.gethostname())
    port = 1234
    senddata = '{\"ip\":\"' + host + '\",\"port\":' + str(port) + '}'
    sendaddress = (host[:host.rfind('.') + 1] + '255', 14099)
    conn = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    conn.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    conn.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    conn.bind((host, port))
    conn.settimeout(0.1)
    devices = []
    for i in range(1, 50):
        try:
            conn.sendto(senddata, sendaddress)
            message, address = conn.recvfrom(port)
            if message:
                insert = json.loads(message)
                if not (insert in devices):
                    devices.append(insert)
        except:
            print('timeout')
    # print devices
    return devices


class Device:
    def __init__(self, ip, deviceid=False):
        self.host = ip
        self.port = 50005
        self.key = "4JQktNt6SoXSa8i4segm7Nw9i3kQMF2r" + \
                   "LHRHtpyWAjde1RxVDvt1Z8rdpgMKDnw1"
        # self.osType    = device['osType']
        # self.tsversion = device['tsversion']
        self.deviceid = deviceid
        self.auth = False
        self.valid = 0

    def getAuth(self):
        self.getdeviceid()
        if not self.deviceid:
            print 'Not Device'
            self.auth = False
            return False
        if self.auth and self.valid > time.time():
            return True
        valid = 3600
        headers = {}
        data = {
            "action": "getAuth",
            "key": self.key,
            "devices": [self.deviceid],
            "valid": valid,
            "time": int(time.time())
        }
        encode = json.dumps(data)
        host = 'storeauth.touchsprite.net'
        url = '/api/openapi'
        conn = httplib.HTTPSConnection(host, timeout=3)
        try:
            conn.request('POST', url, encode, headers)
            res = json.loads(conn.getresponse().read())
            self.auth = res['auth']
            self.valid = time.time() + valid
            return True
        except:
            return False

    def getdeviceid(self):
        url = '/deviceid'
        conn = httplib.HTTPConnection(self.host, self.port, timeout=2)
        headerdata = {
            'Connection': 'close',
            'Content - Length': 0
        }
        try:
            conn.request(method="GET", url=url, headers=headerdata)
            self.deviceid = conn.getresponse().read()
        except:
            self.deviceid = False
            return False

    def getdevicename(self):
        url = '/devicename'
        conn = httplib.HTTPConnection(self.host, self.port, timeout=2)
        headerdata = {
            'Connection': 'close',
            'Content - Length': 0
        }
        try:
            conn.request(method="GET", url=url, headers=headerdata)
            self.devicename = conn.getresponse().read()
        except:
            self.deviceid = False
            return False

    def snapshot_png(self, filename, orient = "0"):
        if not self.getAuth():
            return False
        url = '/snapshot?ext=png&orient=' + orient
        conn = httplib.HTTPConnection(self.host, self.port, timeout=3)
        headerdata = {
            'auth': self.auth,
            'Host': self.host
        }
        try:
            conn.request(method="GET", url=url, headers=headerdata)
            fileHandle = open(filename, 'wb')
            fileHandle.write(conn.getresponse().read())
            fileHandle.close()
        except:
            return False

    def status(self):
        if not self.getAuth():
            return False
        url = '/status'
        conn = httplib.HTTPConnection(self.host, self.port, timeout=2)
        headerdata = {
            'auth': self.auth
        }
        try:
            conn.request(method="GET", url=url, headers=headerdata)
            return conn.getresponse().read()
        except:
            return False

    def getFileList(self, root=["lua", "res", "log", "plugin"], path="/"):
        if not self.getAuth():
            return False
        url = '/getFileList'
        re = []
        conn = httplib.HTTPConnection(self.host, self.port, timeout=2)
        for i in range(0, 3):
            headerdata = {
                'auth': self.auth,
                'Root': root[i],
                'Path': path
            }
            try:
                conn.request(method="GET", url=url, headers=headerdata)
                re.append(conn.getresponse().read())
            except:
                print 'timeout'
        return re

    def getFile(self, file, root="lua", path="/"):
        if not self.getAuth():
            return False
        url = '/getFile'
        conn = httplib.HTTPConnection(self.host, self.port, timeout=2)
        headerdata = {
            'auth': self.auth,
            'Root': root,
            'Path': path,
            'Host': self.host,
            'file': file,
            'Connection': 'close'
        }
        try:
            conn.request(method="GET", url=url, headers=headerdata)
            conn.getresponse().read()
        except:
            print 'timeout'

# phone = Device("192.168.10.20")
# phone.getAuth()
# print phone.snapshot_png("0")
