import requests
from bs4 import BeautifulSoup
from mini_parsers import *

def get_html_code(url):
    r = requests.get(url)
    return r.text


def cut_cbr_site(html,
                 parse_inflation_block=False,
                 parse_foreign_currency_market_block=False,
                 parse_precious_metals_block=False,
                 parse_interbank_market_block=False,
                 parse_international_reserves_block=False,
                 parse_banking_sector_liquidity_indicators_block=False,
                 parse_The_bank_of_russia_claims_on_the_credit_organizations_block=False):
    soup = BeautifulSoup(html, "html.parser")
    res = dict()
    if parse_inflation_block:
        res.update(cut_inflation_block(soup))
    if parse_foreign_currency_market_block:
        res.update(cut_foreign_currency_market_block(soup))
    if parse_precious_metals_block:
        res.update(cut_precious_metals_block(soup))
    if parse_interbank_market_block:
        res.update(cut_interbank_market_block(soup))
    if parse_international_reserves_block:
        res.update(cut_international_reserves_block(soup))
    if parse_banking_sector_liquidity_indicators_block:
        res.update(cut_banking_sector_liquidity_indicators_block(soup))
    if parse_The_bank_of_russia_claims_on_the_credit_organizations_block:
        res.update(cut_The_bank_of_russia_claims_on_the_credit_organizations_block(soup))
    return res
