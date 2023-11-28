get_access_token <- function(tenant_id,
                             client_id,
                             client_secret,
                             resource = "https://analysis.windows.net/powerbi/api",
                             grant_type = "client_credentials") {
  
  payload <- list('grant_type' = grant_type,
                  'client_id' = client_id,
                  'client_secret' = client_secret,
                  'resource' = resource)
  
  response <- httr::POST(glue::glue("https://login.windows.net/{tenant_id}/oauth2/token"),
                   body = payload,
                   encode = "form")

  out <- httr::content(response)$access_token

  return(out)
  
}
