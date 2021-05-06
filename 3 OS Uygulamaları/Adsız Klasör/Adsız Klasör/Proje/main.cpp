#include "mainwindow.h"
#include<QApplication>
#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/imgproc/imgproc.hpp>
#include<opencv2/ml/ml.hpp>
#include<iostream>
#include<vector>
#include<QDebug>
#include<sstream>
#include<opencv2/imgproc/imgproc.hpp>


// Global Degiskenler  ///////////////////////////////////////////////////////////////////////////////
const int Min_Contour_Alani = 100;
const int Max_Contour_Alani = 600;
const int Karakter_Genisligi = 20;
const int Karakter_Yuksekligi = 30;

void resimdenkesital(cv::Mat kaynakresim, int x1, int y1, int x2, int y2 )
{
    cv::Mat yeni;
    cv::Rect kare(cv::Point(x1,y1),cv::Point(x2,y2));
    yeni=kaynakresim(kare);
    //cv::imshow("Gösterilecek resim",yeni);
    cv::imwrite("Plaka.png",yeni);

}

// Class Tanimlama ///////////////////////////////////////////////////////////////////////////////////
class Counterislemleri {
public:

    std::vector<cv::Point> ptContour;
    cv::Rect Countercevresi;
    float Counteralani;

    bool CounterAlaniKontrol()
    {
        if ((Counteralani <  Min_Contour_Alani)||(Counteralani >  Max_Contour_Alani)) return false;
        return true;
    }

    static bool CounterSiralama(const Counterislemleri& cwdLeft, const Counterislemleri& cwdRight)
    {
        return(cwdLeft.Countercevresi.x < cwdRight.Countercevresi.x);
    }

};

void kosegen(cv::Mat kaynakresim,cv::Mat anaresim)
{
    int pixelrengi;
    int kenar[kaynakresim.cols][3],kare[kaynakresim.cols][6],kenarsayisi=0;
    int x,y,siyah_say=0;

    for(x=0;x<kaynakresim.cols;x++)
    {
        for(y=0;y<kaynakresim.rows;y++)
        {
            pixelrengi=kaynakresim.at<unsigned char>(y,x);
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
                     //qDebug()<<x<<y-siyah_say<<siyah_say;
                     siyah_say=0;
                 }
                 siyah_say=0;
             }

        }
    }
    //qDebug()<<kenarsayisi;
    //AŞAĞIDAKİ DÖNGÜ DİK KENARLARI GÖSTERİYOR

    for (int var = 0; var < kenarsayisi; ++var)
    {
      cv::rectangle(kaynakresim,cv::Point(kenar[var][0]-20,kenar[var][1]),cv::Point(kenar[var][0]+20,kenar[var][2]),cv::Scalar(100,100,50),1,cv::LINE_4,0);
    }
    int sonuc,en,oran,boy,kontrol=0,karesayisi=0,hassasiyet;
    hassasiyet=5;
    for (int x = 0; x < kenarsayisi; x++)
    {
        for (int y = 0; y < kenarsayisi; y++)
        {
            if (x!=y)
            {
                sonuc= kenar[y][1]-kenar[x][1];
                if (sonuc<=hassasiyet && sonuc>=0)
                {
                    kontrol++;
                }
                sonuc= kenar[y][2]-kenar[x][2];
                if (sonuc<=hassasiyet && sonuc>=0)
                {
                    kontrol++;
                }
                if (kontrol==2)
                {
                    boy=kenar[y][0]-kenar[x][0];
                    en=kenar[x][2]-kenar[x][1];
                    oran=boy/en;
                    if(boy>en )
                    {
                        if(oran>=4 && oran<=5 && boy>=120 &&boy<=300 && en>=40)
                        {
                            //qDebug()<<oran<<boy<<en;
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
    /*
    for (int var = 0; var < karesayisi; ++var)
    {
        cv::rectangle(kaynakresim,cv::Point(kare[var][0],kare[var][1]-5),cv::Point(kare[var][3],kare[var][5]+5),cv::Scalar(100),1,cv::LINE_AA,0);
        resimdenkesital(anaresim,kare[var][0],kare[var][1],kare[var][3],kare[var][5]);
        int intchar=cv::waitKey(0);
    }
*/
    //resimdenkesital(kaynakresim,10,100,300,200);
    resimdenkesital(anaresim,kare[0][0],kare[0][1],kare[0][3],kare[0][5]);

    //int intchar=cv::waitKey(0);
    cv::rectangle(anaresim,cv::Point(kare[0][0],kare[0][1]-5),cv::Point(kare[0][3],kare[0][5]+5),cv::Scalar(0,0,255),1,cv::LINE_AA,0);
    //qDebug()<<karesayisi;
    cv::imshow("Ana Resim",anaresim);
}

int karakteribul()
{
    //Vector Tanimlamalari
    std::vector<Counterislemleri> ResimdekiTumCounter;
    std::vector<Counterislemleri> ResimdekiGecerliCounter;

    //Karakter No Degerleri Dosya İslemi
    cv::Mat matKarakterNoDegerleri;
    cv::FileStorage KarakterDegerleriDosyasi("classifications.xml", cv::FileStorage::READ);
    if (KarakterDegerleriDosyasi.isOpened() == false)
    {
        std::cout << "Hata, Karakter Deger Dosyasi Acilamadi\n\n";
        return(0);
    }
    KarakterDegerleriDosyasi["classifications"] >> matKarakterNoDegerleri;
    KarakterDegerleriDosyasi.release();

    //Karakter Resim Degerleri Dosya islemleri

    cv::Mat matKarakterResimDegerleri;
    cv::FileStorage KarakterResimDegerleriDosyasi("images.xml", cv::FileStorage::READ);
    if (KarakterResimDegerleriDosyasi.isOpened() == false) {
        std::cout << "Hata, Karakter Resim Dosyasi Acilmadi\n\n";
        return(0);
    }
    KarakterResimDegerleriDosyasi["images"] >> matKarakterResimDegerleri;
    KarakterResimDegerleriDosyasi.release();

    // KNeasrest islemleri  //////////////////////////////////////////////////////////////////////////////

    cv::Ptr<cv::ml::KNearest>  kNearest(cv::ml::KNearest::create());
    kNearest->train(matKarakterResimDegerleri, cv::ml::ROW_SAMPLE, matKarakterNoDegerleri);


    cv::Mat matTestPlakaResim = cv::imread("Plaka.png");
    if (matTestPlakaResim.empty())
    {
        std::cout << "Hata: Test Plaka Resim Dosyasi Acilmadi\n\n";
        return(0);
    }

    // Test Plaka Resminin islemleri

    cv::Mat matTestPlakaGriResim;
    cv::Mat matTestPlakaBlurResim;
    cv::Mat matTestPlakaSBResim;
    cv::Mat matTestPlakaSBResimKopya;

    cv::cvtColor(matTestPlakaResim, matTestPlakaGriResim, CV_BGR2GRAY);
    cv::imshow("Gri Plaka",matTestPlakaGriResim);
    cv::waitKey(0);
    cv::GaussianBlur(matTestPlakaGriResim, matTestPlakaBlurResim, cv::Size(5, 5),0);
    cv::imshow("Blur Plaka",matTestPlakaBlurResim);
    cv::waitKey(0);
    cv::adaptiveThreshold(matTestPlakaBlurResim, matTestPlakaSBResim, 255, cv::ADAPTIVE_THRESH_GAUSSIAN_C, cv::THRESH_BINARY_INV, 11, 2);
    cv::imshow("Treshold Plaka",matTestPlakaSBResim);
    cv::waitKey(0);
    matTestPlakaSBResimKopya = matTestPlakaSBResim.clone();

    std::vector<std::vector<cv::Point> > ptContours;
    std::vector<cv::Vec4i> v4iHierarchy;

    cv::findContours(matTestPlakaSBResimKopya, ptContours, v4iHierarchy, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);

    // Countor Tümünün Bulunmasi

    for (unsigned int i = 0; i < ptContours.size(); i++)
    {
        Counterislemleri Counterislemleri1;
        Counterislemleri1.ptContour = ptContours[i];
        Counterislemleri1.Countercevresi = cv::boundingRect(Counterislemleri1.ptContour);
        Counterislemleri1.Counteralani = cv::contourArea(Counterislemleri1.ptContour);
        ResimdekiTumCounter.push_back(Counterislemleri1);
    }

    // Gecerli Counterlarin Ayrilmasi

    for (unsigned int i = 0; i < ResimdekiTumCounter.size(); i++)
    {
        if (ResimdekiTumCounter[i].CounterAlaniKontrol())
        {
            ResimdekiGecerliCounter.push_back(ResimdekiTumCounter[i]);
        }
    }

    std::sort(ResimdekiGecerliCounter.begin(), ResimdekiGecerliCounter.end(), Counterislemleri::CounterSiralama);

    std::string strBulunanPlaka;

    for (unsigned int i = 0; i < ResimdekiGecerliCounter.size(); i++)
    {

        cv::rectangle(matTestPlakaResim, ResimdekiGecerliCounter[i].Countercevresi, cv::Scalar(0, 255, 0), 2); //Counter Cerceve Belirle
        cv::Mat matKarakter = matTestPlakaSBResim(ResimdekiGecerliCounter[i].Countercevresi);  //Matrise Ata
        cv::Mat matYeniBoyKarakter;
        cv::resize(matKarakter, matYeniBoyKarakter, cv::Size(Karakter_Genisligi, Karakter_Yuksekligi)); //Boyutunu Ayarla

        //Gerekli Donusumleri Yap
        cv::Mat matYeniBoyKarakterFloat;
        matYeniBoyKarakter.convertTo(matYeniBoyKarakterFloat, CV_32FC1);
        cv::Mat matYeniBoyKeskinKarakterFloat = matYeniBoyKarakterFloat.reshape(1, 1);
        cv::Mat matBulunanKarakter(0, 0, CV_32F);

        //Resimdeki karakteri KNearest ile bul

        kNearest->findNearest(matYeniBoyKeskinKarakterFloat, 1, matBulunanKarakter);

        //Bulunan Degeri Stringe Cevir
        float FloatBulunanKarakter = (float)matBulunanKarakter.at<float>(0, 0);
        strBulunanPlaka = strBulunanPlaka + char(int(FloatBulunanKarakter));
    }
    std::cout << "\n\n" << "Bulunan Plaka Degeri = " << strBulunanPlaka << "\n\n";
    cv::imshow("Bulunan Plaka Resim", matTestPlakaResim);
    cv::waitKey(0);
    return(0);
}

int main()
{
    cv::Mat kaynakresim;
    cv::Mat Kaynak_Gri;
    cv::Mat Kaynak_Thresh;

    kaynakresim = cv::imread("araclar/2.jpg");
    cv::cvtColor(kaynakresim, Kaynak_Gri, CV_BGR2GRAY);
    cv::adaptiveThreshold(Kaynak_Gri,Kaynak_Thresh,255, cv::ADAPTIVE_THRESH_GAUSSIAN_C, cv::ADAPTIVE_THRESH_MEAN_C, 11, 2);
    kosegen(Kaynak_Thresh,kaynakresim);
    cv::waitKey(0);
    karakteribul();
    return (0);
}
