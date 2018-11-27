package Net::Spreedly::Gateway::AuthMode;

use strict;
use warnings;

sub new {
  my ($class, %props) = @_;

  my $self = bless \%props, $class;
  return $self;
}

sub auth_mode_type {$_[0]->{auth_mode_type}}
sub name           {$_[0]->{name}}

sub credentials {
  my ($self) = @_;

  my $ret = [];
  foreach my $credential (@{$self->{credentials}}) {
    push @{$ret} => Net::Spreedly::GateWay::AuthMode::Credential->new($credential);
  }
  return $ret;
}

1;
