CREATE TABLE  uyeler
 ( uye_id   SERIAL PRIMARY KEY, 
   kullanici_adi VARCHAR (50) UNIQUE NOT NULL,
   eposta   VARCHAR (255) UNIQUE NOT NULL,  
   sifre   VARCHAR (255) NOT NULL, 
   kayıt_tarihi   TIMESTAMP  NOT NULL,
   ad   varchar(50) NOT NULL, 
   soyad   varchar(50) NOT NULL
   );
   
   CREATE  TABLE   kategoriler  
( kategori_id INTEGER  PRIMARY KEY,
        kategori_adi  VARCHAR(100)  UNIQUE NOT NULL
		);

CREATE  TABLE   egitimler  
( egitim_id  INTEGER  PRIMARY KEY,
 adi  VARCHAR(200)  NOT NULL, 
 aciklamasi TEXT NOT NULL, 
 baslangic_tarihi DATE,
 bitis_tarihi  DATE,
 egitmen_bilgisi   VARCHAR(100), 
 fkkategori_id   INTEGER,
 FOREIGN KEY   (fkkategori_id) REFERENCES  kategoriler (kategori_id)
 );


CREATE TABLE  katilimlar (
    katilim_id  SERIAL  PRIMARY KEY,
    fkuye_id    INTEGER  NOT NULL,
    fkegitim_id  INTEGER  NOT NULL,
    katilim_tarihi TIMESTAMP DEFAULT CURRENT_DATE,
    FOREIGN KEY (fkuye_id) REFERENCES   uyeler (uye_id),
    FOREIGN KEY (fkegitim_id) REFERENCES  egitimler( egitim_id  )
);

CREATE TABLE   sertifikalar (
     sertifika_id  SERIAL  PRIMARY KEY,
     sertifika_kodu  VARCHAR(100)  UNIQUE NOT NULL,  
     verilis_tarihi  DATE  NOT NULL
);
CREATE TABLE   sertifika_atamalari (
      atama_id  SERIAL  PRIMARY KEY,
      fksertifika_id  INTEGER  NOT NULL,
      fkuye_id    INTEGER  NOT NULL,
      alim_tarihi  DATE  NOT NULL,
      FOREIGN KEY (fkuye_id) REFERENCES   uyeler(uye_id),
      FOREIGN KEY (fksertifika_id  ) REFERENCES  sertifikalar (sertifika_id )
);
CREATE TABLE   blog_gonderileri (
    blog_id  INTEGER PRIMARY KEY,
    baslik   VARCHAR(255) NOT NULL, 
    icerik   TEXT,
    yayin_tarihi TIMESTAMP DEFAULT CURRENT_DATE,
    fkyazar_bilgisi  INTEGER  NOT NULL,
    FOREIGN KEY (fkyazar_bilgisi ) REFERENCES   uyeler(uye_id)
);
INSERT INTO kategoriler 
VALUES  (100, 'Yapay Zeka'),
        (200,  'Siber Güvenlik'),
		(300,  'Blok Zincir'),
		(400, 'Mobil Uygulama Yazılım') ;
		
SELECT * FROM kategoriler;

INSERT INTO    egitimler  
VALUES (101, 'Pyhton', 'Pyhton  yazılım dili uygulamaları', '2025-04-25',  '2025-05-25', 'Ufuk ACAR', 100);
SELECT * FROM egitimler;
