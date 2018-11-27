package Net::Spreedly::Transactions;

use strict;
use warnings;

use Net::Spreedly::Transaction;

use base 'Net::Spreedly::LWP';

sub new {
  my ($class, %props) = @_;

  my $self = bless {
    _url => '/v1/transactions.json',

  }, $class;
  return $self;
}

sub list {
  my ($self, %params) = @_;

  my $response = $self->get($self->url, %params);
  my $ret = [];
  foreach my $transaction (@{$response->{transactions}}) {
    push @{$ret} => Net::Spreedly::Transaction->new($transaction);
  }
  return $ret;
}

sub show {
  my ($self, %params) = @_;

  my $url = sprintf('/v1/transactions/%s.json', $params{transaction_token});

  my $response = $self->get($url);
  return Net::Spreedly::Transaction->new($response->{transaction});
}

sub transcript {
  my ($self) = @_;

  my $url = sprintf('/v1/transactions/%s/transcript', $params{transaction_token});

  my $response = $self->get_text($url);
  return Net::Spreedly::Transaction->new($response->{transaction});
}

1;
