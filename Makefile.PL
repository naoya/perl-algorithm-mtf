use inc::Module::Install;

perl_version '5.8.1';
name 'Algorithm-MTF';

all_from 'lib/Algorithm/MTF.pm';

requires 'perl' => '5.8.1';
requires 'Class::Accessor::Lvalue';
requires 'Params::Validate';

auto_install;
WriteAll;
