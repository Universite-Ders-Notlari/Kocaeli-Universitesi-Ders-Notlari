#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/imgproc/imgproc.hpp>
#include<opencv2/ml/ml.hpp>
#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "qdebug.h"
#include <opencv2/opencv.hpp>
#include <QDebug>
//#include<opencv2/ts/ts.hpp>
#include<map>
//#include "cvconfig.h"
#include <QDir>
#include <QString>
#include <opencv/highgui.h>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include "opencv2/video.hpp"
#include <opencv2/core/core.hpp>
#include <opencv2/ml/ml.hpp>
#include <iostream>
#include <sstream>
#include<vector>
#include<string>
#include<stdio.h>
#include<stdlib.h>
#include<ml.h>
void resimdenkesital(cv::Mat kaynakresim, int x1, int y1, int x2, int y2 )
{
    cv::Mat yeni;int oran;
    cv::Rect kare(cv::Point(x1,y1),cv::Point(x2,y2));
    yeni=kaynakresim(kare);
    cv::imshow("Gösterilecek resim",yeni);

    cv::imwrite("/home/cihan/Masaüstü/denemeler/PlakaYeriBelirleme/plaka.png",yeni);

}


void resmitara(cv::Mat kaynakresim)
{
    int kaynak,yedek,ciz=0;

    int x,y,basx=0,basy=0,bitx=0,bity=0,oran,bayrak=0,siyah_x=0,siyah_y=0;

         for(y=0;y<kaynakresim.rows;y++)
         {

             for(x=0;x<kaynakresim.cols;x++)
             {
             kaynak=kaynakresim.at<unsigned char>(x,y);
             if(kaynak==0)
             {
                 siyah_x++;


             if(siyah_x>70)
             {
                 if(bayrak==0)
                 {
                     basy=x-siyah_x;
                     basx=y;
                     bayrak=1;
                     ciz++;
                     siyah_x=0;

                 }
                if(bayrak==1 && siyah_x>70)
                 {
                     bity=x;
                     bitx=y;
                     ciz++;

                 }

             }
             }
             else {//PİXELL SİYAH DEĞİLSE

                 siyah_x=0;
             }

             }

         }

         resimdenkesital(kaynakresim,basx,basy,bitx,bity);



}

int karebulyatay(cv::Mat kaynakresim)
{

    int pixelrengi1,pixelrengi2,pixelrengi3,yedek,ciz=0;

    int x,y,basx=0,basy=0,bitx=0,bity=0,oran,bayrak=0,siyah_x=0,siyah_y=0;

         for(y=2;y<kaynakresim.cols-2;y++)
         {

             for(x=2;x<kaynakresim.rows-2;x++)
             {
             pixelrengi1=kaynakresim.at<unsigned char>(x,y);


             if(pixelrengi1==0 )//resimdeki pixel değeri siyah sa
             {
                 siyah_x++;


             if(siyah_x>70)
             {
                 if(bayrak==1)
                  {
                      bity=x;
                      bitx=y;
                      ciz++;

                      siyah_x=0;

                  }

                 if(bayrak==0)
                 {
                     basy=x-siyah_x;
                     basx=y;
                     bayrak=1;
                     ciz++;
                     siyah_x=0;

                 }



             }
             }
             else {//PİXELL SİYAH DEĞİLSE

                 siyah_x=0;
             }

             }
             if(basx!=0 && bitx!=0 && bitx>basx)
             {
             resimdenkesital(kaynakresim,basx,basy,bitx,bity);
             }

         }

         qDebug() <<basx<<basy<<bitx<<bity;

}










int karebul(cv::Mat kaynakresim)
{

    int pixelrengi1,pixelrengi2,pixelrengi3,yedek,ciz=0;

    int x,y,basx=0,basy=0,bitx=0,bity=0,oran,bayrak=0,siyah_x=0,siyah_y=0;

         for(x=2;x<kaynakresim.rows-2;x++)
         {

             for(y=2;y<kaynakresim.cols-2;y++)
             {
             pixelrengi1=kaynakresim.at<unsigned char>(x,y);

             if(pixelrengi1==0 )//resimdeki pixel değeri siyah sa
             {
                 siyah_x++;


             if(siyah_x>70)
             {
                 if(bayrak==1)
                  {
                      bity=y;
                      bitx=x;
                      ciz++;

                      siyah_x=0;

                  }

                 if(bayrak==0)
                 {
                     basy=y-siyah_x;
                     basx=x;
                     bayrak=1;
                     ciz++;
                     siyah_x=0;

                 }



             }
             }
             else {//PİXELL SİYAH DEĞİLSE

                 siyah_x=0;
             }

             }
             if(basx!=0 && bitx!=0 && bitx>basx)
             {
             resimdenkesital(kaynakresim,basx,basy,bitx,bity);
             }

         }

         qDebug() <<basx<<basy<<bitx<<bity;

}

int gendata(cv::Mat kaynakresim)
{
    const int MIN_CONTOUR_AREA = 100;

    const int RESIZED_IMAGE_WIDTH = 20;
    const int RESIZED_IMAGE_HEIGHT = 30;

             // input image
       cv::Mat imgGrayscale;               //
       cv::Mat imgBlurred;                 // declare various images
       cv::Mat imgThresh;                  //
       cv::Mat imgThreshCopy;              //

       std::vector<std::vector<cv::Point> > ptContours;
       std::vector<cv::Vec4i> v4iHierarchy;
        cv::Mat vektordenresimciz;
        cv::Mat yeniresim;
      int harf[36]={ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
                  'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
                  'U', 'V', 'W', 'X', 'Y', 'Z' };
        std::vector<int> intValidChars(&harf[0],&harf[0]+35);
    kaynakresim = cv::imread("/home/cihan/Masaüstü/denemeler/1.png");
   // cv::imshow("Gösterilecek resim",kaynakresim);//Resmi açma
    if (kaynakresim.empty()) {                               // if unable to open image
           std::cout << "error: image not read from file\n\n";         // show error message on command line
           return(0);                                                  // and exit program
       }

cv::cvtColor(kaynakresim, imgGrayscale, CV_BGR2GRAY);
cv::GaussianBlur(imgGrayscale,              // input image
    imgBlurred,                             // output image
    cv::Size(5, 5),                         // smoothing window width and height in pixels
    0);

cv::adaptiveThreshold(imgBlurred,           // input image
    imgThresh,                              // output image
    255,                                    // make pixels that pass the threshold full white
    cv::ADAPTIVE_THRESH_GAUSSIAN_C,         // use gaussian rather than mean, seems to give better results
    cv::THRESH_BINARY_INV,                  // invert so foreground will be white, background will be black
    11,                                     // size of a pixel neighborhood used to calculate threshold value
    2);

cv::imshow("imgThresh", imgThresh);         // show threshold image for reference

imgThreshCopy = imgThresh.clone();

cv::findContours(imgThreshCopy,             // input image, make sure to use a copy since the function will modify this image in the course of finding contours
        ptContours,                             // output contours
        v4iHierarchy,                           // output hierarchy
        cv::RETR_EXTERNAL,                      // retrieve the outermost contours only
        cv::CHAIN_APPROX_SIMPLE);


for (int i = 0; i < ptContours.size(); i++) {                           // for each contour
        if (cv::contourArea(ptContours[i]) > MIN_CONTOUR_AREA) {                // if contour is big enough to consider
            cv::Rect boundingRect = cv::boundingRect(ptContours[i]);                // get the bounding rect

            cv::rectangle(kaynakresim, boundingRect, cv::Scalar(0, 0, 255), 2);      // draw red rectangle around each contour as we ask user for input

            cv::Mat matROI = imgThresh(boundingRect);           // get ROI image of bounding rect

            cv::Mat matROIResized;
            cv::resize(matROI, matROIResized, cv::Size(RESIZED_IMAGE_WIDTH, RESIZED_IMAGE_HEIGHT));     // resize image, this will be more consistent for recognition and storage

          // cv::imshow("matROI", matROI);                               // show ROI image for reference
           // cv::imshow("matROIResized", matROIResized);                 // show resized ROI image for reference
           // cv::imshow("kaynakresim", kaynakresim);       // show training numbers image, this will now have red rectangles drawn on it

            int intChar = cv::waitKey(0);           // get key press

            if (intChar == 27) {        // if esc key was pressed
                return(0);              // exit program
            } else if (std::find(intValidChars.begin(), intValidChars.end(), intChar) != intValidChars.end()) {     // else if the char is in the list of chars we are looking for . . .

                vektordenresimciz.push_back(intChar);       // append classification char to integer list of chars

                cv::Mat matImageFloat;                          // now add the training image (some conversion is necessary first) . . .
                matROIResized.convertTo(matImageFloat, CV_32FC1);       // convert Mat to float

                cv::Mat matImageFlattenedFloat = matImageFloat.reshape(1, 1);       // flatten

                yeniresim.push_back(matImageFlattenedFloat);       // add to Mat as though it was a vector, this is necessary due to the
                                                                                            // data types that KNearest.train accepts
            }   // end if
        }   // end if
    }   // end for

    std::cout << "training complete\n\n";

                // save classifications to file ///////////////////////////////////////////////////////



 return(0);


}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

void kosegen(cv::Mat kaynakresim,cv::Mat anaresim)
{
    int pixelrengi;

    int kenar[1600][3],kare[1600][6],kenarsayisi=0;
    int x,y,basx=0,basy=0,bitx=0,bity=0,siyah_say=0;

    for(x=0;x<kaynakresim.cols;x++)
    {

        for(y=0;y<kaynakresim.rows;y++)
        {
        pixelrengi=kaynakresim.at<unsigned char>(y,x);
//qDebug()<<x<<y;
             if(pixelrengi==0 )//resimdeki pixel değeri siyah sa
             {
            siyah_say++;
             }
             else if(pixelrengi==255 )
             {
                 if(siyah_say>30 )
                 {
                     kenar[kenarsayisi][0]=x;
                     kenar[kenarsayisi][1]=y-siyah_say;
                     kenar[kenarsayisi][2]=y;
                     kenarsayisi++;
                     qDebug()<<x<<y-siyah_say<<siyah_say;
                      siyah_say=0;

                 }
                 siyah_say=0;
             }

        }
    }
    qDebug()<<kenarsayisi;

    //AŞAĞIDAKİ DÖNGÜ DİK KENARLARI GÖSTERİYOR

    for (int var = 0; var < kenarsayisi; ++var) {
      cv::rectangle(kaynakresim,cv::Point(kenar[var][0]-20,kenar[var][1]),cv::Point(kenar[var][0]+20,kenar[var][2]),cv::Scalar(100,100,50),1,cv::LINE_4,0);

   }

    int sonuc,en,oran,boy,kontrol=0,karesayisi=0,hassasiyet;
hassasiyet=5;
    for (int x = 0; x < kenarsayisi; x++) {
        for (int y = 0; y < kenarsayisi; y++) {
            if (x!=y) {
                sonuc= kenar[y][1]-kenar[x][1];
                if (sonuc<=hassasiyet && sonuc>=0) {
                  kontrol++;
                }
                sonuc= kenar[y][2]-kenar[x][2];
                if (sonuc<=hassasiyet && sonuc>=0) {
                  kontrol++;
                }

                if (kontrol==2) {
                    boy=kenar[y][0]-kenar[x][0];
                    en=kenar[x][2]-kenar[x][1];
                    oran=boy/en;
                    if(boy>en )  //&& boy<150 && en<50 && boy>110 )
                    {
if(oran>=4 && oran<=5 && boy>=120 &&boy<=300 && en>=40)
{
    qDebug()<<oran<<boy<<en;
                    kare[karesayisi][0]=kenar[x][0];
                    kare[karesayisi][1]=kenar[x][1];
                    kare[karesayisi][2]=kenar[x][2];
                    kare[karesayisi][3]=kenar[y][0];
                    kare[karesayisi][4]=kenar[y][1];
                    kare[karesayisi][5]=kenar[y][2];
                 karesayisi++;
}
}
                }

                kontrol=0;
            }


        }
    }

    for (int var = 0; var < karesayisi; ++var) {
      cv::rectangle(kaynakresim,cv::Point(kare[var][0],kare[var][1]-5),cv::Point(kare[var][3],kare[var][5]+5),cv::Scalar(100),1,cv::LINE_AA,0);
       resimdenkesital(anaresim,kare[var][0],kare[var][1],kare[var][3],kare[var][5]);

        int intchar=cv::waitKey(0);
   }
//resimdenkesital(kaynakresim,10,100,300,200);

int intchar=cv::waitKey(0);

//qDebug()<<karesayisi;
 cv::imshow("Gösterilecek resim",kaynakresim);

}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    cv::Mat kaynakresim;         // İÇİNDE KAYNAK RESMi TUTACAK. RESİM YÜKLEME KOMUTU:

                                       //cv::imread konutu girilen dosya yolundaki resmi kaynakresim degiskenine gönderir

          cv::Mat Kaynak_Gri;          // İÇİNDE KAYNAK RESMİN SİYAH BEYAZ KOPYASINI TUTACAK. KULLANIM ORNEĞİ:
                                       //cv::cvtColor(kaynakresim, yeniresim, CV_BGR2GRAY)
                                       //cv::cvtColor komutu kaynak resmi girilen renk uzayına göre convert ederek yeni resme atar

          cv::Mat Kaynak_Thresh;      //Kaynak_Gri resmini
          kaynakresim = cv::imread("/home/cihan/Masaüstü/denemeler/PlakaYeriBelirleme/araclar/8.jpg");
          cv::cvtColor(kaynakresim, Kaynak_Gri, CV_BGR2GRAY);//KAYNAK RESMİ SİYAH BEYAZ YAPIP
          cv::adaptiveThreshold(Kaynak_Gri,           // input image
              Kaynak_Thresh,                              // output image
              255,                                    // make pixels that pass the threshold full white
              cv::ADAPTIVE_THRESH_GAUSSIAN_C,         // use gaussian rather than mean, seems to give better results
              cv::ADAPTIVE_THRESH_MEAN_C,                  // invert so foreground will be white, background will be black
              11,                                     // size of a pixel neighborhood used to calculate threshold value
              2);

       //   cv::threshold(Kaynak_Gri,Kaynak_Thresh,30,255,0);
//cv::imshow("Gösterilecek resim",Kaynak_Thresh);
//resmitara(Kaynak_Thresh);
//resimdenkesital(kaynakresim,424,225,578,301);
//////////////////////////////////////////////////////////////////////////////////////////////////

//karebul(Kaynak_Thresh);
//kosegen(Kaynak_Thresh,kaynakresim);
//qDebug()<<"bitti";
//gendata(kaynakresim);
    return a.exec();
}
