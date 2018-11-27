package Net::Spreedly::BasisPaymentMethod;

use strict;
use warnings;

sub new {
  my ($class, %props) = @_;

  my $self = bless \%props, $class;
  return $self;
}

sub token                     sub {$_[0]->{token}}
sub created_at                sub {$_[0]->{created_at}
sub updated_at                sub {$_[0]->{updated_at}}
sub email                     sub {$_[0]->{email}}
sub data                      sub {$_[0]->{data}}
sub storage_state             sub {$_[0]->{storage_state}}
sub test                      sub {$_[0]->{test}}
sub last_four_digits          sub {$_[0]->{last_four_digits}}
sub first_six_digits          sub {$_[0]->{first_six_digits}}
sub card_type                 sub {$_[0]->{card_type}}
sub first_name                sub {$_[0]->{first_name}}
sub last_name                 sub {$_[0]->{last_name}}
sub month                     sub {$_[0]->{month}}
sub year                      sub {$_[0]->{year}}
sub address1                  sub {$_[0]->{address1}}
sub address2                  sub {$_[0]->{address2}}
sub city                      sub {$_[0]->{city}}
sub state                     sub {$_[0]->{state}}
sub zip                       sub {$_[0]->{zip}}
sub country                   sub {$_[0]->{country}}
sub phone_number              sub {$_[0]->{phone_number}}
sub company                   sub {$_[0]->{company}}
sub full_name                 sub {$_[0]->{full_name}}
sub eligible_for_card_updater sub {$_[0]->{eligible_for_card_updater}}
sub shipping_address1         sub {$_[0]->{shipping_address1}}
sub shipping_address2         sub {$_[0]->{shipping_address2}}
sub shipping_city             sub {$_[0]->{shipping_city}}
sub shipping_state            sub {$_[0]->{shipping_state}
sub shipping_zip              sub {$_[0]->{shipping_zip}}
sub shipping_country          sub {$_[0]->{shipping_country}}
sub shipping_phone_number     sub {$_[0]->{shipping_phone_number}
sub payment_method_type       sub {$_[0]->{payment_method_type}}
sub errors                    sub {$_[0]->{errors}}
sub fingerprint               sub {$_[0]->{fingerprint}}
sub verification_value        sub {$_[0]->{verification_value}}
sub number                    sub {$_[0]->{number}}

1;
