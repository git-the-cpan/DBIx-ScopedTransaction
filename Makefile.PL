# Note: this file was auto-generated by Module::Build::Compat version 0.4205
require 5.006;
use ExtUtils::MakeMaker;
WriteMakefile
(
  'NAME' => 'DBIx::ScopedTransaction',
  'VERSION_FROM' => 'lib/DBIx/ScopedTransaction.pm',
  'PREREQ_PM' => {
                   'Carp' => 0,
                   'DBD::SQLite' => 0,
                   'DBI' => 0,
                   'Data::Dumper' => 0,
                   'Data::Validate::Type' => 0,
                   'File::Spec' => 0,
                   'Test::Exception' => 0,
                   'Test::FailWarnings' => 0,
                   'Test::More' => 0,
                   'Test::Warn' => 0,
                   'Try::Tiny' => 0
                 },
  'INSTALLDIRS' => 'site',
  'EXE_FILES' => [],
  'PL_FILES' => {},
  'test' => {
              'TESTS' => 't/*.t t/lib/*.t'
            }
)
;
