#!perl -T

use strict;
use warnings;

use DBI;
use DBIx::ScopedTransaction;
use File::Spec;
use Test::Exception;
use Test::More tests => 5;

use lib 't/lib';
use LocalTest;


my $dbh = LocalTest::ok_database_handle();

my $transaction;
lives_ok(
	sub
	{
		$transaction = DBIx::ScopedTransaction->new( $dbh );
	},
	'Create a transaction object.',
);

lives_ok
(
	sub
	{
		open( STDERR, '>', File::Spec->devnull() ) || die "could not open STDERR: $!";
	},
	'Redirect STDERR to clean test output.',
);

throws_ok(
	sub
	{
		my $transaction2 = DBIx::ScopedTransaction->new( $dbh );
	},
	qr/DBD::([^:]+)::db begin_work failed: Already in a transaction/,
	'Fail to start two simultaneous transactions on the same database handle.',
);

lives_ok(
	sub
	{
		undef $transaction;
	},
	'Destroy transaction object.',
);
