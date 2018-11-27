package Net::Spreedly::Gateway::AuthModeCredential;

use strict;
use warnings;

sub new {
  my ($class, %props) = @_;

  my $self = bless \%props, $class;
  return $self;
}

sub name  {$_[0]->{name}}
sub label {$_[0]->{label}}
sub safe  {$_[0]->{safe}}

1;
