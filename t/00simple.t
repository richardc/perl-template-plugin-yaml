#!perl -w
use strict;
use Test::More tests => 3;
use Template;

my $tt = new Template;
my $out;
ok( $tt->process(\"[% USE YAML %][% YAML.dump( struct ) %]", {
        struct => [ { foo => 'bar' }, { foo => 'baz' } ],
        }, \$out), "TT ran" );

is( $tt->error, undef );

is( $out, "--- #YAML:1.0\n- foo: bar\n- foo: baz\n", "got what we expected" );
