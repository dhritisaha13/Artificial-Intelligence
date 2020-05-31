average( List, Average ):- 
sumlist( List, Sum ),
len( List, Length ),
Length > 0, 
Average is Sum / Length.
