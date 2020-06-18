
whos_norm <- function(data) {
  
  require(dplyr)
  
  data <- data %>% as.data.frame()
  
  variable <- NULL
  W <- NULL
  p <- NULL
  
  
    
    for (i in 1:length(data)) {
      
      if (is.numeric(data[,i])) {
        
      var <- data[,i]
      
      name <- colnames(data[i])
      
      sw <- shapiro.test(var)
      
      variable[i] <- name
      W[i] <- round(sw$statistic,3)
      p[i] <- round(sw$p,4)
      
    }
    
    
  }
  
  
  sign <- ifelse(p <= 0.05, '*','normal')
  
  tests <-na.omit(data.frame(variable, W, p, sign))
  
  not_normal <- tests %>% filter(sign == '*')
  
  list(signif = sign, all = tests, not_normal = not_normal)
  
} 
