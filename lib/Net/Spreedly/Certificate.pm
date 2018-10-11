package Net::Spreedly::Certificate;

use strict;
use warnings;

sub new {
  my ($class, %props) = @_;

  # set defaults
  my $self = bless {

  }, $class;

}

sub token           {$_[0]->{token}}
sub algorithm       {$_[0]->{algorithm}}
sub cn              {$_[0]->{cn}}
sub o               {$_[0]->{o}}
sub ou              {$_[0]->{ou}}
sub c               {$_[0]->{c}}
sub st              {$_[0]->{st}}
sub l               {$_[0]->{l}}
sub email_address   {$_[0]->{email_address}}
sub public_key      {$_[0]->{public_key}}
sub public_key_hash {$_[0]->{public_key_hash}}
sub csr             {$_[0]->{csr}}
sub pem             {$_[0]->{pem}}
sub created_at      {$_[0]->{created_at}}
sub updated_at      {$_[0]->{updated_at}}


1;
