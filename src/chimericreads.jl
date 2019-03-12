"""
  chimeras
"""

# only tags for now
# implement later: checking reads that have same qname and 0x800 flag
function chimerictags(record)
    if haskey(record,"SA")
        return true
    else
        return false
    end
end
