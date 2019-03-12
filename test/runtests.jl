using qckitalign
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end


# write your own tests here
basic,chimeric,chromosomedf = runall("/Users/aguang/CORE/qckit/testdata/wgs_bam_NA12878_20k_b37_NA12878.bam")
@test basic[1] == 59142 # uniquely mapped reads
@test basic[2] == 777 # unmapped reads
@test basic[3] == 858 # multimapped reads
@test chimeric == 1482
