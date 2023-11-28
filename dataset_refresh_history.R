dataset_refresh_history <- function(access_token,
                                    dataset_id) {
  
  rs <- GET(glue::glue("https://api.powerbi.com/v1.0/myorg/admin/datasets/{dataset_id}/refreshes?$top=100"),
            add_headers("Authorization" = glue::glue("Bearer {token}")))
  
  out <- jsonlite::fromJSON(txt = content(rs, as = "text"))$value

  return(out)

}
