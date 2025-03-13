bamCompare \
    -b1 /mnt/iacchus/joe/raw_data/Thymus/Fezf2_chip/output/bams_for_peak_calling/Fezf2_sorted_rmdup.bam \
    -b2 /mnt/iacchus/joe/raw_data/Thymus/Fezf2_chip/output/bams_for_peak_calling/Fezf2_input_sorted_rmdup.bam \
    -o /mnt/iacchus/joe/raw_data/Thymus/Fezf2_chip/output/bigwigs/input_normalized.bw \
    -p 16 \
	--binSize 10 \
	--ignoreForNormalization chrX \
	--extendReads