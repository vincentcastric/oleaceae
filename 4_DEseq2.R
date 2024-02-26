#Run DESeq2 on transcript_count_matrix.txt
library("DESeq2")
countData=read.table("transcript_count_matrix.txt",header=TRUE,row.names=1)
genotype<-factor(c("Ha","Ha","Ha","Ha","Ha","Ha","Ha","Ha","Ha","Ha","Ha","Ha","Ha","Ha","Ha","Ha","Hb","Hb","Hb","Hb","Hb","Hb","Hb","Hb","Hb","Hb","Hb","Hb"))
condition<-factor(c("Flower", "Pistil","Flower", "Pistil","Flower", "Pistil","Flower", "Pistil","Flower", "Pistil","Flower", "Pistil","Flower", "Pistil","Flower", "Pistil","Flower", "Pistil","Flower", "Pistil","Flower", "Pistil","Flower", "Pistil","Flower", "Pistil","Flower", "Pistil"))

colData=data.frame(row.names=colnames(countData),genotype=genotype, condition=condition)

ddsMF<-DESeqDataSetFromMatrix(countData=countData,colData=colData,design=~genotype)
ddsMF<-DESeq(ddsMF)
res<-results(ddsMF)
resdata<-merge(as.data.frame(res), as.data.frame(counts(ddsMF,normalized=TRUE)),by="row.names", sort=FALSE)
write.csv(resdata,file="Res.txt")
