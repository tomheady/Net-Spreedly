package Net::Spreedly::PaymentMethod;

use strict;
use warnings;

sub new {
  my ($class, %props) = @_;

  my $self = bless \%props, $class;
  return $self;
}

sub token                     {$_[0]->{token}}
sub retained                  {$_[0]->{retained}}
sub storage_state             {$_[0]->{storage_state}}
sub test                      {$_[0]->{test}}
sub payment_method_type       {$_[0]->{payment_method_type}}
sub errors                    {$_[0]->{errors}}
sub created_at                {$_[0]->{created_at}}
sub updated_at                {$_[0]->{updated_at}}
sub gateway_type              {$_[0]->{gateway_type}}
sub storage_state             {$_[0]->{storage_state}}
sub third_party_token         {$_[0]->{third_party_token}}
sub email                     {$_[0]->{email}}
sub data                      {$_[0]->{data}}
sub last_four_digits          {$_[0]->{last_four_digits}}
sub first_six_digits          {$_[0]->{first_six_digits}}
sub card_type                 {$_[0]->{card_type}}
sub first_name                {$_[0]->{first_name}}
sub last_name                 {$_[0]->{last_name}}
sub month                     {$_[0]->{month}}
sub year                      {$_[0]->{year}}
sub address1                  {$_[0]->{address1}}
sub address2                  {$_[0]->{address2}}
sub city                      {$_[0]->{city}}
sub state                     {$_[0]->{state}}
sub zip                       {$_[0]->{zip}}
sub country                   {$_[0]->{country}}
sub phone_number              {$_[0]->{phone_number}}
sub company                   {$_[0]->{company}}
sub full_name                 {$_[0]->{full_name}}
sub eligible_for_card_updater {$_[0]->{eligible_for_card_updater}}
sub shipping_address1         {$_[0]->{shipping_address1}}
sub shipping_address2         {$_[0]->{shipping_address2}}
sub shipping_city             {$_[0]->{shipping_city}}
sub shipping_state            {$_[0]->{shipping_state}}
sub shipping_zip              {$_[0]->{shipping_zip}}
sub shipping_country          {$_[0]->{shipping_country}}
sub shipping_phone_number     {$_[0]->{shipping_phone_number}}
sub payment_method_type       {$_[0]->{payment_method_type}}
sub fingerprint               {$_[0]->{fingerprint}}
sub verification_value        {$_[0]->{verification_value}}
sub number                    {$_[0]->{number}}
sub errors                    {$_[0]->{errors}}

1;
