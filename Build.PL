use strict;
use Module::Build;

Module::Build
->new( module_name => "Template::Plugin::YAML",
         license     => 'perl',
         requires    => {
             'Test::More' => 0,
             'Template'   => 0,
             'YAML'       => 0,
         },
         create_makefile_pl => 'traditional',
       )
  ->create_build_script;
