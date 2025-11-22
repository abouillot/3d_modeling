$fn = 20;


width = 69.2;
length= 32.5;
height = 2.6;
module board() {
union() {
linear_extrude(2.6)
difference() {
    square([width, length]);
    translate([1.3 + 3.2/2, 2+4/2]) circle(d=3.2);
    translate([1.3 + 3.2/2, length -(2+4/2)]) circle(d=3.2);
    translate([66.5, length/2]) circle(d = 2.5);
    
    translate([26.5, 0]) circle(r = 1);
    translate([56.5, 0]) circle(r = 1);
    translate([26.5, length]) circle(r = 1);
    translate([56.5, length]) circle(r = 1);
}

translate([34.2,2.5,2.6])linear_extrude(3,4) square(27);

translate([-14.7, 10, -1]) linear_extrude(4.5) square([14.7, 12]);

translate([width, 5, -1.4]) linear_extrude(6.6) square([1.6, 6.6]);

translate([width, 19, -1.4]) linear_extrude(6.6) square([1.6, 6.6]);

translate([width + 1.6, 19 + 6.6/2, -1.4 + 6.6/2])  rotate([ 0,90, 0])linear_extrude(6.6) circle(d=5.5);

translate([width + 1.6, 5 + 6.6/2, -1.4 + 6.6/2])  rotate([ 0,90, 0])linear_extrude(6.6) circle(d=5.5);

}
}

thick = 1.5;
margin = .5 + thick;
air_gap = 3;

PRINTOUT = 0;
ASSEMBLY = 1;

button_recess = .5;
//difference() 
if (0) {
button_recess = 0.3;
translate([-margin+4, -margin-air_gap + length + 2*margin + 2* air_gap - 3, -margin- 5]) 
    rotate([0, 180, 90]) linear_extrude(button_recess +.01)
    text("RX", valign="center", halign="left", font="Arial", size = 3);
    
translate([-margin+4, -margin-air_gap + 3, -margin- 5]) 
    rotate([0, 180, 90]) linear_extrude(button_recess)
    text("TX", valign="center", halign="right", font="Arial", size = 3);

}

module bottom() {
difference() {
    
translate([-margin, -margin-air_gap, -margin- 5]) linear_extrude(thick + 2 * margin + 5) square([width + 2* margin, length + 2*margin + 2* air_gap]);


{

translate([width -margin, -margin-air_gap + length + 2*margin + 2* air_gap - 3, -margin- 5 + button_recess +.01]) 
    rotate([0, 180, 90]) linear_extrude(button_recess +.1)
    text("RX", valign="center", halign="left", font="Arial", size = 3);
    
translate([width -margin, -margin-air_gap + 3, -margin- 5 +.01 ]) 
    rotate([0, 180, 90]) linear_extrude(button_recess)
    text("TX", valign="center", halign="right", font="Arial", size = 3);

}


translate([-margin + thick , -margin-air_gap+ thick, -margin + thick - 5]) linear_extrude(thick + 2 * margin + 5) square([width + 2* margin - + thick * 2, length + 2*margin - + thick * 2+2*air_gap]);

#translate([-margin  +7, -margin+ 7, -margin - 7 -.1]) linear_extrude(thick + 2 * margin + 5) square([width - 14 + thick * 2, length +  - 14 + thick * 2]);

translate([-14.7, 9.75, -1]) linear_extrude(4.5) square([14.7, 12.5]);

translate([width, 5.5, -1]) linear_extrude(7) square([2, 7]);

#translate([width, 20, -1]) linear_extrude(7) square([2, 7]);

translate([width + 1.6, 19 + 6.6/2, -1.4 + 6.6/2])  rotate([ 0,90, 0])linear_extrude(6.6) circle(d=5.5);

translate([width + 1.6, 5 + 6.6/2, -1.4 + 6.6/2])  rotate([ 0,90, 0])linear_extrude(6.6) circle(d=5.5);
}


for(y = [-margin + 7 :3:- margin + 7 + length - 14])
translate([-margin, y, -margin- 5]) linear_extrude(thick) square([width + 2* margin, 1.5]);

translate([0, 0, -margin - 5 + thick]) linear_extrude(margin + 5 + 3 - thick) {
    translate([1.3 + 3.2/2, 2.25+4/2]) circle(d=2.8);
    translate([1.3 + 3.2/2, length -(2.25+4/2)]) circle(d=2.8);
    translate([67, length/2]) circle(d = 2);
    
    translate([27, 0]) circle(r = .9);
    translate([57, 0]) circle(r = .9);
    translate([27, length]) circle(r = .9);
    translate([57, length]) circle(r = .9);
}

translate([0, 0, -margin - 5 + thick ]) linear_extrude(margin + 5 - thick) {
    translate([1.3 + 3.2/2, 2.25+4/2]) circle(d=6);
    translate([1.3 + 3.2/2, length -(2.25+4/2)]) circle(d=6);
    translate([67, length/2]) circle(d = 5);
    
    translate([27, 0]) circle(r = 2);
    translate([57, 0]) circle(r = 2);
    translate([27, length]) circle(r = 2);
    translate([57, length]) circle(r = 2);
}
}



module top() {
difference() {
translate([-margin, -margin-air_gap, thick + margin]) linear_extrude(height+  margin + 5) square([width + 2* margin, length + 2*margin + 2* air_gap]);

translate([-margin + thick , -margin-air_gap+ thick, -.01]) linear_extrude(height +  2 * margin + 5) square([width + 2* margin - + thick * 2, length + 2*margin - + thick * 2+2*air_gap]);

translate([-margin  +7, -margin+ 7, thick + margin]) linear_extrude(thick + 2 * margin + 5 ) square([width - 14 + thick * 2, length +  - 14 + thick * 2]);


translate([-14.7, 9.75, -1]) linear_extrude(4.5) square([14.7, 12.5]);

translate([width, 5.5, -1]) linear_extrude(7) square([2, 7]);

translate([width, 20, -1]) linear_extrude(7) square([2, 7]);

translate([width + 1.6, 19 + 6.6/2, -1.4 + 6.6/2])  rotate([ 0,90, 0])linear_extrude(6.6) circle(d=5.5);

translate([width + 1.6, 5 + 6.6/2, -1.4 + 6.6/2])  rotate([ 0,90, 0])linear_extrude(6.6) circle(d=5.5);


{
translate([width -margin, -margin-air_gap + length + 2*margin + 2* air_gap - 3,(thick + margin + height+  margin + 5 - button_recess )]) 
    rotate([0, 0, 90]) linear_extrude(button_recess +.1)
    #text("RX", valign="center", halign="right", font="Arial", size = 3);
    
translate([width -margin, -margin-air_gap + 3, (thick + margin + height+  margin + 5 - button_recess )]) 
    rotate([0, 0, 90]) linear_extrude(button_recess + .1)
    text("TX", valign="center", halign="left", font="Arial", size = 3);

}
}


for(y = [-margin + 7 :3:- margin + 7 + length ])
translate([-margin, -margin + y,  height + 2 * margin + 5]) linear_extrude(thick) square([width + 2* margin, 1.5]);


difference() {
    union() {
translate([0, 0, height ]) linear_extrude(-.1+thick + 2*margin+5+.03) {
    translate([1.3 + 3.2/2, 2.25+4/2]) circle(d=6);
    translate([1.3 + 3.2/2, length -(2.25+4/2)]) circle(d=6);
    translate([67, length/2]) circle(d = 5);
    
    translate([27, 0]) circle(r = 2);
    translate([57, 0]) circle(r = 2);
    translate([27, length]) circle(r = 2);
    translate([57, length]) circle(r = 2);
}
}
union(){
translate([0, 0, height- .1]) linear_extrude(5) {
#    translate([1.3 + 3.2/2, 2.25+4/2]) circle(d=3.6);
    translate([1.3 + 3.2/2, length -(2.25+4/2)]) circle(d=3.6);
    translate([67, length/2]) circle(d = 3.6);
    
    translate([27, 0]) circle(r = 1.5);
    translate([57, 0]) circle(r = 1.5);
    translate([27, length]) circle(r = 1.5);
    translate([57, length]) circle(r = 1.5);
}
}
}

translate([width, -margin-air_gap+thick, 5]) rotate([ -90, 0, 180]) rotate([ 0, 90, 0]) linear_extrude(width) polygon([[0,0], [1.5, 1.5], [1.5, 4], [0, 4], [0,0]]);


translate([0, length+margin -thick +air_gap, 5]) rotate([ -90, 0, 0]) rotate([ 0, 90, 0]) linear_extrude(width) polygon([[0,0], [1.5, 1.5], [1.5, 4], [0, 4], [0,0]]);

}


if (ASSEMBLY) {
difference() {
union() {
//rotate([180, 0, 0]) 
    translate([0, 0, .2]) top();
    bottom();
    translate([0, 0, .1]) board();
}
//    translate([-50, -60, -20]) linear_extrude(45) square([70, 120]);
}
    }
if (PRINTOUT) {
bottom();
translate([0, -13, 6]) rotate([180, 0, 0]) top();
}

//top();
//board();