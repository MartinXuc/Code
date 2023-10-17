import socket

# 新建socket
client = socket.socket()
# 连接服务端
client.connect(('127.0.0.1',8999))

while True:
    s = input('请输入要发送给服务端的数据：')
    client.send(bytes(s,'utf-8'))
    content = client.recv(1024)
    print(str(content, encoding='utf-8'))

client.close()