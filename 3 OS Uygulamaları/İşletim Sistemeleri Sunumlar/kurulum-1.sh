clear
echo "SİSTEM GÜNCELLEME BAŞLATILIYOR..."
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade &&sudo apt-get autoremove
echo " GÜNCELLEME İŞLEMİ TAMAMLANDI..."
clear
echo "YÜKLEME BAŞLATILIYOR..."
sudo apt-get -y install libopencv-dev build-essential cmake git libgtk2.0-dev pkg-config python-dev python-numpy libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff4-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip
echo "YÜKLEME TAMAMLANDI..."


