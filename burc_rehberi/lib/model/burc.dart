class Burc{                          // strings de cok bilgi oldugu ıcın olnarı tek bır yapıda tutmak ıcın sınıf olustudrdu.              
  final String _burcAdi;
  final String _burcTarihi;
  final String _burcDetayi;
  final String _burcKucukResim;
  final String _burcBuyukResim;
  
  get burcAdi => _burcAdi;          // yukarıda alanları prıvate tanımladıgım ıcın ve burc ıtemda alanlara erısmem gerektıgı ıcın olnarı get ıle okuyorum.
  get burcTarihi => _burcTarihi;    // yukarıda alanları fınal ıle tanımladıgım ıcın set yapamıyorum.
  get burcDetayi => _burcDetayi;
  get burcKucukResim => _burcKucukResim;
  get burcBuyukResim => _burcBuyukResim;

  Burc(this._burcAdi, this._burcTarihi, this._burcDetayi, this._burcKucukResim, this._burcBuyukResim);
  
  @override
  String toString() {
    return "$_burcAdi ,$_burcBuyukResim";
  }
}