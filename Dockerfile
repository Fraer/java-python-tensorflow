FROM rappdw/docker-java-python

# To be used by tensorflow from python
ADD https://github.com/OlafenwaMoses/ImageAI/releases/download/1.0/resnet50_coco_best_v2.0.1.h5 /tmp/

# To be used by tensorflow from Java/Scala
ADD http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_coco_2018_01_28.tar.gz /tmp/
RUN tar -xvzf /tmp/ssd_mobilenet_v1_coco_2018_01_28.tar.gz -C /tmp/

# Install imageAI dependencies
RUN pip3 install tensorflow numpy scipy opencv-python pillow matplotlib h5py keras jep

# ImageAI lib
RUN pip3 install --user https://github.com/OlafenwaMoses/ImageAI/releases/download/2.0.2/imageai-2.0.2-py3-none-any.whl

# To avoid issue with tensorflow loading from jep
RUN export LD_PRELOAD=/usr/local/lib/python3.6/site-packages/tensorflow/libtensorflow_framework.so
