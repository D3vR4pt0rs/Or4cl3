from web3 import Web3
from web3.middleware import geth_poa_middleware
from src.blockchain.constants import CONTRACT_ADDRESS, HTTP_PROVIDER, ABI_PATH, BIN_PATH
from src.blockchain.helper import configure_abi


web3 = Web3(Web3.HTTPProvider(HTTP_PROVIDER))
web3.middleware_onion.inject(geth_poa_middleware, layer=0)

def configure_contract():
    address = CONTRACT_ADDRESS
    abi = configure_abi(ABI_PATH)
    bin = configure_bin(BIN_PATH)
    contract = web3.eth.contract(address=address, abi=abi, bytecode=bin)
    return contract
