//review usb port
//review buttons

PRINTOUT = 1;
ASSEMBLY = 0;


$fn = 20;


width = 58 + .6;
length= 28;
height = 1.2;
module board() {
    union() {
        linear_extrude(height)
        difference() {
            square([width, length]);
        }
        // usb
        translate([-0.5,10, height])linear_extrude(2.5) square([5.8, 8]);
//        translate([-10.5,10, height])linear_extrude(2.5) square([15.8, 8]);
        // buttons
        translate([10, 2.5,height]) linear_extrude(2) square([6.2, 3.6], center=true);
#        translate([10, 2.5,height]) linear_extrude(2) square([.5], center=true);
      translate([10, length - 2.5, height]) linear_extrude(2) square([6.2, 3.6], center=true);
  #      translate([10, length - 2.5, height]) linear_extrude(2) square(.5, center=true);
        // module
        translate([28, 5, height]) linear_extrude(2.3) square([30, 18]);
        // gpios
        translate([18, 2 - 2.54/2, height]) linear_extrude(8) square([2.54*12, 2.54]);
        translate([18, 26  -2.54/2, height]) linear_extrude(8) square([2.54*12, 2.54]);
    }
}

thick = 1.5;
margin = .2 + thick;
air_gap = 2;
air_height = 1;

module bottom() {
    difference() {
        translate([-margin, -margin-air_gap, -margin- air_height]) linear_extrude(thick + 2 * margin + air_height+3) square([width + 2* margin, length + 2*margin + 2* air_gap]);

        translate([-margin + thick , -margin-air_gap+ thick, -margin + thick - air_height]) linear_extrude(thick + 2 * margin + air_height +3) square([width + 2* margin - + thick * 2, length + 2*margin - + thick * 2+2*air_gap]);

        translate([-margin  +7, -margin+ 7, -margin - 7 -.1]) linear_extrude(thick + 2 * margin + air_height) square([width - 14 + thick * 2, length +  - 14 + thick * 2]);

        // usb
        translate([-10.5,10, height-.3])linear_extrude(2.6) square([15.8, 8]);
}

    translate([0, 0, -margin - air_height]) linear_extrude(margin + air_height -.1) {
        translate([5, 14]) circle(d=6);
        translate([15, 7]) circle(d=6);
        translate([15, 21]) circle(d=6);
        translate([25, 14]) circle(d=6);
        translate([45, 10]) circle(d=6);
        translate([45, 18]) circle(d=6);
    }
    
                translate([-margin + thick +10, -margin-air_gap+ thick+.5, -margin + thick - air_height]) linear_extrude(2.3) circle(d = 3);

                translate([-margin + thick +40, -margin-air_gap+ thick+.5, -margin + thick - air_height]) linear_extrude(2.3) circle(d = 3);
    
                translate([-margin + thick +10, -margin-air_gap+ thick + length + margin+2, -margin + thick - air_height]) linear_extrude(2.3) circle(d = 3);
                translate([-margin + thick +40, -margin-air_gap+ thick + length + margin+2, -margin + thick - air_height]) linear_extrude(2.3) circle(d = 3);

}

button_shell_out = 6;
button_shell_in = 4;
button_diam = 7;
module top() {
difference() {
    union() {
        difference() {
            translate([-margin, -margin-air_gap, 4]) linear_extrude(height +thick + 2 * margin +1) square([width + 2* margin, length + 2*margin + 2* air_gap]);
            translate([-margin + thick , -margin-air_gap+ thick, 4-.01]) linear_extrude(height + 2 * margin +1) square([width + 2* margin - + thick * 2, length + 2*margin - + thick * 2+2*air_gap]);


            # translate([width, 3, height +thick + 2 * margin +5-.5]) linear_extrude(2)
    rotate([0, 0, 180])
    text("El Raton", valign="top", halign="left", font="Arial", size = 9);


        }
        // side holders
       translate([width, -margin-air_gap+thick,5]) rotate([ -90, 0, 180]) rotate([ 0, 90, 0]) linear_extrude(width) polygon([[0,0], [1.5, 1.5], [1.5, 4], [0, 4], [0,0]]);
        translate([0, length+margin -thick +air_gap, 5]) rotate([ -90, 0, 0]) rotate([ 0, 90, 0]) linear_extrude(width) polygon([[0,0], [1.5, 1.5], [1.5, 4], [0, 4], [0,0]]);

        // buttons
       #translate([10, 2, height + 5.5]) linear_extrude(3) circle(d = button_shell_out);
        translate([10, length -2, height+5.5]) linear_extrude(3) circle(d = button_shell_out);
    }


translate([-thick-2, (length - 12) / 2, -1]) linear_extrude(5) square([14.7, 12]);
    
// buttons
translate([10, 2, 0]) linear_extrude(18) circle(d = button_shell_in);
translate([10, length-2, 0]) linear_extrude(18) circle(d = button_shell_in);

}

        // board holder
        translate([23, 14, height + .1]) linear_extrude(height +thick + 2 * margin +3)circle(d=6);

// buttons
difference() {
//    translate([10, 0, height + 7]) linear_extrude(2) circle(d = button_shell_out);
//    translate([10, 0, height + 7]) linear_extrude(2) circle(d = button_shell_in);
}
difference() {
//translate([10, length, height+7]) linear_extrude(2) circle(d = button_shell_out);
//translate([10, length, height+7]) linear_extrude(2) circle(d = button_shell_in);
}



// buttons
translate([10, 2, height+2]) linear_extrude(12.5) circle(d = button_shell_in-.8);
difference() {
    union() {
    translate([10, 2, height+2]) linear_extrude(1) circle(d = button_shell_out);
translate([10, 2, height +3]) cylinder(2, d1=button_shell_out, d2=button_shell_out);
    }
    translate([5, -2, height+2]) linear_extrude(3) square([10, 2]);
}

translate([10, length-2, height +2]) linear_extrude(12.5) circle(d = button_shell_in-.5);
difference() {
    union() {
translate([10, length-2, height +2]) linear_extrude(1) circle(d = button_shell_out);
translate([10, length-2, height +3]) cylinder(2, d1=button_shell_out, d2=button_shell_out);
    }
    translate([5, length+.2, height+2]) linear_extrude(3) square([10, 2]);
}
}

if (ASSEMBLY) {
difference() {
union() {
//rotate([180, 0, 0]) 
    translate([0, 0, .2]) 
    
        difference() {
            top();

        }
    bottom();
    translate([0, 0, .1]) board();
}
    translate([-10, 3, -20]) linear_extrude(45) square([25, 40]);
}
    }
if (PRINTOUT) {
translate([0, -40, 0]) bottom();
translate([0, -50, 8.1]) 
            rotate([180, 0, 0]) 
    difference() {
            top();

        }
}

echo(
/*thick + margin */+ height+  margin + 5);
//translate([0, 20, 0]) board();
//top();
//board();