from web3 import Web3
from web3.middleware import geth_poa_middleware
from constants import CONTRACT_ADDRESS, HTTP_PROVIDER, ABI_PATH, BIN_PATH, TARGET_URL, PRIVATE_KEY
from helper import configure_abi, configure_bytecode
from parser import cut_cbr_site, get_html_code

web3 = Web3(Web3.HTTPProvider(HTTP_PROVIDER))
web3.middleware_onion.inject(geth_poa_middleware, layer=0)

def configure_contract():
    address = CONTRACT_ADDRESS
    abi = configure_abi(ABI_PATH)
    bin = configure_bytecode(BIN_PATH)
    contract = web3.eth.contract(address=address, abi=abi, bytecode=bin)
    return contract

def parse_site():
    text = get_html_code(TARGET_URL)
    res = cut_cbr_site(text)
    return res

def return_result_to_contract(contract, res):
    tx = contract.functions.set_Silver("56.15").buildTransaction({'gas': 3000000, 'nonce': web3.eth.getTransactionCount("0x607Ec28AB2418F697D4B40E6e1A8Cf7F0fea4596")})
    signed_tx = web3.eth.account.signTransaction(tx, PRIVATE_KEY)
    tx_hash = web3.eth.sendRawTransaction(signed_tx.rawTransaction)
    print('Registration request sent by '+tx_hash.hex())

def changeOwner(contract):
    tx = contract.functions.changeOwner("0x607Ec28AB2418F697D4B40E6e1A8Cf7F0fea4596").buildTransaction({'gas': 3000000, 'nonce':web3.eth.getTransactionCount("0x607Ec28AB2418F697D4B40E6e1A8Cf7F0fea4596") })
    signed_tx = web3.eth.account.signTransaction(tx, PRIVATE_KEY)
    tx_hash = web3.eth.sendRawTransaction(signed_tx.rawTransaction)
    print('Registration request sent by '+tx_hash.hex())

contract = configure_contract()
res = parse_site()
print(res)
