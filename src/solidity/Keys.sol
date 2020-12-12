// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

contract KeyInds {
    
    
    //START Owner block
    address private owner;
    
    event OwnerSet(address indexed oldOwner, address indexed newOwner);
    
    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }
    
    constructor() {
        owner = msg.sender;
        emit OwnerSet(address(0), owner);
    }

    function changeOwner(address newOwner) public isOwner {
        emit OwnerSet(owner, newOwner);
        owner = newOwner;
    }

    function getOwner() external view returns (address) {
        return owner;
    }
    //END Owner block
    
    
    //START DATEBASE
    
    struct Inflation
    {
        string inflation_target;
        string month_of_previous_year;
        string something;
    }
    
    
    struct Main_indicators_of_financial_market
    {
        //foreign_currency_market
        string US_Dollar;
        string Euro;
        
        //precious_metals
        string Gold;
        string Silver;
        string Platinum;
        string Palladium;
        
        //interbank_market
        string MIACR_1_day;
        string MIACR_2_7_day;
        string MIACR_8_30_day;
        
        string RUONIA_1_day;
        
        string MosPrimeRate_1_day;
        string MosPrimeRate_1_week;
        string MosPrimeRate_1_month;
        
        string ROISfix_1_week;
        string ROISfix_2_weeks;
        string ROISfix_1_month;
    }
    
    
    string international_reserves_of_the_russian_federation;
    
    
    struct Banking_sector_liquidity_indicators{
        string liquidity_deficit;
        
        string correspondent_account_balances_in_RF;
        string correspondent_account_balances_in_Moscow;
        
        string total_volume_on_intraday_loans;
        
        string bank_deposits_with_bank_of_russia;
        
        string bank_of_russia_bonds_in_circulation;
        
        string the_bank_of_russia_transactions_balance;
    }
    
    struct The_bank_of_russia_claims_on_the_credit_organizations
    {
        string overnight_loans_debt;
        
        string lombard_loans_debt;
        
        string REPO_debt_auctions;
        string REPO_debt_fixed_rate;
        
        string FX_swap_debt;
        
        string unsecured_lians_debt;
        
        string other_loans_debt;
    }
    
    //START OBJECTS
    
    Inflation inflation;
    Main_indicators_of_financial_market main_indicators_of_financial_market;
    Banking_sector_liquidity_indicators banking_sector_liquidity_indicators;
    The_bank_of_russia_claims_on_the_credit_organizations the_bank_of_russia_claims_on_the_credit_organizations;
    
    //END OBJECTS
    
    //END DATEBASE
    
    //START inflation setters
    
    //inflation
    function set_inflation_target(string memory txt) public{
        inflation.inflation_target = txt;
    }
    function set_month_of_previous_year(string memory txt) public{
        inflation.month_of_previous_year = txt;
    }
    function set_something(string memory txt) public{
        inflation.something = txt;
    }
    
    //START main_indicators_of_financial_market
    //foreign_currency_market
    function set_US_Dollar(string memory txt) public{
        main_indicators_of_financial_market.US_Dollar = txt;
    }
    function set_Euro(string memory txt) public{
        main_indicators_of_financial_market.Euro = txt;
    }
    
    //precious_metals
    function set_Gold(string memory txt) public{
        main_indicators_of_financial_market.Gold = txt;
    }
    function set_Silver(string memory txt) public{
        main_indicators_of_financial_market.Silver = txt;
    }
    function set_Platinum(string memory txt) public{
        main_indicators_of_financial_market.Platinum = txt;
    }
    function set_Palladium(string memory txt) public{
        main_indicators_of_financial_market.Palladium = txt;
    }
    
    //interbank_market
    function set_MIACR_1_day(string memory txt) public{
        main_indicators_of_financial_market.MIACR_1_day = txt;
    }
    function set_MIACR_2_7_day(string memory txt) public{
        main_indicators_of_financial_market.MIACR_2_7_day = txt;
    }
    function set_MIACR_8_30_day(string memory txt) public{
        main_indicators_of_financial_market.MIACR_8_30_day = txt;
    }
    
    function set_RUONIA_1_day(string memory txt) public{
        main_indicators_of_financial_market.RUONIA_1_day = txt;
    }
    
    function set_MosPrimeRate_1_day(string memory txt) public{
        main_indicators_of_financial_market.MosPrimeRate_1_day = txt;
    }
    function set_MosPrimeRate_1_week(string memory txt) public{
        main_indicators_of_financial_market.MosPrimeRate_1_week = txt;
    }
    function set_MosPrimeRate_1_month(string memory txt) public{
        main_indicators_of_financial_market.MosPrimeRate_1_month = txt;
    }
    
    function set_ROISfix_1_week(string memory txt) public{
        main_indicators_of_financial_market.ROISfix_1_week = txt;
    }
    function set_ROISfix_2_weeks(string memory txt) public{
        main_indicators_of_financial_market.ROISfix_2_weeks = txt;
    }
    function set_ROISfix_1_month(string memory txt) public{
        main_indicators_of_financial_market.ROISfix_1_month = txt;
    }
    //EMD main_indicators_of_financial_market
    
    //START international_reserves_of_the_russian_federation
    function set_international_reserves_of_the_russian_federation(string memory txt) public{
        international_reserves_of_the_russian_federation = txt;
    }
    //END international_reserves_of_the_russian_federation
    
    //START banking_sector_liquidity_indicators
    function set_liquidity_deficit(string memory txt) public{
        banking_sector_liquidity_indicators.liquidity_deficit = txt;
    }
    function set_correspondent_account_balances_in_RF(string memory txt) public{
        banking_sector_liquidity_indicators.correspondent_account_balances_in_RF = txt;
    }
    function set_correspondent_account_balances_in_Moscow(string memory txt) public{
        banking_sector_liquidity_indicators.correspondent_account_balances_in_Moscow = txt;
    }
    function set_total_volume_on_intraday_loans(string memory txt) public{
        banking_sector_liquidity_indicators.total_volume_on_intraday_loans = txt;
    }
    function set_bank_deposits_with_bank_of_russia(string memory txt) public{
        banking_sector_liquidity_indicators.bank_deposits_with_bank_of_russia = txt;
    }
    function set_bank_of_russia_bonds_in_circulation(string memory txt) public{
        banking_sector_liquidity_indicators.bank_of_russia_bonds_in_circulation = txt;
    }
    function set_the_bank_of_russia_transactions_balance(string memory txt) public{
        banking_sector_liquidity_indicators.the_bank_of_russia_transactions_balance = txt;
    }
    //END banking_sector_liquidity_indicators
    
    //START the_bank_of_russia_claims_on_the_credit_organizations
    function set_overnight_loans_debt(string memory txt) public{
        the_bank_of_russia_claims_on_the_credit_organizations.overnight_loans_debt = txt;
    }
    function set_lombard_loans_debt(string memory txt) public{
        the_bank_of_russia_claims_on_the_credit_organizations.lombard_loans_debt = txt;
    }
    function set_REPO_debt_auctions(string memory txt) public{
        the_bank_of_russia_claims_on_the_credit_organizations.REPO_debt_auctions = txt;
    }
    function set_REPO_debt_fixed_rate(string memory txt) public{
        the_bank_of_russia_claims_on_the_credit_organizations.REPO_debt_fixed_rate = txt;
    }
    function set_FX_swap_debt(string memory txt) public{
        the_bank_of_russia_claims_on_the_credit_organizations.FX_swap_debt = txt;
    }
    function set_unsecured_lians_debt(string memory txt) public{
        the_bank_of_russia_claims_on_the_credit_organizations.unsecured_lians_debt = txt;
    }
    function set_other_loans_debt(string memory txt) public{
        the_bank_of_russia_claims_on_the_credit_organizations.other_loans_debt = txt;
    }
    //END the_bank_of_russia_claims_on_the_credit_organizations
    
    //END setters
    
    //#######################################################################################################################
    
    //START getters
    //inflation
    function get_inflation_target() public view returns(string memory){
        return inflation.inflation_target;
    }
    function get_month_of_previous_year() public view returns(string memory){
        return inflation.month_of_previous_year;
    }
    function get_something() public view returns(string memory){
        return inflation.something;
    }
    
    //START main_indicators_of_financial_market
    //foreign_currency_market
    function get_US_Dollar() public view returns(string memory){
        return main_indicators_of_financial_market.US_Dollar;
    }
    function get_Euro() public view returns(string memory){
        return main_indicators_of_financial_market.Euro;
    }
    
    //precious_metals
    function get_Gold() public view returns(string memory){
        return main_indicators_of_financial_market.Gold;
    }
    function get_Silver() public view returns(string memory){
        return main_indicators_of_financial_market.Silver;
    }
    function get_Platinum() public view returns(string memory){
        return main_indicators_of_financial_market.Platinum;
    }
    function get_Palladium() public view returns(string memory){
        return main_indicators_of_financial_market.Palladium;
    }
    
    //interbank_market
    function get_MIACR_1_day() public view returns(string memory){
        return main_indicators_of_financial_market.MIACR_1_day;
    }
    function get_MIACR_2_7_day() public view returns(string memory){
        return main_indicators_of_financial_market.MIACR_2_7_day;
    }
    function get_MIACR_8_30_day() public view returns(string memory){
        return main_indicators_of_financial_market.MIACR_8_30_day;
    }
    
    function get_RUONIA_1_day() public view returns(string memory){
        return main_indicators_of_financial_market.RUONIA_1_day;
    }
    
    function get_MosPrimeRate_1_day() public view returns(string memory){
        return main_indicators_of_financial_market.MosPrimeRate_1_day;
    }
    function get_MosPrimeRate_1_week() public view returns(string memory){
        return main_indicators_of_financial_market.MosPrimeRate_1_week;
    }
    function get_MosPrimeRate_1_month() public view returns(string memory){
        return main_indicators_of_financial_market.MosPrimeRate_1_month;
    }
    
    function get_ROISfix_1_week() public view returns(string memory){
        return main_indicators_of_financial_market.ROISfix_1_week;
    }
    function get_ROISfix_2_weeks() public view returns(string memory){
        return main_indicators_of_financial_market.ROISfix_2_weeks;
    }
    function get_ROISfix_1_month() public view returns(string memory){
        return main_indicators_of_financial_market.ROISfix_1_month;
    }
    //EMD main_indicators_of_financial_market
    
    //START international_reserves_of_the_russian_federation
    function get_international_reserves_of_the_russian_federation() public view returns(string memory){
        return international_reserves_of_the_russian_federation;
    }
    //END international_reserves_of_the_russian_federation
    
    //START banking_sector_liquidity_indicators
    function get_liquidity_deficit() public view returns(string memory){
        return banking_sector_liquidity_indicators.liquidity_deficit;
    }
    function get_correspondent_account_balances_in_RF() public view returns(string memory){
        return banking_sector_liquidity_indicators.correspondent_account_balances_in_RF;
    }
    function get_correspondent_account_balances_in_Moscow() public view returns(string memory){
        return banking_sector_liquidity_indicators.correspondent_account_balances_in_Moscow;
    }
    function get_total_volume_on_intraday_loans() public view returns(string memory){
        return banking_sector_liquidity_indicators.total_volume_on_intraday_loans;
    }
    function get_bank_deposits_with_bank_of_russia() public view returns(string memory){
        return banking_sector_liquidity_indicators.bank_deposits_with_bank_of_russia;
    }
    function get_bank_of_russia_bonds_in_circulation() public view returns(string memory){
        return banking_sector_liquidity_indicators.bank_of_russia_bonds_in_circulation;
    }
    function get_the_bank_of_russia_transactions_balance() public view returns(string memory){
        return banking_sector_liquidity_indicators.the_bank_of_russia_transactions_balance;
    }
    //END banking_sector_liquidity_indicators
    
    //START the_bank_of_russia_claims_on_the_credit_organizations
    function get_overnight_loans_debt() public view returns(string memory){
        return the_bank_of_russia_claims_on_the_credit_organizations.overnight_loans_debt;
    }
    function get_lombard_loans_debt() public view returns(string memory){
        return the_bank_of_russia_claims_on_the_credit_organizations.lombard_loans_debt;
    }
    function get_REPO_debt_auctions() public view returns(string memory){
        return the_bank_of_russia_claims_on_the_credit_organizations.REPO_debt_auctions;
    }
    function get_REPO_debt_fixed_rate() public view returns(string memory){
        return the_bank_of_russia_claims_on_the_credit_organizations.REPO_debt_fixed_rate;
    }
    function get_FX_swap_debt() public view returns(string memory){
        return the_bank_of_russia_claims_on_the_credit_organizations.FX_swap_debt;
    }
    function get_unsecured_lians_debt() public view returns(string memory){
        return the_bank_of_russia_claims_on_the_credit_organizations.unsecured_lians_debt;
    }
    function get_other_loans_debt() public view returns(string memory){
        return the_bank_of_russia_claims_on_the_credit_organizations.other_loans_debt;
    }
    //END the_bank_of_russia_claims_on_the_credit_organizations
    //END getters
}
