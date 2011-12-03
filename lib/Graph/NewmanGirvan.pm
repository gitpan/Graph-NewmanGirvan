package Graph::NewmanGirvan;

use 5.012000;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
  newman_girvan
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.1';

require XSLoader;
XSLoader::load('Graph::NewmanGirvan', $VERSION);

sub newman_girvan {
  my $g = shift;
  my $p = Graph::NewmanGirvan->new;
  $p->add_edge(@$_, ($g->get_edge_weight(@$_) // 1.0)) for $g->edges;
  return $p->compute;
}

1;
__END__

=head1 NAME

Graph::NewmanGirvan - Newman-Girvan Graph node clustering

=head1 SYNOPSIS

  use Graph::NewmanGirvan 'newman_girvan';
  use Graph::Undirected;
  my $g = Graph::Undirected->new;
  $g->add_weighted_edge('a', 'b', 0.3);
  ...
  my %vertex_to_cluster = newman_girvan($g);

=head1 DESCRIPTION

The C<newman_girvan> sub takes a Graph object and computes clusters
for each vertex in the graph. The implementation is a quick and dirty
port of the code in Andreas Noack's linloglayout utility, tested only
with graphs with edges with edge weights greater than zero. Should work
with directed and undirected graphs.

=head2 EXPORTS

The function C<newman_girvan> on request, none by default.

=head1 SEE ALSO

L<http://code.google.com/p/linloglayout/>

=head1 AUTHOR / COPYRIGHT / LICENSE

  Copyright (c) 2011 Bjoern Hoehrmann <bjoern@hoehrmann.de>.
  This module is licensed under the same terms as linloglayout.
  Uses code from linloglayout Copyright (C) 2008 Andreas Noack.

=cut
