import socket

# 新建Socket
server = socket.socket()

# 绑定IP和端口
server.bind(('127.0.0.1',8999))

# 监听连接
server.listen(5)
s,addr = server.accept()
print(f'connect addr:{addr}')

while True:
    # 接受连接
    content = s.recv(1024)
    if len(content) == 0:
        break
    print(str(content,encoding='utf-8'))
    s.send(content)

s.close()