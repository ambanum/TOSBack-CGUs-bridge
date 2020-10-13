cat processing.txt  | grep processing | wc -l
cat processing.txt  | grep -v processing | grep done | wc -l
cat processing.txt  | grep -v processing | grep -v done | grep covered | wc -l
cat processing.txt  | grep -v processing | grep -v done | grep -v covered | grep Same\ type | wc -l
cat processing.txt  | grep -v processing | grep -v done | grep -v covered | grep -v Same\ type | grep Unsupported\ type | wc -l
cat processing.txt  | grep -v processing | grep -v done | grep -v covered | grep -v Same\ type | grep -v Unsupported\ type | grep Cannot\ read | wc -l
cat processing.txt  | grep -v processing | grep -v done | grep -v covered | grep -v Same\ type | grep -v Unsupported\ type | grep -v Cannot\ read | grep Found\ 0 | wc -l
cat processing.txt  | grep -v processing | grep -v done | grep -v covered | grep -v Same\ type | grep -v Unsupported\ type | grep -v Cannot\ read | grep Found\ 2 | wc -l

