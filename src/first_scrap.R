library(rvest)
library(dplyr)

url_la_liga <- "https://sports.caliente.mx/es_MX/La-Liga"
html <- read_html(url_la_liga) # Lee el url para traer todos los elementos de la página

main_area <- html |>
  html_elements("#main-area") # Jala los elementos con id="main-area"
main_area |>
  html_text2() # Muestra como texto

mkt_elements <- html |>
  html_elements(".mkt") # Jala los elementos con clase class="mkt"
mkt_elements |>
  html_text2() # Muestra como texto


tabla <- html |>
  html_elements("table") # Jala los elementos con clase tabla (class="table")

# Jala (a mano) los datos de la Liga MX (que están en el elemento 3)
tabla_ligamx <- tabla[1] |> html_table()
tabla_ligamx[[1]][, c("X5", "X6", "X7")] |>
  mutate(
    X5 = str_replace_all(X5, "\n", " "),
    X6 = str_replace_all(X6, "\n", " "),
    X7 = str_replace_all(X7, "\n", " ")
  )
