# Chromosomes
# =======
#
# Count of reads mapping to each chromosome and length of chromosome
#
# License is MIT: https://github.com/BioJulia/Bio.jl/blob/master/LICENSE.md


# implement later: multimapping reads thru flags 0x100 and XT:A:U tag
using BioAlignments.BAM

function chromosome!(record, chromosomemap)
    if BAM.ismapped(record) # guard against if unmapped read
        rname = BAM.refname(record)
        if haskey(chromosomemap,rname)
            chromosomemap[rname] = chromosomemap[rname] + 1
        else
            get!(chromosomemap, rname, 1)
        end
    end
end
