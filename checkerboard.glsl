void mainImage(out vec4 fragColor,in vec2 fragCoord)
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv=fragCoord/iResolution.yy;
    
    vec3 white=vec3(1,1,1);
    vec3 black=vec3(0,0,0);
    
    bool isWhite=false;
    
    float squareSize=.05f;
    int xArity=int(floor(uv.x/squareSize));
    int yArity=int(floor(uv.y/squareSize));
    
    if((xArity%2==0&&yArity%2==1)||(xArity%2==1&&yArity%2==0)){
        isWhite=true;
    }
    
    vec3 col=isWhite?white:black;
    
    // Output to screen
    fragColor=vec4(col,1.);
}