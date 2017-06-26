function(input, output, session) {
  
  isolate({ load("mylist.Rdata") })
  
  data_Import = reactive({
    i <<-1
    if (input$try.example){return(mylist[sample.int(length(mylist), 1)][[1]])}
    if (is.null(input$file_Import)) {return(rep("-- no text to be read --", 500))}
    read.csv(input$file_Import$datapath, header=F, stringsAsFactors = F, sep="/", encoding="UTF-8") %>%
      .[[1]] %>% paste(collapse=" ") %>% strsplit("[.]| ") %>%  .[[1]] %>% c(rep("-- end --", 500)) })
  
  output$words <- renderText({
    invalidateLater( ifelse(input$PAUSE %% 2, 1e10, round(6e4/input$speed)), session )
    i <<-i+1
    data_Import()[i]
  })
  
  }








