use v6;

class Algorithm::Viterbi;

our class Start {};
our class End {};

# TODO:
our role Observation {};

has @!alphabet; # The HMM's alphabet
has %!name-to-index;
has %!p-transition;
has %!p-emission;

method BUILD(:@alphabet) {
    @!alphabet = @alphabet;

    for @!alphabet.kv -> $index, $state {
        %!name-to-index{$state} = $index;
    }
}

# TODO: Algorithm::Viterbi on CPAN also computes the Forward probability of
# the sequence. Should be doable to compute as well.
# An improvement might be to create a Role for observations so that domain
# objects can be passed directly to the decoder.
#method decode($hmm: Array of Observation @input) {
method decode($hmm: @input) {
    # We represent the trellis as a 2D list. The first dimension is the "tick"
    # along the input, the second the state space. @trellis contains the
    # accumulated probabilities, @trace the state we came from.
    my @trellis;
    my @trace;

    # TODO: Initialise the first row in the trellis with the initial
    # probabilities.
    for ^@!alphabet -> $state {
        @trellis[0][$state] = %!p-transition{Start}{$state}
                            * %!p-emission{$state}{@input[0]};
        @trace[0][$state] = $!initial-state;
    }

    # TODO: Iterate over the input, calculating probabilities as we go.
    for @input.kv -> $index, $observation {
        for ^@!alphabet -> $state {
            # TODO: Get argmax here.
            @trellis[$index+1][$state] = $max-p;
            @trace[$index+1][$state] = $i;
        }
    }

    # TODO: Calculate the final transition probabilities, finding the optimal
    # path through the HMM.
    my $index = @input.end + 2;
    for @!states -> $state {
    }

    # TODO: Get the best list of events from the trellis and return it.
}

# Compute unsmoothed bigram probabilities from some kind of input. An array of
# arrays perhaps?
#multi method train($hmm: Array of Array of Observation @inputs) {
multi method train($hmm: @inputs) {
}

# TODO: How does file IO work in P6?
#multi method train($hmm: $file) {
#}
