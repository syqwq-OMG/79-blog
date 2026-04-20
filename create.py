import os

ch_header = """
#import "../../utils.typ":*

= 

"""


d = {
    2:20,
    3:10,
    4:7,
    5:15,
    6:8,
    7:15,
    8:9,
    9:4
}

for chp in range(2,10):
    os.mkdir(f"chp/{chp}")
    
    ch_content = ch_header
    for sec in range(1, d[chp]+1):
        ch_content += f"#include \"sec/s{sec}.typ\"\n"
        
    with open(f"chp/{chp}/ch{chp}.typ", "w+") as f:
        f.write(ch_content)
        
    os.mkdir(f"chp/{chp}/sec")
    for sec in range(1, d[chp]+1):
        with open(f"chp/{chp}/sec/s{sec}.typ", "w+") as f:
            f.write("#import \"../../../utils.typ\": *\n")