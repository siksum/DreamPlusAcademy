from web3 import Web3

list = "explain morning silly usual away cake schedule birth toy much time west bird indicate clip"

web3 = Web3()
web3.eth.account.enable_unaudited_hdwallet_features()
account = web3.eth.account.from_mnemonic(list, account_path="m/44'/60'/0'/0/999999998")

print(account.pri)
