package Net::Spreedly::Response;

use strict;
use warnings;

sub new {
  my ($class, %props) = @_;

  my $self = bless \%props, $class;
  return $self;
}

sub success        sub {$_[0]->{success}}
sub message        sub {$_[0]->{message}}
sub avs_code       sub {$_[0]->{avs_code}}
sub avs_message    sub {$_[0]->{avs_message}}
sub cvv_code       sub {$_[0]->{cvv_code}}
sub cvv_message    sub {$_[0]->{cvv_message}}
sub pending        sub {$_[0]->{pending}}
sub result_unknown sub {$_[0]->{result_unknown}}
sub error_code     sub {$_[0]->{error_code}}
sub error_detail   sub {$_[0]->{error_detail}}
sub cancelled      sub {$_[0]->{cancelled}}
sub fraud_review   sub {$_[0]->{fraud_review}}
sub created_at     sub {$_[0]->{created_at}}
sub updated_at     sub {$_[0]->{updated_at}}

1;
