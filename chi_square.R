buildContigencyTables <- function(elements,nRow,rowHeaders,columnHeaders) {
  contigencyTable <- matrix(elements, nrow=nRow,byrow = TRUE)
  colnames(contigencyTable) <- columnHeaders
  rownames(contigencyTable) <- rowHeaders
  contigencyTable <- as.table(contigencyTable)
  return (contigencyTable)
}

round(sqrt(10.584/(41+40)),digits = 2)
input <- c(1.85, 1.58, -2.84,1.46,1.22,-2.21,-2.78,-2.35,4.23)
politic <- buildContigencyTables(input,nRow=3,c("Cat","Dog","Others"),c("Demo","Rep","Ind"))
chisq.test(politic)