# SoalShiftSISOP20_modul1_T06
Penyelesain Soal Shift Modul 1 Sistem Operasi 2020\
Kelompok T06
  * Donny Kurnia Ramadhani (05311840000004)
  * Made Krisnanda Utama (05311840000033)
  
---
## 
* [Soal 1](#soal-1)
  * [Soal 1.a.](#soal-1a)
  * [Soal 1.b.](#soal-1b)
  * [Soal 1.c.](#soal-1c)
* [Soal 2](#soal-2)
  * [Soal 2.a.](#soal-2a)
  * [Soal 2.b.](#soal-2b)
  * [Soal 2.c.](#soal-2c)
  * [Soal 2.d.](#soal-2d)
* [Soal 3](#soal-3)
  * [Soal 3.a.](#soal-3a)
  * [Soal 3.b.](#soal-3b)
  * [Soal 3.c.](#soal-3c)
---

## Soal 1
Source Code : [source](https://github.com/naminai/SoalShiftSISOP20_modul1_T06/tree/master/soal1)

**Deskripsi**\
Whits adalah seorang mahasiswa informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”. Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

### Soal 1.a.
**"Pertanyaan"**\
Tentukan wilayah ***region*** mana yang memiliki keuntungan ***profit*** paling sedikit!

**"Pembahasan"**\
Menentukan keuntungan paling sedikit, ialah menggunakan command `awk`.

```bash
region=`awk -F "\t" 'NR>1{a[$13]+=$21}END{for (i in a)printf "%s\t%d\n", i, a[i] | "sort -nk2";}' Sample-Superstore.tsv`
regional=`echo "$region" | awk '{NR==1}{print $1;exit}'` 
echo -e "$regional\n"
```

* Pada bagian `awk -F "\t" 'NR>1{a[$13]+=$21}END{for (i in a)printf "%s\t%d\n", i, a[i] | "sort -nk2";}' Sample-Superstore.tsv`
ialah menjalankan perintah awk dengan

### Soal 1.b.
**"Pertanyaan"**\
Tampilkan 2 negara bagian ***state*** yang memiliki keuntungan ***profit*** paling sedikit berdasarkan hasil poin a!

### Soal 1.c.
**"Pertanyaan"**\
Tampilkan 10 produk ***product name*** yang memiliki keuntungan ***profit*** paling sedikit berdasarkan 2 negara bagian ***state***      hasil poin b!

## Soal 2
Source Code : [source](https://github.com/naminai/SoalShiftSISOP20_modul1_T06/tree/master/soal2)

**Deskripsi**\
Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan.

### Soal 2.a.
**"Pertanyaan"**\
Membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil,  dan angka!
 
### Soal 2.b.
**"Pertanyaan"**\
Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan ***Hanya berupa alphabet***!
 
### Soal 2.c.
**"Pertanyaan"**\
Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf ***string manipulation*** yang disesuaikan dengan jam ***0-23*** dibuatnya file tersebut dengan program terpisah menggunakan caesar cipher!

### Soal 2.d.
**"Pertanyaan"**\
jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.
 
## Soal 3
Source Code : [source](https://github.com/naminai/SoalShiftSISOP20_modul1_T06/tree/master/soal3)

**Deskripsi**\
1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing. [a] Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama “pdkt_kusuma_NO” (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file “wget.log”. Karena kalian gak suka ribet, kalian membuat penjadwalan untuk menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan[b] setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan
selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi. [c] Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename “duplicate_nomor” (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename “kenangan_nomor” (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi “.log.bak”.
Hint : Gunakan wget.log untuk membuat location.log yang isinya merupakan hasil dari grep “Location”. Gunakan Bash, Awk dan Crontab

### Soal 3.a
**"Pertanyaan"**\
Membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command **wget** dan menyimpan file dengan nama "pdkt_kusuma_NO" serta menyimpan **log message wget** kedalam sebuah file "wget.log"

### Soal 3.b
**"Pertanyaan"**\ 
Membuat crontab download file **setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari sabtu**

### Soal 3.c
**"Pertanyaan"**\ 
Membuat script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor". Setelah itu lakukan pemindahan semua gambar yang tersisa ke dalam folder ./kenangan dengan format filename "kenangan_nomor". Setelah tidak ada gambar di *current directory*, maka lakukan backup seluruh log menjadi ekstensi ".log.bak".

 
 
 



