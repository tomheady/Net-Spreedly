package Net::Spreedly::Transaction;

use strict;
use warnings;

sub new {
  my ($class, %props) = @_;

  my $self = bless \%props, $class;
  return $self;
}

sub token                            {$_[0]->{token}}
sub created_at                       {$_[0]->{created_at}}
sub updated_at                       {$_[0]->{updated_at}}
sub succeeded                        {$_[0]->{succeeded}}
sub transaction_type                 {$_[0]->{transaction_type}}
sub retained                         {$_[0]->{retained}}
sub state                            {$_[0]->{state}}
sub message_key                      {$_[0]->{message_key}}
sub message                          {$_[0]->{message}}
sub gateway_transaction_id           {$_[0]->{gateway_transaction_id}}
sub retain_on_success                {$_[0]->{retain_on_success}}
sub payment_method_added             {$_[0]->{payment_method_added}}
sub response                         {$_[0]->{response}}
sub gateway_specific_fields          {$_[0]->{gateway_specific_fields}}
sub gateway_specific_response_fields {$_[0]->{gateway_specific_response_fields}}
sub third_party_token                {$_[0]->{third_party_token}}
sub gateway_latency_ms               {$_[0]->{gateway_latency_ms}}
sub gateway_token                    {$_[0]->{gateway_token}}
sub gateway_type                     {$_[0]->{gateway_type}}
sub on_test_gateway                  {$_[0]->{on_test_gateway}}
sub order_id                         {$_[0]->{order_id}}
sub ip                               {$_[0]->{ip}}
sub data                             {$_[0]->{data}}


sub payment_method       {Net::Spreedly::PaymentMethod->new($_[0]->{payment_method})}
sub gateway              {Net::Spreedly::Gateway->new($_[0]->{gateway})}
sub basis_payment_method {Net::Spreedly::BasisPaymentMethod->new($_[0]->{basis_payment_method})}
sub response             {Net::Spreedly::Response->new($_[0]->{response});

1;
