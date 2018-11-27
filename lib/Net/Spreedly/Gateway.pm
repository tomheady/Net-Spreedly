package Net::Spreedly::Gateway;

use strict;
use warnings;

sub new {
  my ($class, %props) = @_;

  my $self = bless \%props, $class;
  return $self;
}

sub token                   {$_[0]->{token}}
sub gateway_type            {$_[0]->{gateway_type}}
sub name                    {$_[0]->{name}}
sub login                   {$_[0]->{login}}
sub description             {$_[0]->{description}}
sub state                   {$_[0]->{state}}
sub created_at              {$_[0]->{created_at}}
sub updated_at              {$_[0]->{updated_at}}
sub redacted                {$_[0]->{redacted}}
sub credentials             {$_[0]->{credentials}}
sub characteristics         {$_[0]->{characteristics}}
sub payment_methods         {$_[0]->{payment_methods}}
sub gateway_specific_fields {$_[0]->{gateway_specific_fields}}
sub supported_countries     {$_[0]->{supported_countries}}
sub supported_cardtypes     {$_[0]->{supported_cardtypes}}
sub regions                 {$_[0]->{regions}}
sub homepage                {$_[0]->{homepage}}
sub company_name            {$_[0]->{company_name}}

sub auth_modes {
  my ($self) = @_;

  my $ret = [];
  foreach my $mode (@{$self->auth_modes}) {
    push @{$ret} => Net::Spreedly::Gateway::AuthMode->new($modes);
  }
  return $ret;
}

1;
