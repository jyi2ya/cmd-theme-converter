#!/usr/bin/env perl
use 5.020;
use utf8;
use warnings;
use autodie;
use feature qw/signatures postderef/;
use open qw/:std :utf8/;
no warnings qw/experimental::postderef/;

use JSON;
use DDP;

undef $/;
my $theme = decode_json <>;

my %convert_table = (
    ColorTable00 => 'black',
    ColorTable01 => 'red',
    ColorTable02 => 'green',
    ColorTable03 => 'yellow',
    ColorTable04 => 'purple',
    ColorTable05 => 'blue',
    ColorTable06 => 'cyan',
    ColorTable07 => 'white',
    ColorTable08 => 'brightBlack',
    ColorTable09 => 'brightRed',
    ColorTable10 => 'brightGreen',
    ColorTable11 => 'brightYellow',
    ColorTable12 => 'brightPurple',
    ColorTable13 => 'brightBlue',
    ColorTable14 => 'brightCyan',
    ColorTable15 => 'brightWhite',
    CursorColor  => 'cursorColor',
    DefaultBackground => 'background',
    DefaultForeground => 'foreground',
    ScreenColors => 'background',
    PopupColors => 'background',
    # ColorTable00 => 'black',
    # ColorTable01 => 'blue',
    # ColorTable02 => 'green',
    # ColorTable03 => 'cyan',
    # ColorTable04 => 'red',
    # ColorTable05 => 'purple',
    # ColorTable06 => 'yellow',
    # ColorTable07 => 'white',
    # ColorTable08 => 'brightBlack',
    # ColorTable09 => 'brightBlue',
    # ColorTable10 => 'brightGreen',
    # ColorTable11 => 'brightCyan',
    # ColorTable12 => 'brightRed',
    # ColorTable13 => 'brightPurple',
    # ColorTable14 => 'brightYellow',
    # ColorTable15 => 'brightWhite',
    # ScreenColors => 'black',
    # PopupColors  => 'black',
);

sub convert_color ($color) {
    $color =~ /^#(\w+)/;
    "00" . uc $1
}

print <<'EOF';
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Console]
EOF

while (my ($cmd_name, $wt_name) = each %convert_table) {
    my $cmd_color = convert_color $theme->{$wt_name};
    print <<EOF
"$cmd_name"=dword:$cmd_color
EOF
}
