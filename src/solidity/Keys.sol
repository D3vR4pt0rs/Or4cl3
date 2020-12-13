// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

contract KeyInds {
    
    
    //START Owner block
    address private owner;
    
    event OwnerSet(address indexed oldOwner, address indexed newOwner);
    event Beacon();
    
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
    
    function refreshData() public {
        emit Beacon();
    }
    
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
    
    
    function set_all_inflation(string memory inflation_target, string memory month_of_previous_year, string memory something) public{
        inflation.inflation_target = inflation_target;
    
        inflation.month_of_previous_year = month_of_previous_year;
        inflation.something = something;
    }
    
    function set_all_foreign_currency_market(string memory US_Dollar, string memory Euro) public{
        //foreign_currency_market
        main_indicators_of_financial_market.US_Dollar = US_Dollar;
        
        main_indicators_of_financial_market.Euro = Euro;
    }
    
    function set_all_precious_metals(string memory gold, string memory silver, string memory platinum, string memory palladium) public{
        main_indicators_of_financial_market.Gold = gold;
        
        main_indicators_of_financial_market.Silver = silver;
        
        main_indicators_of_financial_market.Platinum = platinum;
        
        main_indicators_of_financial_market.Palladium = palladium;
    }
    
    function set_all_interbank_market(string memory MIACR_1_day, string memory MIACR_2_7_day, string memory MIACR_8_30_day, string memory RUONIA_1_day, string memory MosPrimeRate_1_day, string memory MosPrimeRate_1_week, string memory MosPrimeRate_1_month, string memory ROISfix_1_week, string memory ROISfix_2_weeks, string memory ROISfix_1_month) public{
        
        //interbank_market
        main_indicators_of_financial_market.MIACR_1_day = MIACR_1_day;
        
        main_indicators_of_financial_market.MIACR_2_7_day = MIACR_2_7_day;
        
        main_indicators_of_financial_market.MIACR_8_30_day = MIACR_8_30_day;
        
    
        main_indicators_of_financial_market.RUONIA_1_day = RUONIA_1_day;
        
        main_indicators_of_financial_market.MosPrimeRate_1_day = MosPrimeRate_1_day;
        
        main_indicators_of_financial_market.MosPrimeRate_1_week = MosPrimeRate_1_week;
        
        main_indicators_of_financial_market.MosPrimeRate_1_month = MosPrimeRate_1_month;
        
        
        main_indicators_of_financial_market.ROISfix_1_week = ROISfix_1_week;
        
        main_indicators_of_financial_market.ROISfix_2_weeks = ROISfix_2_weeks;
        
        main_indicators_of_financial_market.ROISfix_1_month = ROISfix_1_month;
    }
    
    function set_all_international_reserves_of_the_russian_federation(string memory international_reserves_of_the_russian_federation_val) public{
        international_reserves_of_the_russian_federation = international_reserves_of_the_russian_federation_val;
    }
    
    function set_all_banking_sector_liquidity_indicators(string memory liquidity_deficit, string memory correspondent_account_balances_in_RF, string memory correspondent_account_balances_in_Moscow, string memory total_volume_on_intraday_loans, string memory bank_deposits_with_bank_of_russia, string memory bank_of_russia_bonds_in_circulation, string memory the_bank_of_russia_transactions_balance) public{
        banking_sector_liquidity_indicators.liquidity_deficit = liquidity_deficit;
        
        banking_sector_liquidity_indicators.correspondent_account_balances_in_RF = correspondent_account_balances_in_RF;
        
        banking_sector_liquidity_indicators.correspondent_account_balances_in_Moscow = correspondent_account_balances_in_Moscow;
        
        banking_sector_liquidity_indicators.total_volume_on_intraday_loans = total_volume_on_intraday_loans;
        
        banking_sector_liquidity_indicators.bank_deposits_with_bank_of_russia = bank_deposits_with_bank_of_russia;
        
        banking_sector_liquidity_indicators.bank_of_russia_bonds_in_circulation = bank_of_russia_bonds_in_circulation;
        
        banking_sector_liquidity_indicators.the_bank_of_russia_transactions_balance = the_bank_of_russia_transactions_balance;
    }
    
    function set_all_the_bank_of_russia_claims_on_the_credit_organizations(string memory overnight_loans_debt, string memory lombard_loans_debt, string memory REPO_debt_auctions, string memory REPO_debt_fixed_rate, string memory FX_swap_debt, string memory unsecured_lians_debt, string memory other_loans_debt) public{
        
        the_bank_of_russia_claims_on_the_credit_organizations.overnight_loans_debt = overnight_loans_debt;
        
        the_bank_of_russia_claims_on_the_credit_organizations.lombard_loans_debt = lombard_loans_debt;
        
        the_bank_of_russia_claims_on_the_credit_organizations.REPO_debt_auctions = REPO_debt_auctions;
        
        the_bank_of_russia_claims_on_the_credit_organizations.REPO_debt_fixed_rate = REPO_debt_fixed_rate;
        
        the_bank_of_russia_claims_on_the_credit_organizations.FX_swap_debt = FX_swap_debt;
        
        the_bank_of_russia_claims_on_the_credit_organizations.unsecured_lians_debt = unsecured_lians_debt;
        
        the_bank_of_russia_claims_on_the_credit_organizations.other_loans_debt = other_loans_debt;
    
    }
}
