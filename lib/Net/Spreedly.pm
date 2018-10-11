package Net::Spreedly;

use strict;
use warnings;

$NET::Spreedly::VERSION = '0.001';

use URI::URL;
use LWP::UserAgent;
use Scalar::Util 'blessed';
use JSON::MaybeXS 'JSON';

use Net::Spreedly::Certificates;

sub new {
  my ($class, %props) = @_;

  # set defaults
  my $self = bless {

  }, $class;

}


sub gateways {
  my ($self) = @_;
}

sub receivers {
  my ($self) = @_;
}

sub payment_methods {
  my ($self) = @_;
}

sub certificates {
  my ($self) = @_;
  return Net::Spreedly::Certificates->new;
}

sub transactions {
  my ($self) = @_;
}

sub purchase {
  my ($self) = @_;
}

sub authorize {
  my ($self) = @_;
}

sub capture {
  my ($self) = @_;
}

sub void {
  my ($self) = @_;
}

sub credit {
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
