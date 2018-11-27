package Net::Spreedly;

# ABSTRACT: Spreedly Payments API v1

=head1 DESCRIPTION

The Spreedly module provides a convenient way of accessing the Spreedly API v1.

=cut

=head1 SYNOPSIS
    use Net::Spreedly;

    my $props = { ... }
    my $payment = Net::Spreedly->new($props);

=cut

use strict;
use warnings;

$NET::Spreedly::VERSION = '0.001';

use URI::URL;
use LWP::UserAgent;
use Scalar::Util 'blessed';
use JSON::MaybeXS 'JSON';

use Net::Spreedly::Gateways;
use Net::Spreedly::PaymentMethods;
use Net::Spreedly::Certificates;
use Net::Spreedly::Transactions;
use Net::Spreedly::Authorize;
use Net::Spreedly::Capture;

sub new {
  my ($class, %props) = @_;

  my $self = bless {

  }, $class;

}


sub gateways {
  my ($self) = @_;
  return Net::Spreedly::Gateways->new;
}

sub receivers {
  my ($self) = @_;
}

sub payment_methods {
  my ($self) = @_;
  return Net::Spreedly::PaymentMethods->new;
}

sub certificates {
  my ($self) = @_;
  return Net::Spreedly::Certificates->new;
}

sub transactions {
  my ($self) = @_;
  return Net::Spreedly::Transactions->new;
}

sub purchase {
  my ($self) = @_;
}

sub authorize {
  my ($self) = @_;
  return Net::Spreedly::Authorize->new;
}

sub capture { ### <--- 3
  my ($self) = @_;
  return Net::Spreedly::Capture->new;
}

sub void { ### <--- 4
  my ($self) = @_;
}

sub credit { ### <--- 5
  my ($self) = @_;
}

sub verify {
  my ($self) = @_;
}

sub deliver {
  my ($self) = @_;
}

sub export {
  my ($self) = @_;
}


1;
