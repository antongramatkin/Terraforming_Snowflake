provider "snowflake" {
    username = var.snowflake_account_admin
    account = var.snowflake_account
    region = var.snowflake_region

    password = var.snowflake_accountadmin_pass

    role = "ACCOUNTADMIN"
    warehouse = "COMPUTE_WH"

}
