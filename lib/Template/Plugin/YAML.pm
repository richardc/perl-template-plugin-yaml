use strict;
package Template::Plugin::YAML;
use Template::Plugin;
use base 'Template::Plugin';
use YAML qw(Dump);
use vars qw($VERSION);
$VERSION = 1.21;

# any resemblance to Template::Plugin::Dumper is because we stole it all
sub dump {
    my $self = shift;
    my $content = Dump @_;
    return $content;
}

sub dump_html {
    my $self = shift;
    my $content = Dump @_;
    for ($content) {
        s/&/&amp;/g;
        s/ /&nbsp;/g;
        s/</&lt;/g;
        s/>/&gt;/g;
        s/\n/<br>\n/g;
    }
    return $content;
}

1;
__END__

=head1 NAME

Template::Plugin::YAML - Plugin interface to YAML

=head1 SYNOPSIS

    [% USE YAML %]

    [% YAML.dump(variable) %]
    [% YAML.dump_html(variable) %]

=head1 DESCRIPTION

This is a very simple Template Toolkit Plugin Interface to the YAML
module.  A YAML object will be instantiated via the following
directive:

    [% USE YAML %]

As a standard plugin, you can also specify its name in lower case:

    [% USE yaml %]

=head1 METHODS

There are two methods supported by the YAML object.  Each will
output into the template the contents of the variables passed to the
object method.

=head2 dump()

Generates a raw text dump of the data structure(s) passed

    [% USE Dumper %]
    [% yaml.dump(myvar) %]
    [% yaml.dump(myvar, yourvar) %]


=head2 dump_html()

Generates a dump of the data structures, as per dump(), but with the
characters E<lt>, E<gt> and E<amp> converted to their equivalent HTML
entities, spaces converted to &nbsp; and newlines converted to
E<lt>brE<gt>.

    [% USE yaml %]
    [% yaml.dump_html(myvar) %]

=head1 AUTHOR

Richard Clamp <richardc@unixbeard.net>

based on Simon Matthews' L<Template::Plugin::Dumper>

=head1 COPYRIGHT

Copyright 2003 Richard Clamp All Rights Reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=head1 SEE ALSO

L<Template::Plugin::Dumper>

=cut
