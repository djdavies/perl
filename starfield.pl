#!/usr/bin/perl
# Another starfield prog, uses curses
# Not much documentation
$numstars = 100;
use Time::HiRes qw(usleep);
use Curses;
$screen = new Curses;
noecho;
curs_set(0);

for ($i = 0; $i < $numstars; $i++) {
    $star_x[$i] = rand(80);
    $star_y[$i] = rand(24);
    $star_s[$i] = rand(4) + 1;
}
while (1) {
    $screen->clear;
    for ($i = 0; $i < $numstars; $i++) {
        $star_x[$i] -= $star_s[$i];
        if ($star_x[$i] < 0) {
            $star_x[$i] = 80;
        }
        $screen->addch($star_y[$i], $star_x[$i], ".");
    }
    $screen->refresh;
    usleep 50000;
}
