var file=argument0

tiles = 16
//Performance variables
precision=round(80/tiles)
//Precision=Number of planes per piece.
renderdistance=room_width/42
//Renderdistance=Number of pieces on 1 row in the z axis
//Total amount of triangles=(renderdistance*8*precision*2)
modelwidth=200

ini_open(file)
if ini_read_real("number","pieces",-1)=-1
  {
  //Save file error
  show_debug_message("Error reading file")
  ini_close()
  }
else
  {
//Create models
longestx=0
for (i=0;i<ini_read_real("number","pieces",-1);i++)
  {
  if longestx<(ini_read_real(string(i),"x",0)-21)/42-0.5
    longestx=(ini_read_real(string(i),"x",0)-21)/42-0.5
  
  }
renderdistance=longestx
for (i=0;i<=longestx;i++)
  {
  wlayers[i]=d3d_model_create()
  }

//Read and create object
for (i=0;i<ini_read_real("number","pieces",-1);i++)
  {
  count=0
  h=(ini_read_real(string(i),"x",0)-42)/42
  j=(ini_read_real(string(i),"y",0)-42-21)/42
  xplus=textposx[ini_read_real(string(i),"id",0)]
  yplus=textposy[ini_read_real(string(i),"id",0)]
    //Single piece
    for (k=-360/tiles/2+j/tiles*360;k<360/tiles/2+j/tiles*360;k+=360/tiles/precision)
      {
        //Get x,y coordinates for part of piece
        var x1=sin(degtorad(k))*modelwidth
        var x2=sin(degtorad(k+360/tiles/precision))*modelwidth
        var y1=cos(degtorad(k))*modelwidth
        var y2=cos(degtorad(k+360/tiles/precision))*modelwidth
        //Draw primitves
        d3d_model_primitive_begin(wlayers[h], pr_trianglelist );
        
        //Top Venstre
        d3d_model_vertex_normal_texture(wlayers[h],  x2,y2,modelwidth/2, 0,1,0,(1-(count+1)/precision)/8+xplus,yplus);
        //Top Højre
        d3d_model_vertex_normal_texture(wlayers[h],  x1,y1,modelwidth/2, 0,1,0,(1-(count)/precision)/8+xplus,yplus);
        //Bot Venstre
        d3d_model_vertex_normal_texture(wlayers[h],  x2,y2,-modelwidth/2, 0,1,0,(1-(count+1)/precision)/8+xplus,yplus+1/8);
        
        //Bot Venstre
        d3d_model_vertex_normal_texture(wlayers[h],  x2,y2,-modelwidth/2, 0,1,0,(1-(1+count)/precision)/8+xplus,yplus+1/8);
        //Bot Højre
        d3d_model_vertex_normal_texture(wlayers[h],  x1,y1,-modelwidth/2, 0,1,0,(1-(count)/precision)/8+xplus,yplus+1/8);
        //Top Højre
        d3d_model_vertex_normal_texture(wlayers[h],  x1,y1,modelwidth/2, 0,1,0,(1-(count)/precision)/8+xplus,yplus);
        
        d3d_model_primitive_end(wlayers[h]);
        
      count++  
      }
  
  
  }







ini_close()
  }