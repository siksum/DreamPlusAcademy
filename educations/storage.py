from web3 import Web3

web3 = Web3(Web3.HTTPProvider("https://matic-mumbai.chainstacklabs.com/"))


add = "0x8a6D77738Cec012030490682B81288b8c439721C"

print(web3.eth.getStorageAt(add, 1))
