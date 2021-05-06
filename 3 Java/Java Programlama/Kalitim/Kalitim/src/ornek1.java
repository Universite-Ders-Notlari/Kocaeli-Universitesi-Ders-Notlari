import java.util.Scanner;

class Personel {

		String ad,soyad,kimlikNo;
		int maas;
		
		Personel(){
			this.ad="Rastgele";
			this.soyad="Atandý";
			this.kimlikNo="12345678901";
			this.maas=1250;
		}
		
		Personel(String adi, String soyadi, String kimlikNosu, int maasi){
			setAd(adi);
			setSoyad(soyadi);
			setkimlikNo(kimlikNosu);
			setMaas(maasi);
		}
		
		public void setAd(String adi){
			if(adi==""){
				Scanner oku = new Scanner(System.in);
				System.out.print("Ad giriniz = ");
				adi=oku.nextLine();
				this.ad=adi;
			}else {
			this.ad=adi;
			}
		}
		
		public void setSoyad(String soyadi){
			if(soyadi==""){
				Scanner oku = new Scanner(System.in);
				System.out.print("Soyad giriniz = ");
				soyadi=oku.nextLine();
				this.soyad=soyadi;
			}else {
			this.soyad=soyadi;
			}
		}
		
		public void setkimlikNo(String kimlik){
			int hata=0;
				if(kimlik.length()!=11){
					hata=1;
					while(hata==1){
					Scanner oku = new Scanner(System.in);
					System.out.print("TC Kimlik No 11 haneli olmalýdýr.\nTC Kimlik No Girin=");
					kimlik=oku.nextLine();
					if(kimlik.length()==11)
						hata=0;
					}
				}
				if(hata==0) this.kimlikNo=kimlik;
		}
		
		public void setMaas(int maasi){
			int hata=0;
			if(maasi<1000 || maasi>1500){
			hata=1;
			while(hata==1){
			Scanner oku = new Scanner(System.in);
			System.out.print("Maaþ 1000-1500 arasý olmalýdýr.\nMaaþ Girin=");
			maasi=oku.nextInt();
			if(maasi>=1000 && maasi<=1500)
				hata=0;
			}
		}
			if(hata==0) this.maas=maasi;
		}
		
		public String getAd(){
			return this.ad;
		}
		
		public String getSoyad(){
			return this.soyad;
		}
		
		public String getkimlikNo(){
			return this.kimlikNo;
		}
		
		public int getMaas(){
			return this.maas;
		}
			
	}
		
class satisPersonel extends Personel {
			
			int bonus;
			
			public int aylikSatis(int satisMiktari,int birim){
				bonus=satisMiktari * birim;
				this.maas=this.maas + bonus;
				return this.maas;
			}

		}
		
class BilgiIslemPersonel extends Personel {
			
			int bonus;
			String gorevTanimi;
			
			BilgiIslemPersonel(String ad, String soyad, String kimlikNo, String gorevTanimi){
				this.ad=ad;
				this.soyad=soyad;
				this.kimlikNo=kimlikNo;
				this.gorevTanimi=gorevTanimi;
			}
			
			public void setMaas(int maasi){
				if(gorevTanimi=="DBA")
					this.maas=3000;
				else if(gorevTanimi=="Network")
					this.maas=2750;
				else if(gorevTanimi=="Software")
					this.maas=2500;
				else
					this.maas=maasi;
			}

		}

class Stajyer extends Personel {
	
	Stajyer(String ad,String soyad, String kimlikNo, int maas){
		super(ad,soyad,kimlikNo,maas);
	}

	public void setMaas(int maasi){
		if(maasi==300)
			this.maas=maasi;
	}
	
}
public class ornek1 {
		public static void main(String[] args) {
			
			Personel person1 = new Personel("Adem","Yýlmaz","11223344556",1400);
			Personel person2 = new Personel();
			Personel person3 = new Personel("","","11223344556",1450);
			Personel person4 = new Personel("","Asker","11223344556",1451);
			Personel person5 = new Personel("Aslan","","11223344556",1452);
			Personel person6 = new Personel("Aslan","Kaplan","112233",1453);
			Personel person7 = new Personel("Kadir","Kýymet","11223344551",998);
			
			Stajyer st1 = new Stajyer("Stajyer","Personel","00000000000",300);
			
			
			System.out.println("Personel 1 Bilgileri : \nAd Soyad="+person1.ad + " " + person1.soyad+"\nKimlik="+person1.kimlikNo+"\nMaas="+person1.maas+"\n");
			System.out.println("Personel 2 Bilgileri : \nAd Soyad="+person2.ad + " " + person2.soyad+"\nKimlik="+person2.kimlikNo+"\nMaas="+person2.maas+"\n");
			System.out.println("Personel 3 Bilgileri : \nAd Soyad="+person3.ad + " " + person3.soyad+"\nKimlik="+person3.kimlikNo+"\nMaas="+person3.maas+"\n");
			System.out.println("Personel 4 Bilgileri : \nAd Soyad="+person4.ad + " " + person4.soyad+"\nKimlik="+person4.kimlikNo+"\nMaas="+person4.maas+"\n");
			System.out.println("Personel 5 Bilgileri : \nAd Soyad="+person5.ad + " " + person5.soyad+"\nKimlik="+person5.kimlikNo+"\nMaas="+person5.maas+"\n");
			System.out.println("Personel 6 Bilgileri : \nAd Soyad="+person6.ad + " " + person6.soyad+"\nKimlik="+person6.kimlikNo+"\nMaas="+person6.maas+"\n");
			System.out.println("Personel 7 Bilgileri : \nAd Soyad="+person7.ad + " " + person7.soyad+"\nKimlik="+person7.kimlikNo+"\nMaas="+person7.maas+"\n");
			
			System.out.println("Stajyer 1 Bilgileri : \nAd Soyad="+st1.ad + " " + st1.soyad+"\nKimlik="+st1.kimlikNo+"\nMaas="+st1.maas+"\n");
		}

}
