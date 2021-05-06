#include "mainwindow.h"
#include <QApplication>
#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/imgproc/imgproc.hpp>
#include<opencv2/ml/ml.hpp>
#include<iostream>
#include<vector>
#include<QDebug>
#include<sstream>

// global variables ///////////////////////////////////////////////////////////////////////////////
const int Min_Contour_Alani = 100;
const int Max_Contour_Alani = 1000;
const int Karakter_Genisligi = 20;
const int Karakter_Yuksekligi = 30;

///////////////////////////////////////////////////////////////////////////////////////////////////

int main()
{
    //Karakterleri içeren Ana Resim Degiskenleri

    cv::Mat KarakterlerinResmi;
    cv::Mat KarakterlerinGriResmi;
    cv::Mat KarakterlerinBulanikResmi;
    cv::Mat KarakterlerinSBResmi;
    cv::Mat KarakterlerinSBResmiKopyasi;
    std::vector<std::vector<cv::Point> > ptContours;
    std::vector<cv::Vec4i> v4iHierarchy;

    //Xml Dosyasi Degiskenleri
    cv::Mat matKarakterNo;
    cv::Mat matKarakterNoKarsilik;

    //Karakterleri tanımak icin degiskenler (degerler sayisal tutuluyor)
    std::vector<int> Karakterler = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                                     'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
                                     'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
                                     'U', 'V', 'W', 'X', 'Y', 'Z' };

    //Ana Resim islemleri

    KarakterlerinResmi = cv::imread("Karakterset.png");
    if (KarakterlerinResmi.empty()) {
        std::cout << "Hata : Resim Ana Dosya Yuklenmedi\n\n";
        return(0);
    }

    cv::cvtColor(KarakterlerinResmi, KarakterlerinGriResmi, CV_BGR2GRAY); //Karakter Ana Resim Griye Cevrildi
    cv::GaussianBlur(KarakterlerinGriResmi, KarakterlerinBulanikResmi, cv::Size(5, 5), 0); //Karakter Ana Resim Blura Cevrildi
    cv::adaptiveThreshold(KarakterlerinBulanikResmi, KarakterlerinSBResmi, 255, cv::ADAPTIVE_THRESH_GAUSSIAN_C, cv::THRESH_BINARY_INV, 11, 2);                                     // constant subtracted from the mean or weighted mean
    cv::imshow("KarakterlerinSBResmi", KarakterlerinSBResmi); // SB (Tresh) resim göster
    KarakterlerinSBResmiKopyasi = KarakterlerinSBResmi.clone(); //islemler oncesi son resmin kopyasi alindi

    cv::findContours(KarakterlerinSBResmiKopyasi, ptContours, v4iHierarchy, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);

    for (unsigned int i = 0; i < ptContours.size(); i++) {
        if ((cv::contourArea(ptContours[i]) >  Min_Contour_Alani)&&(cv::contourArea(ptContours[i]) <  Max_Contour_Alani))

        {   //Bulunan Counter Minimum Alnadan Buyukse isleme aldık
            cv::Rect Countercevresi = cv::boundingRect(ptContours[i]); //Counterların Cevresini Belirledik
            cv::rectangle(KarakterlerinResmi, Countercevresi, cv::Scalar(0, 0, 255), 2); //Cerceveyi Kirmizi Cizdik
            cv::Mat matKarakter = KarakterlerinSBResmi(Countercevresi); //Cerve icini Aldik

            cv::Mat matYeniBoyKarakter;
            cv::resize(matKarakter, matYeniBoyKarakter, cv::Size(Karakter_Genisligi, Karakter_Yuksekligi)); //Yeni Karakter
            //Bulunan Karakterin Gösterilmesi
            cv::imshow("Karakter", matKarakter);
            cv::imshow("YeniBoy Karakter", matYeniBoyKarakter);
            cv::imshow("KarakterlerinResmi", KarakterlerinResmi);

            int intChar = cv::waitKey(0)&255;
            if (intChar == 27) {
                return(0);
            }
            else if (std::find(Karakterler.begin(), Karakterler.end(), intChar) != Karakterler.end()) {
                //Yeni Karakter Resminin Xml Dosya icin Hazirlanmasi
                matKarakterNo.push_back(intChar);
                cv::Mat matKarakterResimFloat;
                matYeniBoyKarakter.convertTo(matKarakterResimFloat, CV_32FC1);

                cv::Mat matKeskinKarakterResimFloat = matKarakterResimFloat.reshape(1, 1);

                matKarakterNoKarsilik.push_back(matKeskinKarakterResimFloat);

            }
        }
    }

    std::cout << "Karakter Degerleri Belirlendi\n\n";

    // Karakter Degerleri Dosya İslemleri ///////////////////////////////////////////////////////

    cv::FileStorage KarakterDegerleriDosyasi("classifications.xml", cv::FileStorage::WRITE);

    if (KarakterDegerleriDosyasi.isOpened() == false)
    {
        std::cout << "Hata, Karakter Degerleri Dosyasi Acilamadi\n\n";
        return(0);
    }

    KarakterDegerleriDosyasi << "classifications" << matKarakterNo;        // write classifications into classifications section of classifications file
    KarakterDegerleriDosyasi.release();                                            // close the classifications file

    // Karakter Resim Degerleri Dosya İslemleri ///////////////////////////////////////////////////////

    cv::FileStorage KarakterResimDegerleriDosyasi("images.xml", cv::FileStorage::WRITE);

    if (KarakterResimDegerleriDosyasi.isOpened() == false) {
        std::cout << "Hata, Karakter Degerleri Resim Dosyasi Acilamadi\n\n";
        return(0);
    }

    KarakterResimDegerleriDosyasi << "images" << matKarakterNoKarsilik;
    KarakterResimDegerleriDosyasi.release();

    return(0);
}
