import requests
from bs4 import BeautifulSoup
from src.mini_parsers import *

# magic constants
target_url = "https://cbr.ru/eng/key-indicators/"


def get_html_code(url):
    r = requests.get(url)
    return r.text


def cut_cbr_site(html,
                 parse_inflation_block=True,
                 parse_main_indicators_of_financial_market_block=True,
                 parse_international_reserves_block=True,
                 parse_banking_sector_liquidity_indicators_block=True,
                 parse_the_bank_of_russia_claims_on_the_credit_organizations_block=True):
    soup = BeautifulSoup(html, "html.parser")
    res = dict()
    if parse_inflation_block:
        res.update(cut_inflation_block(soup))
    if parse_main_indicators_of_financial_market_block:
        res.update(cut_main_indicators_of_financial_market_block(soup))
    if parse_international_reserves_block:
        res.update(cut_international_reserves_block(soup))
    if parse_banking_sector_liquidity_indicators_block:
        res.update(cut_banking_sector_liquidity_indicators_block(soup))
    if parse_the_bank_of_russia_claims_on_the_credit_organizations_block:
        res.update(cut_the_bank_of_russia_claims_on_the_credit_organizations_block(soup))
    return res


print(cut_cbr_site(get_html_code(target_url)))