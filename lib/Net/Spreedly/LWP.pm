package Net::Spreedly::LWP;

use strict;
use warnings;

use LWP::UserAgent;
use JSON::MaybeXS 'JSON';

sub new {
  my ($class, %props) = @_;

  my $self = bless {
    _user_agent_opts => {},
    _user_agent => undef,
    _json => JSON->new,
  }

}

sub url             {$_[0]->{_url}}
sub json_decoder    {$_[0]->{_json}}
sub user_agent_opts {$_[0]->{_user_agent_opts}}

sub _user_agent {
  my ($self) = @_;

  if (not $self->{_user_agent}) {
    $self->{_user_agent} = LWP::UserAgent->new(%{$self->user_agent_opts});
  }
  return $self->{_user_agent};
}

sub get {
  my ($self) = @_;

  my $response = $self->user_agent->get($self->url);

  if ($response->is_error) {
    die 'error...';
  }

  my $data = $self->json_decoder->decode($response->decoded_content);
  $data->{_response} = $response;

  return $data;
}


sub post {
  my ($self, $params) = @_;

  my $response = $self->user_agent->post($self->url, $params);

  if ($response->is_error) {
    die 'error...';
  }

  my $data = $self->json_decoder->decode($response->decoded_content);
  $data->{_response} = $response;

  return $data;
}

sub put {

  my ($self, $params) = @_;

  my $response = $self->user_agent->put($self->url, $params);

  if ($response->is_error) {
    die 'error...';
  }

  my $data = $self->json_decoder->decode($response->decoded_content);
  $data->{_response} = $response;

  return $data;
}

1;
