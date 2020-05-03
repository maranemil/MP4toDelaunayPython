
#rm split/*.png
#rm output/*.png
#ffmpeg -i load/in.mp4 -vf fps=1  *out%03d.png  
ffmpeg -i load/in.mp4 -framerate 15 -r 15  -vf fps=1 split/out%03d.png
for i in split/*.png; do python3 scipy_delaunay.py --input $i; done
ffmpeg -i output/out%3d.png -r 15 -b:v 10000k tmp/out_$(date +%s).mp4

# ffmpeg -i in1.mp4 -filter:v "setpts=1.5*PTS" -y output.mp4
# ffmpeg -i output.mp4 -vf eq=saturation=1.5 -y output2.mp4

### PythonDelaunay
