from web3 import Web3

web3 = Web3(Web3.HTTPProvider("HTTP://127.0.0.1:7545"))
add = "0x5552f14cBb82b914d194fd2A8c973409c0883d07"

print(web3.toHex(web3.eth.getStorageAt(add, "0x0"))) #slot 0
#0x000000000000000000000000000000000000000000000000000000000000007b is 123 in decimal

print(web3.toHex(web3.eth.getStorageAt(add, "0x1"))) #slot 1
#0x000000000000000000001f01ffb8fc0cca6d676cf4cb2f6b21e832c4212da34c is 123456 in decimal

print(web3.toHex(web3.eth.getStorageAt(add, "0x2"))) #slot 2
#0x66697273745f70617373776f7264000000000000000000000000000000000000 is first_password in ascii

for i in range(3, 6):
    print('slot'+str(i)+':'+web3.toHex(web3.eth.getStorageAt(add, hex(i))))

print(web3.toHex(web3.eth.getStorageAt(add, "0x6"))) #slot 6

user1ID = web3.toHex(web3.eth.getStorageAt(add, "0xf652222313e28459528d920b65115c16c04f3efc82aaedc97be59f3f377c0d3f"))
user1PW =  web3.toHex(web3.eth.getStorageAt(add, "0xf652222313e28459528d920b65115c16c04f3efc82aaedc97be59f3f377c0d40"))