package Net::Spreedly::Capture;

use strict;
use warnings;

use base 'Net::Spreedly::LWP';

sub new {
  my ($class, %props) = @_;

  my $self = bless {}, $class;
  return $self;
}

sub tokenize_payment_method {
  my ($self, %params) = @_;

  my $gateway_token = delete $params{gateway_token};
  my $url = sprintf('/v1/gateways/%s/authorize.json', $gateway_token);

  my $struct = {transaction => \%params};
  my $response = $self->post($self->url, $struct);

  return Net::Spreedly::Transaction->new($response->{transaction});
}

sub pass_in_credit_card {
  my ($self, %params) = @_;

  my $gateway_token = delete $params{gateway_token};
  my $url = sprintf('/v1/gateways/%s/authorize.json', $gateway_token);

  ### FIXME, the struct is defferent for this one

  my $struct = {transaction => \%params};
  my $response = $self->post($self->url, $struct);

  return Net::Spreedly::Transaction->new($response->{transaction});
}

sub pass_in_android_pay {
  my ($self) = @_;

  my $gateway_token = delete $params{gateway_token};
  my $url = sprintf('/v1/gateways/%s/authorize.json', $gateway_token);

  ### FIXME, the struct is defferent for this one

  my $struct = {transaction => \%params};
  my $response = $self->post($self->url, $struct);

  return Net::Spreedly::Transaction->new($response->{transaction});
}

sub pass_in_apple_pay {
  my ($self) = @_;

  my $gateway_token = delete $params{gateway_token};
  my $url = sprintf('/v1/gateways/%s/authorize.json', $gateway_token);

  ### FIXME, the struct is defferent for this one

  my $struct = {transaction => \%params};
  my $response = $self->post($self->url, $struct);

  return Net::Spreedly::Transaction->new($response->{transaction});
}

1;
