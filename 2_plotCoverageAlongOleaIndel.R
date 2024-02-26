#Creat plot of coverage of short reads from 8 cultivars along the indel in Olea, with annotation of genes

library(Gviz)

picual = read.table('data/GWHAOPM00000018_picual.cov', h=F, sep="\t")
frantoyo = read.table('data/GWHAOPM00000018_Frantoyo.cov', h=F, sep="\t")
arbequina = read.table('data/GWHAOPM00000018_arbequina.cov', h=F, sep="\t")
Hojiblanca = read.table('data/GWHAOPM00000018_Hojiblanca.cov', h=F, sep="\t")
llumeta = read.table('data/Llumeta_on_Arbequina_sorted.Q30.cov', h=F, sep="\t") 
morrut = read.table('data/morrut_on_Arbequina_sorted.Q30.cov', h=F, sep="\t")
picudo = read.table('data/Picudo_on_Arbequina_sorted.Q30.cov', h=F, sep="\t")
leccino = read.table('data/Leccino_on_Arbequina_sorted.Q30.cov', h=F, sep="\t")

gtrack <- GenomeAxisTrack(range = IRanges(start = 18259199, end = 19000000, names = "indel"), col = "black", cex = 4, fontcolor = "black", cex.id = 2, col.id = "transparent", col.range= "transparent", fill.range = "transparent", showId = TRUE, labelPos = "below", ticksAt = c(18500000, 19000000, 19500000))

options(ucscChromosomeNames=FALSE)
grtrack <- GeneRegionTrack("/eep/projet_collab/phillyrea_annotation/figures/GWHAOPM00000000.gff",
                           genome = "GWHAOPM00000000",
                           chromosome = "GWHAOPM00000018",
                           fill = "black",
                           showId = FALSE,
                           shape = "box",
                           background.title = "transparent")

dTrack_picual <- DataTrack(data=picual$V3, start=picual$V2, end=c(picual$V2+1), genome="test",  chr="GWHAOPM00000018", name = "picual", cex = 0.04, col = "black", ylim=c(0,100), col.axis = "black", fontcolor = "black", background.title = "transparent")
dTrack_frantoyo <- DataTrack(data=frantoyo$V3, start=frantoyo$V2, end=c(frantoyo$V2+1), genome="test",  chr="GWHAOPM00000018", name = "frantoio", cex = 0.04, col = "black", ylim=c(0,100), col.axis = "black", fontcolor = "black", background.title = "transparent")
dTrack_arbequina <- DataTrack(data=arbequina$V3, start=arbequina$V2, end=c(arbequina$V2+1), genome="test",  chr="GWHAOPM00000018", name = "arbequina", cex = 0.04, col = "black", ylim=c(0,100), col.axis = "black", fontcolor = "black",background.title = "transparent")
dTrack_Hojiblanca <- DataTrack(data=Hojiblanca$V3, start=Hojiblanca$V2, end=c(Hojiblanca$V2+1), genome="test",  chr="GWHAOPM00000018", name = "Hojiblanca", cex = 0.04, col = "black", ylim=c(0,100), col.axis = "black", fontcolor = "black", background.title = "transparent")
dTrack_llumeta <- DataTrack(data=llumeta$V3, start=llumeta$V2, end=c(llumeta$V2+1), genome="test",  chr="GWHAOPM00000018", name = "llumeta", cex = 0.04, col = "black", ylim=c(0,100), col.axis = "black", fontcolor = "black", background.title = "transparent")
dTrack_morrut <- DataTrack(data=morrut$V3, start=morrut$V2, end=c(morrut$V2+1), genome="test",  chr="GWHAOPM00000018", name = "morrut", cex = 0.04, col = "black", ylim=c(0,100), col.axis = "black", fontcolor = "black", background.title = "transparent")
dTrack_picudo <- DataTrack(data=picudo$V3, start=picudo$V2, end=c(picudo$V2+1), genome="test",  chr="GWHAOPM00000018", name = "picudo", cex = 0.04, col = "black", ylim=c(0,100), col.axis = "black", fontcolor = "black", background.title = "transparent")
dTrack_leccino <- DataTrack(data=leccino$V3, start=leccino$V2, end=c(leccino$V2+1), genome="test",  chr="GWHAOPM00000018", name = "leccino", cex = 0.04, col = "black", ylim=c(0,100), col.axis = "black", fontcolor = "black", background.title = "transparent")

png("Fig3D_submit.png", height=1200, width=3200)

plotTracks(list(grtrack, gtrack, dTrack_morrut, dTrack_picual, dTrack_picudo, dTrack_llumeta, dTrack_arbequina, dTrack_frantoyo, dTrack_Hojiblanca, dTrack_leccino), from = 18259124, to = 19760662, sizes=c(2,2,2,2,2,2,2,2,2,2), fontcolor.title="black")

dev.off()
