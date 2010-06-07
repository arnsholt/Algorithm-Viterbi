use v6;

use Test;

use Algorithm::Viterbi;

my Algorithm::Viterbi $hmm .= new(:alphabet<H C>);
pass("creating new decoder");

$hmm.train("t/eisner.tt");
ok($hmm.p-transition<C><H> == 13/68, "C -> H == 13/68?");
ok($hmm.p-emission<C><3> == 5/34, "C -> 3 == 5/34?");

done_testing;
