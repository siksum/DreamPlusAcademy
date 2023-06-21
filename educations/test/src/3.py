from web3 import Web3

web3 = Web3(Web3.HTTPProvider("https://da.chainlight.io/MVGYUmOHF6GqJn5/3/rpc/3_10790_958d6305dd11ff3379d0ce4f530f00118fe9a2402bd6a6c3ebdb8f670732914b"))
add = "0xc10C412E0E609d9F470d076Dab9a8198c67612de"

for i in range(0, 30):
    print(web3.eth.getStorageAt(add, i))
    
# 1. Import the ABI
from compile import abi

# 2. Add the Web3 provider logic here:
# {...}

# 3. Create variables
account_from = {
    'private_key': 'YOUR-PRIVATE-KEY-HERE',
    'address': 'PUBLIC-ADDRESS-OF-PK-HERE',
}
contract_address = 'CONTRACT-ADDRESS-HERE'
value = 3

print(
    f'Calling the increment by { value } function in contract at address: { contract_address }'
)

# 4. Create contract instance
Incrementer = web3.eth.contract(address=contract_address, abi=abi)

# 5. Build increment tx
increment_tx = Incrementer.functions.increment(value).buildTransaction(
    {
        'from': account_from['address'],
        'nonce': web3.eth.get_transaction_count(account_from['address']),
    }
)

# 6. Sign tx with PK
tx_create = web3.eth.account.sign_transaction(increment_tx, account_from['private_key'])

# 7. Send tx and wait for receipt
tx_hash = web3.eth.send_raw_transaction(tx_create.rawTransaction)
tx_receipt = web3.eth.wait_for_transaction_receipt(tx_hash)

print(f'Tx successful with hash: { tx_receipt.transactionHash.hex() }')
