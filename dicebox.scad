disize = 18.4; // 18.1 is too small; 18.96 is much too big
outerPadding = 0.84;
interDiGap = 2*outerPadding;
innerTop = 0;
fiddle = 0.12;
clearance = 0.2; // 0.36 is loose. 0.2 is tight but workable.
cutoutOffset = 0.3;
embossDepth = 0.24;
baseDepth = 3;

difference() {
    union() {
        cube([
            disize * 2 + outerPadding * 2 * 2 + clearance * 2 + interDiGap,
            disize * 1 + outerPadding * 2 * 2 + clearance * 2,
            baseDepth
        ]);
        translate([outerPadding+clearance, outerPadding+clearance, 0]) {
            cube([
                disize * 2 + outerPadding * 2 + interDiGap,
                disize * 1 + outerPadding * 2,
                disize * 1 + outerPadding + innerTop
            ]);
        }
    }
    translate([outerPadding + clearance, outerPadding + clearance, 0]) {
        translate([outerPadding, outerPadding, outerPadding]) {
            cube([disize, disize, disize + innerTop + fiddle]);
        }
        translate([outerPadding + disize + interDiGap, outerPadding, outerPadding]) {
            cube([disize, disize, disize + innerTop + fiddle]);
        }
        translate([-fiddle,disize/2 + outerPadding,outerPadding + disize * cutoutOffset]) {
            rotate([45,0,0]) {
                cube([
                    disize * 2 + outerPadding * 2 + interDiGap + 2 * fiddle,
                    disize * 1 + outerPadding * 2,
                    disize * 1 + outerPadding * 2
                ]);
            }
        }
        translate([disize/2 + outerPadding,-fiddle,outerPadding + disize * cutoutOffset]) {
            rotate([45,0,90]) {
                cube([
                    disize * 1 + outerPadding * 2 + 2 * fiddle,
                    disize * 1 + outerPadding * 2,
                    disize * 1 + outerPadding * 2
                ]);
            }
        }
        translate([3 * disize/2 + outerPadding + interDiGap,-fiddle,outerPadding+ disize * cutoutOffset]) {
            rotate([45,0,90]) {
                cube([
                    disize * 1 + outerPadding * 2 + 2 * fiddle,
                    disize * 1 + outerPadding * 2,
                    disize * 1 + outerPadding * 2
                ]);
            }
        }
        translate([outerPadding, outerPadding + disize, outerPadding - embossDepth]) {
            linear_extrude(1) {
                fontSize = 4.7;
                space = 1.5;
                translate([0.8, -disize/2 - fontSize/2, 0]) {
                    text("ROLL", fontSize);
                }
                translate([0.6 + disize + interDiGap, -disize/2 - fontSize/2, 0]) {
                    text("WELL", fontSize);
                }
            }
        }
    }
}

translate([0, disize + outerPadding * 4 + clearance * 2 + 1]) {
    difference() {
        cube([
            disize * 2 + outerPadding * 2 * 2 + clearance * 2 + interDiGap,
            disize * 1 + outerPadding * 2 * 2 + clearance * 2,
            disize * 1 + outerPadding * 2 - baseDepth
        ]);
        translate([outerPadding, outerPadding, outerPadding]) {
            cube([
                disize * 2 + outerPadding * 2 + clearance * 2 + interDiGap,
                disize * 1 + outerPadding * 2 + clearance * 2,
                disize * 1 + outerPadding * 1 + fiddle - baseDepth
            ]);
        }
        translate([outerPadding, outerPadding * 2 + disize + clearance, outerPadding - embossDepth]) {
            linear_extrude(1) {
                fontSize = 3.52;
                space = 1.5;
                translate([0, -disize/2 + fontSize * (-0.5 + space), 0]) {
                    text("Happy Birthday '22", fontSize);
                }
                translate([0, -disize/2 + fontSize * -0.5, 0]) {
                    text("Thanks for 'dragon'", fontSize);
                }
                translate([4, -disize/2 + fontSize * (-0.5 - space), 0]) {
                    text("me to RPGs <3", fontSize);
                }
            }
        }
    }
}
