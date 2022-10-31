#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution; 
uniform vec2 u_mouse; 
uniform float u_time;

void main() {
	vec2 st = gl_FragCoord.xy/u_resolution; 

    //TEST 3: THE ~FOURTH DIMENSION~
    
    //HEARTBEAT STRENGTH
    //i want to get a 'heartbeat effect'
    //i think i can do this by using sin
    //sin goes from 1 to -1 across time.
    //that means it passes through the values .5, .5, -.5, and -.5 -- that's 4 'beats'. 
    //let's say i only want to use the positive beats-- the .5s.
    //i can check how close a sin value is to .5, and use that to drive the brightness of a color.
    //so let's get our sin function going...
    //multiply time by 2.5 to make it faster.
    float sinwave = sin(u_time * 2.5);
    //now, let's check how close sinwave is to .5
    //i'll call this closeness value 'hs' for heartbeatStrength
    //i'll use oneminus because i want to get a value where the closer we are to a heartbeat, the closer the heartbeat value is to '1'.
    float hs  = 1.0 - abs(sinwave - .5);   
    //clamp the output to prevent negative values causing weird colors.
    hs = clamp(hs, 0.0, 1.0);
       
    //HEARTBEAT STRENGTH-DRIVEN COLOR
    //great, we have a heartbeat value that goes from 0 at weakest, to 1 at strongest. let's use that value to drive a color. Let's make something that goes from purple at weakest, to red at strongest.
    //color is (r, g, b, alpha)
    //so i want the red to always be on but to get a bit stronger when the heartbeat is at its strongest
    //and i want the blue to only show up when the heartbeat is at its weakest -- and mix with the red then to make purple.
    vec4 color = vec4(.7 + (.3 *hs), 0.0, 1.0-hs, 1.0);

    //SIMPLE SPOTLIGHT AROUND THE MOUSE CURSOR
    //now let's make our spotlight that follows the mouse.
    //normalize mouse position
    vec2 mouseValue = u_mouse/u_resolution; 
    //get distance from mouse pos to the pixel being rendered by this fragment... when rendered out, this value looks like a black 'spotlight' around the mouse.
    float len = distance(st, mouseValue);
    //we have a spotlight. now change the spotlight size by multiplying the effect by a constant...
    len = len * 5.0;
    //i think it'd be cool to make the length vary with the heartbeat strength as well.
    len -= hs;
    vec4 mouseCircle = vec4(len, len, len, 1.0);
    //invert the color of the circle.
    vec4 mouseCircleInverted = vec4(1.0-mouseCircle.rgb, 1.0);
    
    //PUTTING IT ALL TOGETHER
    //multiply the simple spotlight by the heartbeat color!
    gl_FragColor = mouseCircleInverted * color;
}
