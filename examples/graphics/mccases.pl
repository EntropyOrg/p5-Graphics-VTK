#!/usr/local/bin/perl -w
#
use Graphics::VTK;

#
sub case1
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$IN);
 $scalars->InsertScalar(1,$OUT);
 $scalars->InsertScalar(2,$OUT);
 $scalars->InsertScalar(3,$OUT);
 $scalars->InsertScalar(4,$OUT);
 $scalars->InsertScalar(5,$OUT);
 $scalars->InsertScalar(6,$OUT);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 1 - 00000001");
  }
 else
  {
   $caseLabel->SetText("Case 1c - 11111110");
  }
}
#
sub case2
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$IN);
 $scalars->InsertScalar(1,$IN);
 $scalars->InsertScalar(2,$OUT);
 $scalars->InsertScalar(3,$OUT);
 $scalars->InsertScalar(4,$OUT);
 $scalars->InsertScalar(5,$OUT);
 $scalars->InsertScalar(6,$OUT);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 2 - 00000011");
  }
 else
  {
   $caseLabel->SetText("Case 2c - 11111100");
  }
}
#
sub case3
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$IN);
 $scalars->InsertScalar(1,$OUT);
 $scalars->InsertScalar(2,$IN);
 $scalars->InsertScalar(3,$OUT);
 $scalars->InsertScalar(4,$OUT);
 $scalars->InsertScalar(5,$OUT);
 $scalars->InsertScalar(6,$OUT);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 3 - 00000101");
  }
 else
  {
   $caseLabel->SetText("Case 3c - 11111010");
  }
}
#
sub case4
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$IN);
 $scalars->InsertScalar(1,$OUT);
 $scalars->InsertScalar(2,$OUT);
 $scalars->InsertScalar(3,$OUT);
 $scalars->InsertScalar(4,$OUT);
 $scalars->InsertScalar(5,$OUT);
 $scalars->InsertScalar(6,$IN);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 4 - 01000001");
  }
 else
  {
   $caseLabel->SetText("Case 4c - 10111110");
  }
}
#
sub case5
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$OUT);
 $scalars->InsertScalar(1,$IN);
 $scalars->InsertScalar(2,$OUT);
 $scalars->InsertScalar(3,$OUT);
 $scalars->InsertScalar(4,$IN);
 $scalars->InsertScalar(5,$IN);
 $scalars->InsertScalar(6,$OUT);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 5 - 00110010");
  }
 else
  {
   $caseLabel->SetText("Case 5c - 11001101");
  }
}
#proc case6 { scalars IN OUT } {
#$scalars InsertScalar 0 $OUT
#$scalars InsertScalar 1 $IN
#$scalars InsertScalar 2 $OUT
#$scalars InsertScalar 3 $IN
#$scalars InsertScalar 4 $OUT
#$scalars InsertScalar 5 $OUT
#$scalars InsertScalar 6 $IN
#$scalars InsertScalar 7 $OUT	
#}
#
sub case6
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$OUT);
 $scalars->InsertScalar(1,$IN);
 $scalars->InsertScalar(2,$OUT);
 $scalars->InsertScalar(3,$IN);
 $scalars->InsertScalar(4,$IN);
 $scalars->InsertScalar(5,$OUT);
 $scalars->InsertScalar(6,$OUT);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 6 - 00011010");
  }
 else
  {
   $caseLabel->SetText("Case 6c - 11100101");
  }
}
#
sub case7
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$IN);
 $scalars->InsertScalar(1,$IN);
 $scalars->InsertScalar(2,$OUT);
 $scalars->InsertScalar(3,$OUT);
 $scalars->InsertScalar(4,$OUT);
 $scalars->InsertScalar(5,$OUT);
 $scalars->InsertScalar(6,$IN);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 7 - 01000011");
  }
 else
  {
   $caseLabel->SetText("Case 7c - 10111100");
  }
}
#
sub case8
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$IN);
 $scalars->InsertScalar(1,$IN);
 $scalars->InsertScalar(2,$OUT);
 $scalars->InsertScalar(3,$OUT);
 $scalars->InsertScalar(4,$IN);
 $scalars->InsertScalar(5,$IN);
 $scalars->InsertScalar(6,$OUT);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 8 - 00110011");
  }
 else
  {
   $caseLabel->SetText("Case 8c - 11001100");
  }
}
#
sub case9
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$OUT);
 $scalars->InsertScalar(1,$IN);
 $scalars->InsertScalar(2,$IN);
 $scalars->InsertScalar(3,$IN);
 $scalars->InsertScalar(4,$OUT);
 $scalars->InsertScalar(5,$OUT);
 $scalars->InsertScalar(6,$IN);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 9 - 01001110");
  }
 else
  {
   $caseLabel->SetText("Case 9c - 10110001");
  }
}
# 27 -> 1b -> 00011011
#
sub case9
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$IN);
 $scalars->InsertScalar(1,$IN);
 $scalars->InsertScalar(2,$OUT);
 $scalars->InsertScalar(3,$IN);
 $scalars->InsertScalar(4,$IN);
 $scalars->InsertScalar(5,$OUT);
 $scalars->InsertScalar(6,$OUT);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 9 - 00011011");
  }
 else
  {
   $caseLabel->SetText("Case 9c - 11101011");
  }
}
#
sub case10
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$IN);
 $scalars->InsertScalar(1,$OUT);
 $scalars->InsertScalar(2,$OUT);
 $scalars->InsertScalar(3,$IN);
 $scalars->InsertScalar(4,$OUT);
 $scalars->InsertScalar(5,$IN);
 $scalars->InsertScalar(6,$IN);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 10 - 01101001");
  }
 else
  {
   $caseLabel->SetText("Case 10c - 10010110");
  }
}
#
sub case11
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$IN);
 $scalars->InsertScalar(1,$OUT);
 $scalars->InsertScalar(2,$OUT);
 $scalars->InsertScalar(3,$OUT);
 $scalars->InsertScalar(4,$IN);
 $scalars->InsertScalar(5,$IN);
 $scalars->InsertScalar(6,$IN);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 11 - 01110001");
  }
 else
  {
   $caseLabel->SetText("Case 11c - 10001110");
  }
}
#
sub case12
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$OUT);
 $scalars->InsertScalar(1,$IN);
 $scalars->InsertScalar(2,$OUT);
 $scalars->InsertScalar(3,$IN);
 $scalars->InsertScalar(4,$IN);
 $scalars->InsertScalar(5,$IN);
 $scalars->InsertScalar(6,$OUT);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 12 - 00111010");
  }
 else
  {
   $caseLabel->SetText("Case 12c - 11000101");
  }
}
#
sub case13
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$OUT);
 $scalars->InsertScalar(1,$IN);
 $scalars->InsertScalar(2,$OUT);
 $scalars->InsertScalar(3,$IN);
 $scalars->InsertScalar(4,$IN);
 $scalars->InsertScalar(5,$OUT);
 $scalars->InsertScalar(6,$IN);
 $scalars->InsertScalar(7,$OUT);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 13 - 01011010");
  }
 else
  {
   $caseLabel->SetText("Case 13c - 10100101");
  }
}
#
sub case14
{
 my $scalars = shift;
 my $IN = shift;
 my $OUT = shift;
 my $caseLabel;
 $scalars->InsertScalar(0,$IN);
 $scalars->InsertScalar(1,$OUT);
 $scalars->InsertScalar(2,$IN);
 $scalars->InsertScalar(3,$IN);
 $scalars->InsertScalar(4,$OUT);
 $scalars->InsertScalar(5,$IN);
 $scalars->InsertScalar(6,$IN);
 $scalars->InsertScalar(7,$IN);
 if ($IN == 1)
  {
   $caseLabel->SetText("Case 14 - 11101101");
  }
 else
  {
   $caseLabel->SetText("Case 14c - 00010010");
  }
}
