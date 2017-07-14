use strict;
use warnings;

my ($input) = @ARGV;

unless ($input) {
    warn "usage: $0 INPUT_IMAGE";
    exit 1;
}
my @frames;

for my $i (1..4) {
    my $quality = rand(5);
    my $frame = "$i.jpg";
    push @frames, $frame;
    system qw(convert), $input, qw(-quality), $quality, $frame;
}

system qw(convert -loop 0 -delay 10), @frames, 'out.gif';

unlink($_) for @frames;
