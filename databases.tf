/* STAGING DATABASE*/
resource snowflake_database "staging_db"{
    
    name = "${var.environment_short}_STAGING"

    is_transient = true

    comment = "Database for Daily Delta-Load. Requiers only 1 Day of Time Travel"

}

/*    
    Applying the Environment Tag to the Staging Database
*/

resource "snowflake_tag_association" "environment_tag_staging_db" {
 
    object_identifier {

        name = snowflake_database.staging_db.name

    }

    object_type = "DATABASE"
    tag_id      = snowflake_tag.environment_tag.id
    tag_value   = var.environment

    depends_on = [

        snowflake_tag.environment_tag,
        snowflake_database.staging_db

    ]

}

/*CORE DATABASE */

resource snowflake_database "core_db"{
    
    name = "${var.environment_short}_CORE"

    is_transient = false
    data_retention_time_in_days = 90

    comment = "Main DWH Database. Requiers 90 (Maximal) Day of Time Travel"

}

/*    
    Applying the Environment Tag to the Core Database
*/

resource "snowflake_tag_association" "environment_tag_core_db" {
 
    object_identifier {

        name = snowflake_database.core_db.name

    }

    object_type = "DATABASE"
    tag_id      = snowflake_tag.environment_tag.id
    tag_value   = var.environment

    depends_on = [

        snowflake_tag.environment_tag,
        snowflake_database.core_db

    ]

}

/*DATA_MART DATABASE */

resource snowflake_database "data_mart_db"{

    name = "PROD_DATA_MART"

    is_transient = true
    
    comment = "Database for Reporting. Doesn't require TimeTravel, because fully update every day."

}

/*    
    Applying the Environment Tag to the Data Mart Database
*/

resource "snowflake_tag_association" "environment_tag_data_marts_db" {
 
    object_identifier {

        name = snowflake_database.data_mart_db.id

    }

    object_type = "DATABASE"
    tag_id      = snowflake_tag.environment_tag.id
    tag_value   = var.environment

    depends_on = [

        snowflake_tag.environment_tag,
        snowflake_database.data_mart_db

    ]

}
