$_=<>;for$i(1..$_){%my={};$sum=0;$_=<>;chop;
for(split//){$sum+=ord($_),$my{$_}=1unless($my{$_});}
$_=unpack("B32",pack("N",$sum));s/^0+(?=\d)//;
print "#$i : ",$_,"\n";}
