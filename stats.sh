cat processing.txt  | grep done | wc -l | awk '{print $0 "\tdone"}'
cat processing.txt  | grep covered | wc -l | awk '{print $0 "\tcovered"}'
cat processing.txt  | grep Same\ type | wc -l | awk '{print $0 "\tSame type"}'
cat processing.txt  | grep Unsupported\ type | wc -l | awk '{print $0 "\tUnsupported type"}'
cat processing.txt  | grep Cannot\ read | wc -l | awk '{print $0 "\tCannot read"}'
cat processing.txt  | grep Found\ 0 | wc -l | awk '{print $0 "\tFound zero"}'
cat processing.txt  | grep inconsistent | wc -l | awk '{print $0 "\tinconsistent"}'
cat processing.txt  | grep too\ short | wc -l | awk '{print $0 "\ttoo stort"}'
cat processing.txt  | grep not\ fetchable | wc -l | awk '{print $0 "\tnot fetchable"}'
cat processing.txt  | grep selector\ not\ found | wc -l | awk '{print $0 "\tselector not found"}'
cat processing.txt  | grep selector\ is\ not\ defined | wc -l | awk '{print $0 "\tno selector"}'

