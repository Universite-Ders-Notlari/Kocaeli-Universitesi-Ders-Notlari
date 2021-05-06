#!/bin/bash
#opencv nin indirildiği dizine kopyalayıp çalıştırınız.
unzip opencv-3.1.0.zip
cd opencv-3.1.0
mkdir build
cd build


#cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON ..
cmake -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON ..

make -j4
sudo make install
sudo ldconfig

echo "işlem tamamlandı"
