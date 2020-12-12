def cut_inflation_block(soup):
    inflation_target = soup.find(class_="indicator col-md-15").findChild(class_="value").getText() \
        .replace("%", "").split("\n")[0].split("\r")[0]
    month_of_previous_year = soup.find(class_="rate col-md-7 offset-md-1").findChild(class_="value").getText() \
        .replace("%", "").split("\n")[0].split("\r")[0]
    something = soup.find(class_="indicator col-md-7 offset-md-1").findChild(class_="value").getText() \
        .replace("%", "").split("\n")[0].split("\r")[0]
    return {"inflation_target": inflation_target,
            "month_of_previous_year": month_of_previous_year,
            "something": something}


def cut_foreign_currency_market_block(soup):
    foreign_currency_market = soup.find(class_="table key-indicator_table")
    usd_prev = foreign_currency_market.findChildren \
        (class_="value td-w-4 _bold _end mono-num")[0].getText()
    usd_now = foreign_currency_market.findChildren \
        (class_="value td-w-4 _bold _end mono-num _with-icon _down _green")[0].getText()
    eur_prev = foreign_currency_market.findChildren \
        (class_="value td-w-4 _bold _end mono-num")[1].getText()
    eur_now = foreign_currency_market.findChildren \
        (class_="value td-w-4 _bold _end mono-num _with-icon _down _green")[1].getText()
    return {"usd_prev": usd_prev,
            "usd_now": usd_now,
            "eur_prev": eur_prev,
            "eur_now": eur_now}


def cut_precious_metals_block(soup):
    precious_metals = soup.find_all(class_="table key-indicator_table")[1]
    gold = precious_metals.findChildren(class_="value td-w-4 _bold _end mono-num")[0].getText()
    silver = precious_metals.findChildren(class_="value td-w-4 _bold _end mono-num")[1].getText()
    platinum = precious_metals.findChildren(class_="value td-w-4 _bold _end mono-num")[2].getText()
    palladium = precious_metals.findChildren(class_="value td-w-4 _bold _end mono-num")[3].getText()
    return {"gold": gold,
            "silver": silver,
            "platinum": platinum,
            "palladium": palladium}


def cut_interbank_market_block(soup):
    interbank_market = soup.find_all(class_="table key-indicator_table")[2]
    MIACR_1_day = interbank_market.findChildren(class_="value _bold _end td-w-4 mono-num")[0].getText()
    MIACR_2_7_day = interbank_market.findChildren(class_="value _bold _end td-w-4 mono-num")[1].getText()
    MIACR_8_30_day = interbank_market.findChildren(class_="value _bold _end td-w-4 mono-num")[2].getText()
    RUONIA_1_day = interbank_market.findChild(class_="value _bold _end mono-num _with-icon _up").getText()
    MosPrimeRate_1_day = interbank_market.findChildren(class_="value _bold _end mono-num")[0].getText()
    MosPrimeRate_1_week = interbank_market.findChildren(class_="value _bold _end mono-num")[1].getText()
    MosPrimeRate_1_month = interbank_market.findChildren(class_="value _bold _end mono-num")[2].getText()
    ROISfix_1_week = interbank_market.findChildren(class_="value _bold _end mono-num")[3].getText()
    ROISfix_2_weeks = interbank_market.findChildren(class_="value _bold _end mono-num")[4].getText()
    ROISfix_1_month = interbank_market.findChildren(class_="value _bold _end mono-num")[5].getText()
    return {"MIACR_1_day": MIACR_1_day,
            "MIACR_2_7_day": MIACR_2_7_day,
            "MIACR_8_30_day": MIACR_8_30_day,
            "RUONIA_1_day": RUONIA_1_day,
            "MosPrimeRate_1_day": MosPrimeRate_1_day,
            "MosPrimeRate_1_week": MosPrimeRate_1_week,
            "MosPrimeRate_1_month": MosPrimeRate_1_month,
            "ROISfix_1_week": ROISfix_1_week,
            "ROISfix_2_weeks": ROISfix_2_weeks,
            "ROISfix_1_month": ROISfix_1_month}


def cut_international_reserves_block(soup):
    international_reserves = soup.findChildren(class_="value _bold _end mono-num")[6].getText()
    return {"international_reserves": international_reserves}


def cut_banking_sector_liquidity_indicators_block(soup):
    liquidity_deficit = soup.findChildren(class_="value _bold _end mono-num")[7].getText()
    correspondent_account_balances_in_RF = \
        soup.findChildren(class_="value _without_border _bold _end mono-num")[0].getText()
    correspondent_account_balances_in_Moscow = soup.findChildren(class_="value _bold _end mono-num")[8].getText()
    total_volume_on_intraday_loans = soup.findChildren(class_="value _bold _end mono-num")[9].getText()
    bank_deposits_with_bank_of_russia = soup.findChildren(class_="value _bold _end mono-num")[10].getText()
    bank_of_russia_bonds_in_circulation = soup.findChildren(class_="value _bold _end mono-num")[11].getText()
    the_bank_of_russia_transactions_balance = \
        soup.findChildren(class_="value _bold _end mono-num _with-icon _up")[1].getText()
    return {"liquidity_deficit": liquidity_deficit,
            "correspondent_account_balances_in_RF": correspondent_account_balances_in_RF,
            "correspondent_account_balances_in_Moscow": correspondent_account_balances_in_Moscow,
            "total_volume_on_intraday_loans": total_volume_on_intraday_loans,
            "bank_deposits_with_bank_of_russia": bank_deposits_with_bank_of_russia,
            "bank_of_russia_bonds_in_circulation": bank_of_russia_bonds_in_circulation,
            "the_bank_of_russia_transactions_balance": the_bank_of_russia_transactions_balance}


def cut_The_bank_of_russia_claims_on_the_credit_organizations_block(soup):
    overnight_loans_debt = soup.findChildren(class_="value _bold _end mono-num")[12].getText()
    lombard_loans_debt = soup.findChildren(class_="value _bold _end mono-num")[13].getText()
    REPO_debt_auctions = soup.findChildren(class_="value _without_border _bold _end mono-num")[1].getText()
    REPO_debt_fixed_rate = soup.findChildren(class_="value _bold _end mono-num")[14].getText()
    FX_swap_debt = soup.findChildren(class_="value _bold _end mono-num")[15].getText()
    unsecured_lians_debt = soup.findChildren(class_="value _bold _end mono-num")[16].getText()
    other_loans_debt = soup.findChildren(class_="value _bold _end mono-num")[17].getText()
    return {"overnight_loans_debt": overnight_loans_debt,
            "lombard_loans_debt": lombard_loans_debt,
            "REPO_debt_auctions": REPO_debt_auctions,
            "REPO_debt_fixed_rate": REPO_debt_fixed_rate,
            "FX_swap_debt": FX_swap_debt,
            "unsecured_lians_debt": unsecured_lians_debt,
            "other_loans_debt": other_loans_debt}
