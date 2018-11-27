package Net::Spreedly::Gateways;

use strict;
use warnings;

use Net::Spreedly::Gateway;

use base 'Net::Spreedly::LWP';

sub new {
  my ($class, %props) = @_;

  my $self = bless {}, $class;
  return $self;
}

sub list_supported {
  my ($self) = @_;

  my $url = '/v1/gateways_options.json';
  my $response = $self->get($url);
  my $ret = [];
  foreach my $gateway (@{$response->{gateways}}) {
    push @{$ret} => Net::Spreedly::Gateway->new($gateway);
  }
  return $ret;
}

sub list_created {
  my ($self) = @_;

  my $url = '/v1/gateways.json';
  my $response = $self->get($url);
  my $ret = [];
  foreach my $gateway (@{$response->{gateways}}) {
    push @{$ret} => Net::Spreedly::Gateway->new($gateway);
  }
  return $ret;
}

sub create_test {
  my ($self) = @_;

  my $url = '/v1/gateways.json';
  my $struct = {gateway => {gateway_type => 'test'}};
  my $response = $self->post($struct);

  return Net::Spreedly::Gateway->new($response);
}

sub create_production {
  my ($self, %params) = @_;

  my $url = '/v1/gateways.json';

  # $params{type} is required, must be one of:
  # https://docs.spreedly.com/reference/supported-gateways/

  # other parameters may be required depending on the gateway:
  # see https://docs.spreedly.com/reference/supported-gateways/

  my $struct = {gateway => \%params};
  my $response = $self->post($struct);

  return Net::Spreedly::Gateway->new($response);
}

sub show {
  my ($self, %params) = @_;

  my $url = sprintf('/v1/gateways/%s.json', $params{gateway_token});

  my $response = $self->get($url);
  return Net::Spreedly::Gateway->new($response);
}

sub update {
  my ($self, %params) = @_;

  my $url = sprintf('/v1/gateways/%s.json', $params{gateway_token});

  my $struct = {gateway => \%params};
  my $response = $self->put($url, $struct);
  return Net::Spreedly::Gateway->new($response);

}

sub retain {
  my ($self, %params) = @_;

  my $url = sprintf('/v1/gateways/%s/retain.json', $params{gateway_token});

  my $response = $self->put($url);
  return Net::Spreedly::Transaction($response->{transaction});
}

sub redact {
  my ($self, %params) = @_;

  my $url = sprintf('/v1/gateways/%s/redact.json', $params{gateway_token});

  my $response = $self->put($url);
  return Net::Spreedly::Transaction($response->{transaction});
}

sub transactions {
  my ($self, %params) = @_;

  my $gateway_token = delete $params{gateway_token};

  my $url = sprintf('/v1/gateways/%s/transactions.json', $gateway_token);
  my $response = $self->put($url, %params);
  return Net::Spreedly::Transaction->new($response->{transaction});
}

1;
