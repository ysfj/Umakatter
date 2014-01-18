#!/usr/bin/perl

use strict;
use warnings;
use FindBin;
use lib ( "$FindBin::Bin/../lib" );
use DBIx::Class::Schema::Loader qw/make_schema_at/;
use Umakatter::web;

my $schema_class = "Umakatter::Schema";

make_schema_at(
	$schema_class,
	{
		components => [qw/UTF8Columns InflateColumn::DateTime/],
#文字コードutf8mb4を取り扱うためUTF8Columnsを使わない
#		components => [ "InflateColumn::DateTime" ]
		dump_directory => File::Spec->catfile( "$FindBin::Bin/../lib" ),
		debug => 1,
	},
	Umakatter::Web->config->{connect_info},
);
