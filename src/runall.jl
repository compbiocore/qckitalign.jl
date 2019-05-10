# Run all alignment statistics
# =======
#
# Run all alignment statistics
#
# License is MIT: https://github.com/BioJulia/Bio.jl/blob/master/LICENSE.md

include("basic_stats.jl")
include("chimericreads.jl")
include("chromosome.jl")

function runall(input)
    #for i in input
        reader = open(BAM.Reader, input)
        record = BAM.Record()
        basic = [0,0,0] # unique, multi, unmapped
        chimeric = 0
        chromosomemap = Dict()
        numrecords = 0
        while !eof(reader)
            read!(reader,record)
            basicstats!(record, basic)
            if chimerictags(record)
                chimeric = chimeric + 1
            end
            chromosome!(record, chromosomemap)
            numrecords = numrecords + 1
        end
        chromosomedf = DataFrame(Any[collect(keys(chromosomemap)), collect(values(chromosomemap))])
    #plot(chromosomedf, x="x1",y="x2", Geom.bar)
    #end
    return basic, chimeric, chromosomedf
end

basic,chimeric,chromosomedf = runall("/Users/aguang/CORE/qckit/testdata/wgs_bam_NA12878_20k_b37_NA12878.bam")
print(basic)
print(chimeric)
#basic, chimeric, chromosomedf = runall("/Users/aguang/CORE/qckit/testdata/test.bam")
#print(basic)
#print(chimeric)

# for i = 1:60340
           #read!(reader, record)
       #end
