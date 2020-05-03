for i in split/*.png; do python3 delaunay.py $i --save -save-name output/${i/split/} -max-points=2500; done

ffmpeg -i output/out%3d.png -r 15 -b:v 10000k tmp/out_$(date +%s).mp4

