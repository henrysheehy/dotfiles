#!/usr/bin/perl
$TEMP=`nvidia-smi -q -d TEMPERATURE|grep -m1 Current|cut -d : -f2`;
print "$TEMP";