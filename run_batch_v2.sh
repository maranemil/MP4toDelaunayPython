#!/bin/sh

################################
### PythonDelaunay
################################

# remove old generated data
rm split/*.png
rm output/*.png

# generate PNG files every N seconds / frames
#ffmpeg -i load/in.mp4 -vf fps=1  *out%03d.png
ffmpeg -i load/in.mp4 -framerate 15 -r 15  -vf fps=1 split/out%03d.png

# start batch process
for i in split/*.png; do python3 delaunay.py $i --save -save-name output/${i/split/} -max-points=2500; done

# merge generated PNG delaunay images in one video
ffmpeg -i output/out%3d.png -r 15 -b:v 10000k tmp/out_$(date +%s).mp4



