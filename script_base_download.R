filename <- dir('url/', pattern = '.txt')
urls <- read.table(paste0('url/',filename))
n_urls <- nrow(urls)
n_split <- length(stringr::str_split(urls[1,1],"/",simplify = TRUE))


files_nc <- stringr::str_split_fixed(urls[,1],"/",n=Inf)[,n_split]

for (i in 1:n_urls){
  repeat{
    dw <- try(download.file(urls[i,1],
                            paste0('data-raw/',files_nc[i]),
                            method = 'wget',
                            extra = c('--user=xxxxx --password xxxxx')
    )
    )
    if (!(inherits(dw,"try-error")))
      break
  }
}

