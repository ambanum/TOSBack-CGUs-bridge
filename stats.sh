cat processing.txt  | grep processing | wc -l | awk '{print $0 "\tprocessing"}'
cat processing.txt  | grep -v processing | grep done | wc -l | awk '{print $0 "\tdone"}'
cat processing.txt  | grep -v processing | grep -v done | grep covered | wc -l | awk '{print $0 "\tcovered"}'
cat processing.txt  | grep -v processing | grep -v done | grep -v covered | grep Same\ type | wc -l | awk '{print $0 "\tSame type"}'
cat processing.txt  | grep -v processing | grep -v done | grep -v covered | grep -v Same\ type | grep Unsupported\ type | wc -l | awk '{print $0 "\tUnsupported type"}'
cat processing.txt  | grep -v processing | grep -v done | grep -v covered | grep -v Same\ type | grep -v Unsupported\ type | grep Cannot\ read | wc -l | awk '{print $0 "\tCannot read"}'
cat processing.txt  | grep -v processing | grep -v done | grep -v covered | grep -v Same\ type | grep -v Unsupported\ type | grep -v Cannot\ read | grep Found\ 0 | wc -l | awk '{print $0 "\tFound zero"}'
cat processing.txt  | grep -v processing | grep -v done | grep -v covered | grep -v Same\ type | grep -v Unsupported\ type | grep -v Cannot\ read | grep Found\ 2 | wc -l | awk '{print $0 "\tFound two"}'

