import socket
import time
import random
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
# bind socket to Art-Net port
sock.bind(('0.0.0.0', 2409))
ID = bytearray(b"E-Health\x00")
deviceID = bytearray(b'QWERTY22')
msgend= bytearray([0x00,0x00])

print('Node started')
def main():
    while True:
        print('Waiting for data')
        data, addr = sock.recvfrom(1024) 
        print(data)
        if data.startswith(b"E-Health"): 
            opcode = int.from_bytes(data[9:11], byteorder="little") 
            print("Received Art-Net packet from {}: opcode = {}".format(addr, hex(opcode)))
            # Network data opCodes
            if (opcode == 0x1001):
                print('Network informations recieved')
                networkSSIDlen = data[11]
                netWorkSSID = data[12 : 12 + networkSSIDlen].decode("utf-8")

                networkPWDlen = data[12 + networkSSIDlen ]
                netWorkPWD = data[12 + networkSSIDlen + 1 :  12 + networkPWDlen + networkSSIDlen + 1].decode("utf-8")
                print('Network SSID: ' + str(netWorkSSID) + ' len: ' + str(networkSSIDlen))
                print('Network PWD: ' + str(netWorkPWD) + ' len: ' + str(networkPWDlen))
                time.sleep(0.6)
                code = bytearray([0x02,0x10])
                reply = ID + code + msgend
                sock.sendto(reply, addr)

            # Handshake opCodes
            if (opcode== 0x2000):
                print('Handshake Request')
                opCode = bytearray([0x01,0x20])
                reply= ID + opCode + deviceID + msgend
                # reply= ID + opCode + msgend  //to check error handling
                print('data: ' + str(data))
                print('reply: ' + str(reply))
                sock.sendto(reply, addr)
                time.sleep(0.3)
                print('Send handshare reply, packet length: '+ str(len(reply)))

            
            # Data opCodes
            if (opcode== 0x3100):
                print('Blood Pressure request')
                opcode = bytearray ([0x01,0x31])
                systolic= bytearray([112])
                diastolic= bytearray([65])
                reply = ID + opcode + systolic + diastolic + msgend
                sock.sendto(reply, addr)
                print('Send BP result, packet length: '+ str(len(reply)))

            if (opcode== 0x3200):
                print('Blood Pressure request')
                opcode = bytearray ([0x01,0x32])
                data= bytearray([112])
                reply = ID + opcode + data + msgend
                sock.sendto(reply, addr)
                print('Send Gluco result, packet length: '+ str(len(reply)))

            if (opcode== 0x3300):
                print('Temperature request')
                opcode = bytearray ([0x01,0x33])
                dataB = bytearray([random.randint(35, 39)])
                dataS = bytearray([random.randint(00, 99)])
                reply = ID + opcode + dataB + dataS + msgend
                sock.sendto(reply, addr)
                print('Send Temperature result, packet length: '+ str(len(reply)))

            if (opcode== 0x3400):
                print('Heart beat request')
                opcode = bytearray ([0x01,0x34])
                data = bytearray([random.randint(60, 100)])
                reply = ID + opcode + data + msgend
                sock.sendto(reply, addr)
                print('Send Heart beat result, packet length: '+ str(len(reply)))
        else:
            print('Not E-Health packet')

main()