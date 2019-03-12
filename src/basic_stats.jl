# Basic statistics
# =======
#
# Basic read alignment statistics.
#
# License is MIT: https://github.com/BioJulia/Bio.jl/blob/master/LICENSE.md


# implement later: multimapping reads thru flags 0x100 and XT:A:U tag
using BioAlignments.BAM

function basicstats!(record, counts)
    if BAM.ismapped(record)
        if BAM.isprimary(record)
            counts[1] = counts[1] + 1
        else
            counts[2] = counts[2] + 1
        end
    else
        counts[3] = counts[3] + 1
    end
end

function basicstats!(record, counts, qualityscore)
    if BAM.ismapped(record)
        if BAM.mappingquality(record) > qualityscore
            counts[1] = counts[1] + 1
        else
            counts[2] = counts[2] + 1
        end
    else
        counts[3] = counts[3] + 1
    end
end
