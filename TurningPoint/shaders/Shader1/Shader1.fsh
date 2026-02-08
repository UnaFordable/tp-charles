//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
uniform vec4 u_color;

void main()
{
	/* SET BLACK AND WHITE
	vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    float gray = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
    gl_FragColor = vec4(gray, gray, gray, texColor.a);
	*/
	
	 //SET ONE COLOR
	vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
	gl_FragColor = vec4(u_color.rgba * texColor.rgba);
	
	
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
}
