
library(shiny)
library(shinythemes)
library(dplyr)
library(ggplot2)
library(shinyjs)
library(bslib)
library(shinypanels)
library(shinydashboard)
library(shinydashboardPlus)
library(leaflet)
library(sf)
library(tmap)
library(htmlwidgets)
library(leaflet.extras)
library(DT)
library(plotly)
### To start designing the UI for this tiny,I first considered whether to use dashboardPage or navbarPage, 
### and since my application needed a clean interface and quick navigation, I chose navbarPage.


ui <- navbarPage(
     theme = "my.css",
     #theme = shinytheme("quartz"),
     id = "tabs",
     title=div(
          tags$img(src = "logo2.png", height = "30px", style = "float: left; margin-right: 10px;"),
          div('Cape Verde', style = "font-size: 25px; float: left; line-height: 50px;"),
          style = "clear: both;"
     ),
                 
                 ## a comment for each interface component sounds like
                 ## a good idea.
     
tags$head(tags$script(src = "https://kit.fontawesome.com/97196b194b.js"
                      ),
          tags$style(HTML("
      .icon-text-container {
      font-size: 23px;
      }
      .icon-text-container:hover .fa-asterisk,
      .icon-text-container:hover .fa-chart-simple,
      .icon-text-container:hover .fa-earth-africa,
      .icon-text-container:hover .fa-sheet-plastic,
      .icon-text-container:hover .fa-map,
      .icon-text-container:hover .fa-house{
        animation: bounce 1s infinite;
      }
      @keyframes bounce {
        0%, 100% { transform: translateY(0); }
        50% { transform: translateY(-15px); }
      }
                          .info-box .info-box-text {
                               font-size: 20px;
                          }
                          .info-box .info-box-number {
                               font-size: 20px;
                          }
                          .centered-text {
                text-align: center;
                margin-left: auto;
                margin-right: auto;
            }
            .centered-img {
                display: block;
                margin-left: auto;
                margin-right: auto;
                width: 80%;
            }
            #header-container {
                width: 100%;
                text-align: center; /* This centers the inner content */
                margin-bottom: 20px; /* Provide some space below the header */
            }
            #logo {
                width: 100px;
                height: auto;
                display: inline-block;
                margin: auto;
            }"
    ))
          ),

     nav_panel(title =tags$div(
          class = "icon-text-container",
          tags$i(class = "fa-solid fa-house"),
        "Welcome"
       ),
       
       # titlePanel("Cape Verde Explorer",windowTitle = "Cape Verde Explorer"),
       verticalLayout(
            div(id='header-container',
                img(src="logo2.png", id="logo", style = "width:18%;")
            ),
       div(class = "centered-text", 
           fluidRow(
                 p("Cape Verde Explorer", style = "font-family: 'Times New Roman', Times, serif;font-weight: bold;text-align: center; font-size: 60px;"),
                 p("by Ruicheng Zhang", style = "font-family: 'Times New Roman', Times, serif;font-weight: bold;text-align: center; font-size: 40px;"),
                 p("This is a website that shows extensive maps, tables,images and data analysis are used to provide information for users to explore.", style="font-size: 21px;"),
                 p("This project collects most of the data on Cape Verde and then displays it on the appropriate boards.", style="font-size: 21px;"),
                 p("Users can explore interactive maps, retrieve necessary data and use interactive icons.", style="font-size: 21px;"),
                 p("The program contains the following interesting highlights：", style="font-size: 21px;"),
                 p("1.When the mouse hovers over the top drop-down menu (e.g. Welcome), the icon will pop up."),
                 p("2.Two new shortcut buttons have been added to the interactive map"),
                 p("3.All plot outputs use an interactive design"),
                 p("4.Simple and generous UI design"),
                 p("Please contact me if you have any questions."),
                 p("BU-Email: rz2n@bu.edu")
            )
            ))
       ),
       

     navbarMenu(title =tags$div(
          class = "icon-text-container",
          tags$i(class = "fa-regular fa-map"),
          "Geography"
                ),
                tabPanel(title= div(h3('Location in the World', style="font-size: 21px;")),
                         box(h3("World Map"),p("(The last two buttons on the left side of the map allow for quick travel)",style ="font-size: 15px;"),
                         leafletOutput("map1",height = "80vh")),
                         box(h3("Satellite Map"),p("(The last two buttons on the left side of the map allow for quick travel)",style ="font-size: 15px;"),
                         leafletOutput("map2",height = "80vh")
                         )),
                tabPanel(title= div(h3('Country Map', style="font-size: 21px;")),
                         wellPanel(tags$h3("City Map"),tags$p("(The last two buttons on the left side of the map allow for quick travel; And The search function in the upper right hand corner can also be helpful)",style ="font-size: 15px;"),
                         leafletOutput("map3",height = "60vh")),
                         wellPanel(tags$h3("Satellite Map"),tags$p("(The last two buttons on the left side of the map allow for quick travel; And The search function in the upper right hand corner can also be helpful)",style ="font-size: 15px;"),
                         leafletOutput("map4",height = "60vh"))
     )
     ),

     navbarMenu(title =tags$div(
          class = "icon-text-container",
          tags$i(class = "fa-solid fa-sheet-plastic"),
          "General Information"
     ),

                tabPanel(title= div(h3('About Cape Verde', style="font-size: 21px;")),
                         fluidRow(
                              column(6, 
                                     wellPanel(h3("About Cape Verde",style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 27px;"),
                                     p("A country comprising a group of islands that lie 385 miles (620 km) off the west coast of Africa. Praia, on Santiago, is the capital. Cape Verde shares maritime borders with Gambia, Guinea-Bissau, Mauritania, and Senegal.s. It is divided into two island groups, the Barlavento (windward) islands with the islands of Santo Antão, São Vicente, Santa Luzia, São Nicolau, Sal, and Boa Vista and the Sotavento (leeward) islands with the islands of Maio, Santiago, Fogo, and Brava.",
                                       style = "font-family: Arial, sans-serif; font-size: 18px;"),
                                     img(src="image0.png", height = 200, width = 300)
                                     )),
                              column(6, 
                                     wellPanel(h4("Geographical and Historical Background",style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 24px;"),
                                     p("Cape Verde, officially the Republic of Cabo Verde, is an island nation in West Africa, located in the central Atlantic Ocean. It consists of ten volcanic islands, covering a total area of about 4,033 square kilometers. These islands, part of the Macaronesia ecoregion, are situated some 600 to 850 kilometers off the African coast. Historically, the archipelago was uninhabited until the 15th century when discovered and colonized by the Portuguese, becoming the first European settlement in the tropics.",
                                       style = "font-family: Arial, sans-serif; font-size: 18px;"),
                                     img(src="image1.jpg", height = 200, width = 300)
                              )),
                              column(6, 
                                     wellPanel(h4("Economic and Cultural Development",style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 24px;"),
                                     p("Initially, Cape Verde played a significant role in the Atlantic slave trade, leading to economic prosperity in the 16th and 17th centuries. However, the 19th-century decline of the slave trade brought economic challenges and emigration. The islands' economy gradually recovered by serving as a commercial center and stopover for shipping routes. The cultural fusion of European and African traditions is evident in Cape Verde’s Crioulo language, music, and textiles.",
                                       style = "font-family: Arial, sans-serif; font-size: 18px;"),
                                     img(src="image2.jpg", height = 200, width = 300)
                              )),
                              column(6, 
                                     wellPanel(h4("Political Landscape and Population",style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 24px;"),
                                     p("After gaining independence from Portugal in 1975, Cape Verde established itself as a stable representative democracy, one of the most developed and democratic countries in Africa. Its economy is primarily service-oriented, focusing on tourism and foreign investment. The population, around 483,628 according to the 2021 Census, displays a mix of African and European heritage, predominantly Roman Catholic, reflecting Portuguese influence. The country also has a significant diaspora community, especially in the United States and Portugal.",
                                       style = "font-family: Arial, sans-serif; font-size: 18px;"),
                                     img(src="image3.jpg", height = 200, width = 300)
                              )),
                              column(6, 
                                     wellPanel( h4("Language and Major Islands",style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 24px;"),
                                     p("Portuguese is the official language of Cape Verde, used in government, education, and media, while Cape Verdean Creole is spoken by the majority. The most populous island is Santiago, home to the capital city, Praia. Other significant islands include São Vicente with the major port of Mindelo, as well as Santo Antão, Fogo, and Sal, each with its own unique characteristics and contributions to the nation's profile.",
                                       style = "font-family: Arial, sans-serif; font-size: 18px;"),
                                     img(src="image4.jpg", height = 200, width = 300)
                              )),
                              column(6, 
                                     wellPanel(h4("Environmental Challenges and Infrastructure",style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 24px; "),
                                     p("The islands exhibit varying landscapes and climatic conditions. The eastern islands, arid and focused on tourism, contrast with the more populous western islands, where agriculture is challenged by soil and vegetation degradation. Mindelo's port on São Vicente Island stands out as a historical deepwater harbor, crucial for refueling and resupplying ships since the 19th century. Despite environmental challenges, Cape Verde continues to develop its infrastructure to support its growing economy and population.",
                                       style = "font-family: Arial, sans-serif; font-size: 18px;"),
                                     img(src="image5.jpg", height = 200, width = 300)
                              ))
                         )

                          )),

     ## Key demographics
     navbarMenu(title =tags$div(
          class = "icon-text-container",
          tags$i(class = "fa-solid fa-chart-simple"),
          "Demographics"
     ),
     tabPanel(title = div(h3('Current Data', style="font-size: 21px;")),
              verticalLayout(
                   fluidRow(
                        column(width = 5,
                               wellPanel(
                                    tags$h3("Demographics of Cape Verde"),
                                    tags$p("This is the current demographics of Cape Verde, and I have visualized and tabulated the data. Using the slider on the right, the user can select the x cities with the highest populations for easier viewing."
                                           , style="font-size: 18px;")
                               )
                        ),
                        column(width = 2,
                               wellPanel(
                                    infoBoxOutput("AveragePopulation", width = "100%"),
                                    infoBoxOutput("TotalPopulation", width = "100%")
                               )
                        ),
                        column(width = 5,
                               wellPanel(
                                         tags$h3("Control Panel"),
                                         sliderInput("numCities", "Number of Cities:", width = "100%",
                                                     min = 1, max = 100, value = 10)
                                    
                               )
                        )
                   ),
                  tabsetPanel(tabPanel("Graph",
                                       splitLayout(cellWidths = c("50%", "50%"),
                                            leafletOutput("heat",width = "100%", height = "550px"),
                                            plotlyOutput("barPlot",width = "100%", height = "550px")
                                                   
                                                   )
                       ),
                              tabPanel("Table",DTOutput("datasummery")))
     )
     ),
     tabPanel(title = div(h3('Population change', style="font-size: 21px;")),
              fluidRow(
                   column(width = 7,
                          wellPanel(
                               tags$h3("Changes in population size"),
                               tags$p("Here I have used two different data from 'UN data', population data for the last 60 years and male and female population data from 1985-2005, to visualize them separately.User is able to visualize the population change in Cape Verde in terms of gender comparisons and trends respectively.", style = "font-size: 18px;")
                          ),
                          wellPanel(tags$h3("Population change before and after the last 60 years"),tags$p("(Projections of population trends over the next 70 years based on data from the previous 60 years)",style ="font-size: 15px;"),
                               plotlyOutput("populationPlot")
                          )
                   ),
                   column(width = 5,
                          wellPanel(
                               titlePanel("Comparison Of Gender Over Years"),
                               sliderInput("yearSlider", "Year:", min = 1985, max = 2005, value = 2000),
                               plotlyOutput("genderPlot")
                          )
                   )
              )
              
              
              
              
              )),
     ## general information tab

      navbarMenu(title =tags$div(
           class = "icon-text-container",
           tags$i(class = "fa-solid fa-earth-africa"),
           "Status Analysis"
      ),

                 tabPanel(title= div(h3('Nearby Islands', style="font-size: 21px;")),
                          fluidRow(
                               wellPanel( tabsetPanel(
                                    tabPanel("Macaronesia", 
                                             icon = icon("home", lib = "font-awesome"),
                                             fluidRow(
                                                  column(3, 
                                                         h3("The Macaronesia islands",style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 24px; "),
                                                         p("Macaronesia is a unique biogeographical region in the North Atlantic Ocean, encompassing several groups of islands that include the",strong(" Azores, Madeira, the Canary Islands, Cape Verde, and the Savage Islands."),
                                                           "These islands are not geographically contiguous but are grouped together due to their shared ecological characteristics, geological origins, and cultural ties.",
                                                           style = "font-family: Arial, sans-serif; font-size: 18px;")
                                                  ),
                                                  column(4,
                                                         img(src="image6.png", style = "width:75%;")
                                                  ),
                                                  column(5,
                                                         img(src="image7.png", style = "width:60%;")
                                                  )
                                             )
                                    ),
                                    tabPanel("Azores",
                                             fluidRow(
                                                  column(6, 
                                                         h3("Azores",style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 24px;"),
                                                         p("The Azores, an autonomous region of Portugal located in the North Atlantic Ocean, is a unique archipelago comprising nine volcanic islands. With a population of around 250,000, it exhibits a varied demographic profile. Economically, the Azores contribute notably to Portugal's GDP, although its GDP per capita remains lower than the mainland. The economy, showing a moderate growth rate, is bolstered by sectors like tourism, agriculture, and fisheries.Natural resources are limited, with some volcanic materials being the primary mineral deposits. In terms of social development, the Azores boasts a robust education system and a well-developed healthcare infrastructure, contributing to a high quality of life index. The region enjoys a clean environment, low crime rates, and strong community bonds, making it an attractive place for both residents and visitors.Politically, the Azores maintains stability as an autonomous region under the Portuguese government, with a regional government handling local affairs. ",
                                                           style = "font-family: Arial, sans-serif; font-size: 18px; ")
                                                  ),
                                                  column(6,
                                                         img(src="azore.jpeg", style = "width:100%;")
                                                  )
                                             )
                                    ),
                                    tabPanel("Madeira",
                                             fluidRow(
                                                  column(6, 
                                                         h3("Madeira Island",style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 24px; "),
                                                         p("Madeira Island, often referred to as the Pearl of the Atlantic,is a captivating and diverse destination. It forms part of an autonomous region of Portugal, along with the islands of Porto Santo, Desertas, and Selvagens. Madeira is situated approximately 550 miles west of the Moroccan city of Casablanca and boasts a semi-tropical climate.Today, Madeira is known for its rugged mountains, lush slopes, and a coastline that is frequently lashed by Atlantic breakers. The capital city, Funchal, is home to about half of the island's quarter-million residents.Madeira's economy is diverse, with tourism playing a significant role. Culturally, Madeira is rich in traditions, with locals celebrating various festivals throughout the year, including flower, organ, philharmonic, and wine festivals. The cuisine is noted for being both healthy and flavorful, and the island is also known for its unique wine.For outdoor enthusiasts, Madeira offers a variety of activities. The island's levadas, or irrigation channels, provide unique hiking and trail running opportunities.",
                                                           style = "font-family: Arial, sans-serif; font-size: 18px; ")
                                                  ),
                                                  column(6,
                                                         img(src="Madeira.jpg", style = "width:100%;")
                                                  )
                                             )
                                    ),
                                    tabPanel("Canary",
                                             fluidRow(
                                                  column(6, 
                                                         h3("The Canary Islands",style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 24px; "),
                                                         p("The Canary Islands, an autonomous community of Spain, are a group of Spanish islands located in the Atlantic Ocean, near the northwest coast of Africa. Known for their diverse landscapes, the islands include famous destinations like Tenerife, Gran Canaria, Lanzarote, and Fuerteventura, among others. The Canary Islands are home to unique flora and fauna, with a high degree of endemism. The diverse ecosystems range from laurel forests to desert-like areas.Tourism is a major economic driver in the Canary Islands, attracting millions of visitors annually. The islands are also known for their agricultural products, including bananas and wine.The Canary Islands have a rich cultural heritage influenced by Spanish and indigenous traditions. Festivals, music, and dance play a significant role in the islands' cultural life.",
                                                           style = "font-family: Arial, sans-serif; font-size: 18px; ")
                                                  ),
                                                  column(6,
                                                         img(src="Canary.jpg", style = "width:100%;")
                                                  )
                                             )
                                    ),
                                    tabPanel("Savage",
                                             fluidRow(
                                                  column(6, 
                                                         h3("The Savage Islands",style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 24px; "),
                                                         p("The Savage Islands, also known as the Selvagens Islands, are a small Portuguese archipelago in the North Atlantic Ocean. Located 280 kilometers south of Madeira and 165 kilometers north of the Canary Islands, they form part of the Macaronesia region. The archipelago comprises two main islands, Selvagem Grande and Selvagem Pequena, surrounded by a cluster of islets and reefs, covering a total area of 2.73 km².The Portuguese government closely protects the bird populations and nearby waters.The islands are largely uninhabited, with no permanent residents. ",
                                                           style = "font-family: Arial, sans-serif; font-size: 18px; ")
                                                  ),
                                                  column(6,
                                                         img(src="Savage.jpg", style = "width:80%;")
                                                  )
                                             )
                                    )
                               ))
                          ),
                          fluidRow(
                               plotlyOutput("pop1")
                          )
                 
                      ),

                 tabPanel(title= div(h3('SWOT', style="font-size: 21px;")),
                          wellPanel(fluidRow(
                               column(6,
                                      #splitLayout(cellWidths = c("50%", "50%"),
                                      h3(HTML("<span style='font-size: 300%;'>S</span>trength"),style = "font-family: 'Times New Roman', Times, serif;font-size: 28px;font-weight: bold; "),
                                      p("Cabo Verde's geographic position is advantageous for maritime routes and international trade.The country is known for its stable democratic governance, which is conducive to economic development. With beautiful beaches and a pleasant climate, Cabo Verde is an attractive tourist destination.The country has potential in renewable energy, particularly wind and solar power. Cabo Verde performs better in innovation outputs than inputs, indicating a capacity to effectively utilize resources for innovative ends.",
                                        style = "font-family: Arial, sans-serif; font-size: 18px; "),
                                      h3(HTML("<span style='font-size: 300%;'>W</span>eakness"),style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 28px; "),
                                      p("The economy heavily relies on tourism, making it vulnerable to global economic fluctuations.Cabo Verde has limited natural resources, which constrains economic diversification.The country faces challenges with water scarcity and relies on costly desalination.Weakness in market sophistication, including issues in business environment and ease of resolving insolvency.",
                                        style = "font-family: Arial, sans-serif; font-size: 18px; ")
                               ),
                               column(6,
                                      img(src = "image8.jpg", style = "width:100%;")
                               )
                          )),
                          wellPanel(fluidRow(
                               column(6,
                                      h3(HTML("<span style='font-size: 300%;'>O</span>pportunities"),style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 28px; "),
                                      p("Investment in renewable energy can reduce dependence on imported fuels and foster sustainable development.Potential to diversify tourism offerings, including eco-tourism and cultural tourism.Strengthening international partnerships, particularly with the European Union, for economic development.Opportunities exist in fisheries and agriculture sectors, given the high importation of food.",
                                        style = "font-family: Arial, sans-serif; font-size: 18px; "),
                                      h3(HTML("<span style='font-size: 300%;'>T</span>hreats"),style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 28px; "),
                                      p(" As an island nation, Cabo Verde is vulnerable to the impacts of climate change, including sea-level rise. The reliance on tourism makes the economy susceptible to global economic downturns.The scarcity of freshwater poses a long-term threat to sustainable development. High dependence on imported food makes the country vulnerable to global food price volatility.",
                                        style = "font-family: Arial, sans-serif; font-size: 18px; ")
                               ),
                               column(5,
                                      img(src = "image9.jpg", style = "width:120%;")
                               )
                          )
                       )),
                 tabPanel(title= div(h3('Local Climate', style="font-size: 21px;")),
                          titlePanel(tags$h1("In analyzing WEAKNESS, we found that Cape Verde is highly impacted by climate change.So next, we visualized climate change in four ways.",style = "font-family: 'Times New Roman', Times, serif;font-weight: bold; font-size: 24px; ")),
                          wellPanel(fluidRow(
                               column(6, img(src="ca.jpg", style = "width:100%;")),
                               column(6, img(src="ca2.jpg", style = "width:90%;"))
                          ),
                          fluidRow(
                               column(6, img(src="ca3.jpg", style = "width:100%;")),
                               column(6, img(src="ca4.jpg", style = "width:90%;"))
                          ))
                    
                       )
      ),



       navbarMenu(title =tags$div(
            class = "icon-text-container",
            tags$i(class = "fa-solid fa-asterisk"),
            "Bibliogrphy"
       ),
                      align = "right",
                      tabPanel(tags$a(href="https://en.wikipedia.org/wiki/Cape_Verde",
                                      "Wikipedia/Cape_Verde")),
                      tabPanel(tags$a(href="https://www.shinyapps.io/",
                                      "shinyapps.io for publishing")),


                      tabPanel(tags$a(href="https://simplemaps.com/data/cv-cities",
                                      "Population Data")),

                      tabPanel(tags$a(href = "https://www.cia.gov/the-world-factbook/countries/cabo-verde/images",
                                      "cabo-verde_gov")),
                      tabPanel(tags$a(href="https://data.un.org/Data.aspx?q=Cabo+Verde&d=PopDiv&f=variableID%3a12%3bcrID%3a132",
                                      "Data form UN-data")),
                      tabPanel(tags$a(href="https://www.nature.com/articles/s41598-019-51786-6",
                                      "Photo of Macaronesia")),
                      tabPanel(tags$a(href="https://climatedata.imf.org/pages/country-data",
                                      "Climate Change"))


                 )

)

cape_verde_geojson <- sf::st_read("./data/gadm41_CPV_1.json")
cape_verde_country <- st_read("./data/gadm41_CPV_shp/gadm41_CPV_0.shp")
cape_verde_region <- st_read("./data/gadm41_CPV_shp/gadm41_CPV_1.shp")
centroids <- st_centroid(cape_verde_region)

server <- function(input, output, session) {
     ## MAPS
     output$map1 <- renderLeaflet({
          bounds <- st_bbox(cape_verde_geojson)
          
          leaflet() %>%
               addTiles(urlTemplate = "https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}") %>%
               #addProviderTiles(providers$CartoDB.Positron) %>%
               addPolygons(data = cape_verde_geojson, weight = 1, color = "#ff7800") %>%
               addRectangles(
                    lng1 = -25.3618, lat1 = 14.8018,
                    lng2 = -22.6568, lat2 = 17.2054,
                    color = "red", fill = FALSE, weight = 8
               ) %>%
               fitBounds(-115, -41.7, 52.4, 61.9) %>%
               addEasyButton(easyButton(
               icon = "fa-globe", title = "World",
               onClick = JS("function(btn, map){ map.setView([0, 0], 2); }")
          )) %>%
               addEasyButton(easyButton(
                    icon = "fa-flag", title = "Country",
                    onClick = JS("function(btn, map){ map.fitBounds([[14.8018, -25.3618], [17.2054, -22.6568]]); }")
               ))
     })
     
     
     output$map2 <- renderLeaflet({
          bounds <- st_bbox(cape_verde_geojson)
          
          leaflet() %>%
               addTiles(urlTemplate = "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}
") %>%
               #addProviderTiles(providers$CartoDB.Positron) %>%
               addPolygons(data = cape_verde_geojson, weight = 1, color = "#ff7800") %>%
               addRectangles(
                    lng1 = -25.3618, lat1 = 14.8018,
                    lng2 = -22.6568, lat2 = 17.2054,
                    color = "red", fill = FALSE, weight = 8
               ) %>%
               fitBounds(-115, -41.7, 52.4, 61.9) %>%
               addEasyButton(easyButton(
                    icon = "fa-globe", title = "World",
                    onClick = JS("function(btn, map){ map.setView([0, 0], 2); }")
               )) %>%
               addEasyButton(easyButton(
                    icon = "fa-flag", title = "Country",
                    onClick = JS("function(btn, map){ map.fitBounds([[14.8018, -25.3618], [17.2054, -22.6568]]); }")
               ))
     })
     output$map3 <- renderLeaflet({
          leaflet() %>%
               addTiles() %>% 
               addPolygons(data = cape_verde_country, color = "#d14636", weight = 1, opacity = 1, fillOpacity = 0.3) %>%
               addPolygons(data = cape_verde_region, color = "#f9faf0", weight = 1, opacity = 1, fillOpacity = 0.3) %>%
               addLabelOnlyMarkers(data = centroids, label = ~NAME_1, labelOptions = labelOptions(noHide = TRUE, direction = 'auto')) %>%
               fitBounds(lng1 = -23.587164, lat1 = 14.89958382, lng2 = -23.45402527, lat2 = 14.99285984) %>%
               addSearchOSM(options = searchOptions(collapsed = FALSE, position = "topright")) %>%
          addEasyButton(easyButton(
               icon = "fa-globe", title = "Country",
               onClick = JS(sprintf("function(btn, map){ map.fitBounds([[14.8018, -25.3618], [17.2054, -22.6568]]); }")
               )
          )) %>%
               addEasyButton(easyButton(
                    icon = "fa-building", title = "City",
                    onClick = JS(sprintf("function(btn, map){ map.fitBounds([[14.89958382, -23.587164], [14.99285000, -23.45402527]]); }")
                    )))
     })
     output$map4 <- renderLeaflet({
          leaflet() %>%
               addTiles(urlTemplate = "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}
") %>%
               #addPolygons(data = cape_verde_country, color = "#0000ff", weight = 1, opacity = 1, fillOpacity = 0.3) %>%
               addPolygons(data = cape_verde_region, color = "#f9faf0", weight = 1, opacity = 1, fillOpacity = 0.3) %>%
               addLabelOnlyMarkers(data = centroids, label = ~NAME_1, labelOptions = labelOptions(noHide = TRUE, direction = 'auto')) %>%
               fitBounds(lng1 = -23.587164, lat1 = 14.89958382, lng2 = -23.45402527, lat2 = 14.99285984) %>%
               addSearchOSM(options = searchOptions(collapsed = FALSE, position = "topright")) %>%
          addEasyButton(easyButton(
               icon = "fa-globe", title = "Country",
               onClick = JS(sprintf("function(btn, map){ map.fitBounds([[14.8018, -25.3618], [17.2054, -22.6568]]); }")
               )
          )) %>%
               addEasyButton(easyButton(
                    icon = "fa-building", title = "City",
                    onClick = JS(sprintf("function(btn, map){ map.fitBounds([[14.89958382, -23.587164], [14.99285000, -23.45402527]]); }")
                    )))
     })
     ## demographics data
     city_data <- read.csv("./data/cv.csv")
     city_data_sf <- st_as_sf(city_data, coords = c("lng", "lat"), crs = 4326)
     output$AveragePopulation <- renderInfoBox({
          avg_pop <- mean(city_data$population, na.rm = TRUE)
          infoBox(
               "Average Population", 
               format(round(avg_pop, 0), big.mark = ","), 
               icon = icon("users", lib = "font-awesome"),
               color = "green",fill = TRUE
          )
     })
     
     output$TotalPopulation <- renderInfoBox({
          total_pop <- sum(city_data$population, na.rm = TRUE)
          infoBox("Total Population", 
               format(round(total_pop, 0), big.mark = ","), 
               color = "purple", fill = TRUE
          )
     })
     
     output$datasummery <- renderDT({
          top_cities <- city_data %>%
               arrange(desc(population)) %>%
               head(input$numCities)
          datatable(top_cities)
     })
     # demographics plot
     output$heat <- renderLeaflet({
          tm <- tm_shape(city_data_sf) +
               tm_bubbles(size = "population", col = "population", 
                          style = "quantile", palette = "Blues", border.col = "black") +
               tm_layout(legend.position = c("left", "bottom"))
          
          tmap_leaflet(tm)
     })
     
     output$barPlot <- renderPlotly({
          top_cities <- city_data %>%
               arrange(desc(population)) %>%
               head(input$numCities)
          plot_ly(top_cities, x = ~city, y = ~population, type = 'bar', 
                  marker = list(color = 'rgb(102,194,165)'),
                  hoverinfo = 'text', text = ~paste("city:", city, "<br>population:", population)) %>%
               layout(title = 'Distribution of City population',
                      xaxis = list(title = 'city'),
                      yaxis = list(title = 'population'),
                      showlegend = FALSE,
                      plot_bgcolor = 'rgba(245, 246, 249, 1)',
                      margin = list(b = 80, l = 80, t = 50, r = 50)
               )
     })
     
## new data
gender_data <- read.csv("./data/gender.csv")
population_data <- read.csv("./data/pop.csv")
     output$genderPlot <- renderPlotly({
          filtered_data <- gender_data[gender_data$Year == input$yearSlider, ]
          plot_ly(data = filtered_data, x = ~Value, y = ~group, type = 'bar', orientation = 'h',
                  marker = list(color = 'rgba(58, 200, 225, 0.5)', line = list(color = 'rgba(58, 200, 225, 1)', width = 1))) %>%
          layout(title = paste('Population by Gender in', input$yearSlider),
                      xaxis = list(title = 'Population'),
                      yaxis = list(title = ''),
                      hoverinfo = 'text', text = ~paste('Population:', Value),
                      showlegend = FALSE,
                      plot_bgcolor = 'rgba(245, 246, 249, 1)',
                      margin = list(b = 40, l = 100, t = 40, r = 30)
               )
     })
     output$populationPlot <- renderPlotly({
          existing_data <- population_data[population_data$Year <= 2021, ]
          forecast_data <- population_data[population_data$Year > 2021, ]
          plot_ly() %>%
               add_lines(data = existing_data, x = ~Year, y = ~Value, name = 'Existing Data', 
                         line = list(color = 'skyblue')) %>%
               add_lines(data = forecast_data, x = ~Year, y = ~Value, name = 'Forecast Trends', 
                         line = list(color = 'darkblue')) %>%
               layout(title = 'Population Over Years',
                      xaxis = list(title = 'Year'),
                      yaxis = list(title = 'Population'),
                      legend = list(x = 0.1, y = 0.9))
     })
     #Nearby Islands
     output$pop1<- renderPlotly({
          locations <- c("Canary Islands", "Cape Verde", "Madeira", "Azores")
          population <- c(2172944, 561901, 250769, 236440)
          percentages <- c(67, 17, 8, 7)
          colors <- c('rgba(255, 99, 132, 0.6)', 'rgba(54, 162, 235, 0.6)',
                      'rgba(255, 206, 86, 0.6)', 'rgba(75, 192, 192, 0.6)')
          plot_ly(x = locations, y = population, type = 'bar', 
                  text = ~paste(population, 'people (', percentages, '%)', sep=""),
                  hoverinfo = 'text', marker = list(color = colors)) %>%
               layout(title = "Population Distribution in Macaronesia",
                      xaxis = list(title = "Location"),
                      yaxis = list(title = "Population"),
                      margin = list(b = 40, l = 70, r = 30, t = 70),
                      font = list(family = "Arial, sans-serif", size = 12, color = "#7f7f7f"))
     })
     
          showModal(modalDialog(
               title = "Welcome to Ruicheng's Shiny App✨",
               tags$p("This web application allows you to easily find information about Cape Verde following the framework."),
               tags$p("Thank you for visiting our interactive web application. Here, you can explore various features and insights at your own pace."),
               tags$p("To get started, simply close this dialog and interact with the elements of the application. Should you need any assistance, refer to the help section or contact us directly."),
               tags$p("Good Luck ! 😜",style = "font-family: Arial, sans-serif; font-size: 18px;"),
               easyClose = TRUE,
               footer = 
                    actionButton("get_started", "Get Started", class = "btn-primary")
          ))
          observeEvent(input$get_started, {
               removeModal()
          })
     


}

shinyApp(ui, server)