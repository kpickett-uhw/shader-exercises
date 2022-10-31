#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution; 
uniform vec2 u_mouse; 
uniform float u_time;

void main() {
	vec2 st = gl_FragCoord.xy/u_resolution; 

    //MOVING COLORS AROUND WITH MOUSE POSITION
    //let's try to have mouse position drive a change in the uv space by adding mouse position to the uv value.
    
    //get the normalized mouse position value.
    vec2 mouseValue = u_mouse/u_resolution;
    //add the mousevalue to the uv value.
    //i'm also going to use fract() to force the sum to 'loop around' back to 0 once it exceeds 1.
    gl_FragColor = vec4(fract(st.x - mouseValue.x), fract(st.y - mouseValue.y), 0.0, 1.0);
}
