Align Illumina short reads (here from accession morrut) on the Olea europaea var. Arbequina reference genome 

nohup bowtie2 -x /eep/data1/genomic/ref/olea_europaea/arbequina_2020/GWHAOPM00000000.genome -p 8 -1 /eep/projet_collab/olivier_2021/NO_BACKUP_reads/raw/morrut_R1_001.fq.gz -2 /eep/projet_collab/olivier_2021/NO_BACKUP_reads/raw/morrut_R2_001.fq.gz -S morrut_on_Arbequina.sam --local --fast &
nohup samtools view -bS morrut_on_Arbequina.sam -o morrut_on_Arbequina.bam &
nohup samtools sort morrut_on_Arbequina.bam -o morrut_on_Arbequina.sorted.bam &
nohup samtools index morrut_on_Arbequina.sorted.bam &
nohup samtools depth morrut_on_Arbequina.sorted.bam -a -Q 30 -b Arbequina_Centered_on_Slocus.bed -o morrut_on_Arbequina.sorted.Q30.cov &
