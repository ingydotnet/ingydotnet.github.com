use strict;
use YAML::XS;
use IO::All;

my $file = shift or die;

my $data = YAML::XS::LoadFile($file);

$data->{projects} = [];

for my $project (io('projects')->readdir) {
    my $file = io("projects/$project/meta.yaml");
    next unless $file->exists;
    my $meta = Load($file->all);
    push @{$data->{projects}}, $meta;
}

print Dump($data);
