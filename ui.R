fluidPage(
  
  titlePanel(" SYMETRIC READER basic"),
  
  fluidRow(column(6, fileInput('file_Import', 'Pick a file to upload (.txt format):')),
           column(6, checkboxInput("try.example", "try a text sample", value=FALSE),
                  actionButton("PAUSE", label = "PAUSE"),br())
           ),
  fluidRow(column(6, wellPanel(sliderInput("speed", "choose the pace (nb words/min)", min = 50, max = 1000, value = 250, step = 50))),
           column(6, wellPanel("This is your text:",
                               verbatimTextOutput("words"),
                               tags$head(tags$style("#words{font-size: 24px; text-align: center; font-weight: bold;}")))),
           column(12, br(), tags$div(HTML(paste("author: ", tags$span(style="color:grey", "marc.agenis@gmail.com", sep = "")))))
           )
  )