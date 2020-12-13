from oracle.blockchain_functions.py import parse_site, configure_contract


def handle_event(contract):
    parse_answer = parse_site()
    return_result_to_contract(contract, parse_answer, parse_precious_metals_block=True)


def listen_contract_event(contract, beacon_filter, interval):
    while True:
        for event in beacon_filter.get_new_entries():
            handle_event(contract)
            time.sleep(interval)


if __name__ == '__main__':
    contract = configure_contract()
    beacon_filter = contract.eventFilter('Beacon', {'fromBlock': 'latest'})
    listen_contract_event(contract=contract, beacon_filter=beacon_filter, interval=1)
