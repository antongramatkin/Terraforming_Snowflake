resource snowflake_database "service_db"{

    name = "${var.environment_short}_SERVICE"

    comment = "Service Database to store objects like Tags and so on"
}

resource "snowflake_tag" "environment_tag" {
  
    database = snowflake_database.service_db

    schema = "PUBLIC"

    name = "Environment"

    comment = "Tag to separate ENvironments"

}