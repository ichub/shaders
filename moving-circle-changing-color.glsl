vec3 circle(vec2 p,vec2 c,float r){
    float distance=length(p-c);
    bool inCircle=distance<r;
    return inCircle?vec3(1,1,1):vec3(0,0,0);
}

void mainImage(out vec4 fragColor,in vec2 fragCoord){
    vec3 color=vec3(fragCoord,1);
    
    vec2 circlePos=iResolution.xy/2.;
    float movementRadius=20.;
    float time=float(iFrame)*.1;
    circlePos+=vec2(cos(float(time))*movementRadius,sin(float(time))*movementRadius);
    
    vec2 normPos=fragCoord/iResolution.xy;
    color=vec3(normPos*sin(iTime*5.)+cos(iTime*3.),1);
    
    color*=circle(fragCoord,circlePos,100.f);
    
    fragColor=vec4(color,1.);
}

