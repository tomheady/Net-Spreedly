package Net::Spreedly::PaymentMethods;

use strict;
use warnings;

#use Net::Spreedly::Transaction;

use base 'Net::Spreedly::LWP';

sub new {
  my ($class, %props) = @_;

  my $self = bless {
    _url => '/v1/payment_methods.json',

  }, $class;
  return $self;
}

sub create_credit_card {
  my ($self, %params) = @_;

  # required: ((first_name  and last_name) or full_name) number month year

  my $struct = {payment_method => {credit_card => \%params}};
  my $response = $self->post($self->url, $struct);

  return Net::Spreedly::Transaction->new($response->{transaction});
}

sub create_bank_account {
  my ($self, %params) = @_;

  my $struct = {payment_method => {bank_account => \%params}};
  my $response = $self->post($self->url, $struct);

  return Net::Spreedly::Transaction->new($response->{transaction});
}

sub create_android_pay {
  my ($self, %params) = @_;

  my $struct = {payment_method => {android_pay => \%params}};
  my $response = $self->post($self->url, $struct);

  return Net::Spreedly::Transaction->new($response->{transaction});
}

sub create_apple_pay {
  my ($self, %params) = @_;

  die 'todo!';

  ### FIXME, the struct is defferent for this one

  my $struct = {payment_method => {apple_pay => \%params}};
  my $response = $self->post($self->url, $struct);


  return Net::Spreedly::Transaction->new($response->{transaction});
}

sub create_third_party {
  my ($self, %params) = @_;

  my $struct = {payment_method => \%params};
  my $response = $self->post($self->url, $struct);

  return Net::Spreedly::Transaction->new($response->{transaction});
}

sub list {
  my ($self, %params) = @_;

  my $response = $self->get($self->url, %params);
  my $ret = [];
  foreach my $method (@{$response->{payment_methods}}) {
    push @{$ret} => Net::Spreedly::PaymentMethod->new($method);
  }
  return $ret;
}

sub show {
  my ($self, %params) = @_;

  my $url = sprintf('/v1/payment_methods/%s.json', $params{payment_method_token});

  my $response = $self->get($url);
  return Net::Spreedly::PaymentMethod->new($response->{payment_method});
}

sub update {
  my ($self, %params) = @_;

  my $payment_method_token = delete $params{payment_method_token};
  my $url = sprintf('/v1/payment_methods/%s.json', $payment_method_token);

  my $response = $self->put($url, %params);
  return Net::Spreedly::PaymentMethod->new($response->{payment_method});
}

sub retain {
  my ($self, %params) = @_;

  my $url = sprintf('/v1/payment_methods/%s/retain.json', $params{payment_method_token});

  my $response = $self->put($url);
  return Net::Spreedly::Transaction->new($response->{transaction});
}

sub store {
  my ($self, %params) = @_;

  my $payment_method_token = delete $params{payment_method_token};
  my $url = sprintf('/v1/gateways/%s/store.json', $params{payment_method_token});

  my $struct = {transaction => \%params};
  my $response = $self->post($url, $struct);

  return Net::Spreedly::Transaction->new($response->{transaction});
}

sub redact {
  my ($self, %params) = @_;

  my $payment_method_token = delete $params{payment_method_token};
  my $url = sprintf('/v1/payment_methods/%s/redact.json', $payment_method_token);

  my $struct = {transaction => \%params};
  my $response = $self->put($url, $struct);

  return Net::Spreedly::Transaction->new($response->{transaction});
}

sub recache {
  my ($self, %params) = @_;

  my $payment_method_token = delete $params{payment_method_token};
  my $url = sprintf('/v1/payment_methods/%s/recache.json', $payment_method_token);

  my $struct = {payment_method => {creadit_card => \%params}};
  my $response = $self->post($url, $struct);

  return Net::Spreedly::Transaction->new($response->{transaction});
}

sub transactions {
  my ($self, %params) = @_;

  my $payment_method_token = delete $params{payment_method_token};
  my $url = sprintf('/v1/payment_methods/%s/transactions.json', $payment_method_token);

  my $response = $self->get($url, %params);

  my $ret = [];
  foreach my $transaction (@{$response->{transactions}}) {
    push @{$ret} => Net::Spreedly::Transaction->new($transaction);
  }
  return $ret;
}

1;
