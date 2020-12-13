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
    res = cut_cbr_site(text, parse_precious_metals_block=True)
    return res


def return_result_to_contract(contract,
                              data,
                              parse_inflation_block=False,
                              parse_foreign_currency_market_block=False,
                              parse_precious_metals_block=False,
                              parse_interbank_market_block=False,
                              parse_international_reserves_block=False,
                              parse_banking_sector_liquidity_indicators_block=False,
                              parse_The_bank_of_russia_claims_on_the_credit_organizations_block=False):
    if parse_inflation_block:
        tx = contract.functions.set_all_inflation(data["inflation_target"], data["month_of_previous_year"], data["something"]).buildTransaction(
            {'gas': 3000000, 'nonce': web3.eth.getTransactionCount("0x607Ec28AB2418F697D4B40E6e1A8Cf7F0fea4596")})
    elif parse_foreign_currency_market_block:
        tx = contract.functions.set_all_foreign_currency_market(data["US_Dollar"], data["Euro"]).buildTransaction(
            {'gas': 3000000, 'nonce': web3.eth.getTransactionCount("0x607Ec28AB2418F697D4B40E6e1A8Cf7F0fea4596")})
    elif parse_precious_metals_block:
        tx = contract.functions.set_all_precious_metals(data["gold"], data["silver"], data["platinum"], data["palladium"]).buildTransaction(
            {'gas': 3000000, 'nonce': web3.eth.getTransactionCount("0x607Ec28AB2418F697D4B40E6e1A8Cf7F0fea4596")})
    elif parse_interbank_market_block:
        tx = contract.functions.set_all_interbank_market(data["MIACR_1_day"], data["MIACR_2_7_day"], data["MIACR_8_30_day"], data["RUONIA_1_day"], data["MosPrimeRate_1_day"], data["MosPrimeRate_1_week"], data["MosPrimeRate_1_month"], data["ROISfix_1_week"], data["ROISfix_2_weeks"], data["ROISfix_1_month"]).buildTransaction(
            {'gas': 3000000, 'nonce': web3.eth.getTransactionCount("0x607Ec28AB2418F697D4B40E6e1A8Cf7F0fea4596")})
    elif parse_international_reserves_block:
        tx = contract.functions.set_all_international_reserves_of_the_russian_federation(data["international_reserves"]).buildTransaction(
            {'gas': 3000000, 'nonce': web3.eth.getTransactionCount("0x607Ec28AB2418F697D4B40E6e1A8Cf7F0fea4596")})
    elif parse_banking_sector_liquidity_indicators_block:
        tx = contract.functions.set_all_banking_sector_liquidity_indicators(data["liquidity_deficit"], data["correspondent_account_balances_in_RF"], data["total_volume_on_intraday_loans"], data["bank_deposits_with_bank_of_russia"], data["bank_of_russia_bonds_in_circulation"],  data["the_bank_of_russia_transactions_balance"]).buildTransaction(
            {'gas': 3000000, 'nonce': web3.eth.getTransactionCount("0x607Ec28AB2418F697D4B40E6e1A8Cf7F0fea4596")})
    elif parse_The_bank_of_russia_claims_on_the_credit_organizations_block:
        tx = contract.functions.set_all_the_bank_of_russia_claims_on_the_credit_organizations(data["overnight_loans_debt"], data["lombard_loans_debt"], data["REPO_debt_auctions"], data["REPO_debt_fixed_rate"], data["FX_swap_debt"], data["unsecured_lians_debt"], data["other_loans_debt"]).buildTransaction(
            {'gas': 3000000, 'nonce': web3.eth.getTransactionCount("0x607Ec28AB2418F697D4B40E6e1A8Cf7F0fea4596")})

    signed_tx = web3.eth.account.signTransaction(tx, PRIVATE_KEY)
    tx_hash = web3.eth.sendRawTransaction(signed_tx.rawTransaction)
    print('Send info to contract by' + tx_hash.hex())

print(parse_site())
