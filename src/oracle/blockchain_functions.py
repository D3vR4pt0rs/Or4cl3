from web3 import Web3
from web3.middleware import geth_poa_middleware
from constants import CONTRACT_ADDRESS, HTTP_PROVIDER, ABI_PATH, BIN_PATH, TARGET_URL
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

run_parser()
