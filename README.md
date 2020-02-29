# SoalShiftSISOP20_modul1_T06
Penyelesain Soal Shift Modul 1 Sistem Operasi 2020\
Kelompok T06
  * Donny Kurnia Ramadhani (05311840000004)
  * Made Krisnanda Utama (05311840000033)
  
---
## Daftar Isi
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

**Deskripsi**
Whits adalah seorang mahasiswa informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”. Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

### Soal 1.a.
**Pertanyaan**
Tentukan wilayah ***region*** mana yang memiliki keuntungan ***profit*** paling sedikit!
### Soal 1.b.
**Pertanyaan**
Tampilkan 2 negara bagian ***state*** yang memiliki keuntungan ***profit*** paling sedikit berdasarkan hasil poin a!
### Soal 1.c.
**Pertanyaan**
Tampilkan 10 produk ***product name*** yang memiliki keuntungan ***profit*** paling sedikit berdasarkan 2 negara bagian ***state***      hasil poin b!

**Penyelesaian**\
**1.a. Region dengan Keuntungan Paling Sedikit**
```bash 
#A
echo "Region dengan profit paling sedikit adalah: "
region=`awk -F "\t" 'NR>1{a[$13]+=$21}END{for (i in a)printf "%s\t%d\n", i, a[i] | "sort -nk2";}' Sample-Superstore.tsv`
regional=`echo "$region" | awk '{NR==1}{print $1;exit}'` 
echo -e "$regional\n"
```
`awk -F "\t"` dengan \t sebagai separator daripada column yang ada pada file berekstensi .tsv yang merupakan tab/spasi.
`NR > 1 ` yang berartikan mulai dari row ke 2, dikarenakan row 1 merupakan judul seperti Row Id, Product name, dll.
`a[$13]+=$NF` yang berartikan bahwa seluruh isi unique dari column ke 13 akan dimasukkan pada array a (West, East, South, dan Central) dan +=NF yang digunakan untuk menjumlahkan semua profit yang berada pada column terakhir.
`END{for (i in a)printf "%s\t%d\n", i, a[i]` Setelah proses awk selesai (END) maka akan dijalankan perintah untuk melakukan perintah print i  yaitu nama dari Region, beserta profit tiap tiap Region.
`Sample-Superstore.tsv` Nama File.
`sort -nk2` Sort secara numerikal dari kecil ke besar, pada kolom ke 2, yaitu kolom proft.
`awk '{NR==1}{print $1;exit}'` Melakukan proses print nama Region yang berada di posisi teratas pada kolom pertama (Profit Terkecil).

**1.b. 2 State dengan Keuntungan Paling Sedikit**

```bash
#B
echo "State dari Region Central dengan profit paling sedikit adalah: "
state=`awk -F "\t" -v a="$regional" 'NR>1 {if(match($13, a))arr[$11]+=$NF}END{for (i in arr) printf "%s\t%d\n", i, arr[i]}' Sample-Superstore.tsv  | sort -nk2 | awk -F "," 'FNR <3 {printf "%s\n",$1}'` 
stational=`echo "$state" | awk '{NR==1}{print $1}'`
stationbalapan=`echo $stational | awk '{NR==1}{print $1}'`
echo $stationbalapan
stationpurabaya=`echo $stational | awk '{NR==1}{print $2}'`
echo -e "$stationpurabaya\n"
```
`awk -F "\t" -v a="$regional"` dengan \t sebagai separator daripada column yang ada pada file berekstensi .tsv yang merupakan tab/spasi. Serta option -v yang berarti memberikan value a sebagai `$regional` yang berarti nama Region (Central).
`NR > 1 ` yang berartikan mulai dari row ke 2, dikarenakan row 1 merupakan judul seperti Row Id, Product name, dll.
`if(match($13, a)arr[$11]+=NF)END` --> Jika column ke-13 (Region), match dengan variable a maka buat array dengan index state, dan tambahkan profit dari tiap state.
`END{for (i in a)printf "%s\t%d\n", i, a[i]` Setelah proses awk selesai (END) maka akan dijalankan perintah untuk melakukan perintah print i  yaitu nama dari Region, beserta profit tiap-tiap State.
`Sample-Superstore.tsv` Nama File.
`sort -nk2` Sort secara numerikal dari kecil ke besar, pada kolom ke 2, yaitu kolom profit.
`awk '{NR==1}{print $1}'` Melakukan proses print nama State pertama yang berada di posisi teratas pada kolom pertama (Profit Terkecil).
`awk '{NR==1}{print $2}'` Melakukan proses print nama State pertama yang berada di posisi teratas pada kolom kedua (Profit Terkecil Kedua).

**1.c. 10 Produk dari 2 State dengan Keuntungan Paling Sedikit**

```bash
#C
productkawe=`awk -F "\t" -v b="$stationbalapan" 'NR>1 {if(match($11, b))arr[$17]+=$21}END{for (i in arr) printf "%f\t%s\n", arr[i], i}' Sample-Superstore.tsv # | sort -n | awk -F, 'FNR <11 {printf "%s\n", $1}' | cut -f2-  `
productgagal=`awk -F "\t" -v c="$stationpurabaya" 'NR>1 {if(match($11, c))arr[$17]+=$21}END{for (i in arr) printf "%f\t%s\n", arr[i], i}' Sample-Superstore.tsv # | sort -n | awk -F, 'FNR <11 {printf "%s\n", $1}' | cut -f2- ` 
echo "Produk dari State Texas dan Illinois dengan profit paling sedikit adalah: "
echo -e "$productkawe$productgagal" | sort -n | awk -F, 'FNR <11 {printf "%s\n", $1}' | cut -f2-
```
`awk -F "\t" -v a="$regional"` dengan \t sebagai separator daripada column yang ada pada file berekstensi .tsv yang merupakan tab/spasi. Serta option -v yang berarti memberikan value a sebagai `$regional` yang berarti nama Region (Central).
`NR > 1 ` yang berartikan mulai dari row ke 2, dikarenakan row 1 merupakan judul seperti Row Id, Product name, dll.
`if(match($13, a)arr[$11]+=21)END` --> Jika column ke-11 (State), match dengan variable b yaitu Texas, maka buat array dengan index column ke-17 yaitu Product Name, dan tambahkan profit dari tiap Product Name State Texas. Kita melakukan hal yang sama untuk Illinois dibawahnya.
`END{for (i in a)printf "%s\t%d\n", i, a[i]` Setelah proses awk selesai (END) maka akan dijalankan perintah untuk melakukan perintah print i  yaitu nama dari Product Name, beserta profit tiap-tiap Product.
`Sample-Superstore.tsv` Nama File.
`sort -nk2` Sort secara numerikal dari kecil ke besar, pada kolom ke 2, yaitu kolom profit.
`| sort -n | awk -F, 'FNR <11 {printf "%s\n", $1}' | cut -f2-` Melakukan print terhadap 10 produk dengan keuntungan terkecil.

## Soal 2
Source Code : [source](https://github.com/naminai/SoalShiftSISOP20_modul1_T06/tree/master/soal2)

**Deskripsi**

Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan.

### Soal 2.a.
**Pertanyaan**
Membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil,  dan angka!

### Soal 2.b.
**Pertanyaan**\
Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan ***Hanya berupa alphabet***!
 
### Soal 2.c.
**Pertanyaan**\
Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf ***string manipulation*** yang disesuaikan dengan jam ***0-23*** dibuatnya file tersebut dengan program terpisah menggunakan caesar cipher!

### Soal 2.d.
**Pertanyaan**
Jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.

**Penyelesaian**
**2.a. Membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil,  dan angka!**

**2.b. Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan hanya berupa alphabet**

```bash
#!/bin/bash

Nama=$*
Randomizer=`pwgen -c -n 28 1`
echo $Randomizer
Kode=`printf '%s\n' "${Nama//[[:digit:]]/}"`
echo $Randomizer >> $Kode.txt 
```
`Nama=$*` Memasukkan semua argumen yang diberikan ke dalam variable nama.
`pwgen -c -n 28 1` Menggunakan pwgen untuk menghasilkan random password dengan `-c` sebagai mode huruf Kapital. `-n` sebagai mode Angka, `28` sebagai string length, dan `1` berarti hanya satu baris saja yang akan diprint.
`printf '%s\n' "${Nama//[[:digit:]]/}` Melakukan print argumen dan memisahkan karakter angka di dalamnya karena hanya boleh alphabet saja.
`echo $Randomizer >> $Kode.txt` Memasukkan random password ke dalam text file dengan nama argumen. 

**2.c. Enkripsi file menggunakan caesar cipher dengan key berdasarkan tanggal dibuatnya file**

```bash
#!/bin/bash

args=$*
arg=`basename $args .txt`  
sword=`stat $args`
ketupat=`echo -e "$sword"` 
amboi=`echo $ketupat | awk 'BEGIN{IFS=";"}{print $15}'` 
hebat=$(sudo debugfs -R 'stat <'$amboi'>' /dev/sda1 | awk '{if($1~/crtime/)print $7}')
donee=`echo $hebat | awk -F: '{print $1}'`
coba1=`echo "$arg" | caesar $donee` 
mv $args $coba1.txt
```

`args=$*` Memasukkan argument dalam bentuk filename yang diinputkan ke dalam variable args.
`basename $args .txt` Mengubah filename menjadi basename tanpa ekstensi.
`stat $args` Mencari stat dari file tersebut agar kita dapat mengetahui inode-nya.
`awk 'BEGIN{IFS=";"}{print $15}'` Menggunakan Internal Field Separator ";" untuk menemukan inode file.
`sudo debugfs -R 'stat <'$amboi'>' /dev/sda1 | awk '{if($1~/crtime/)print $7}'` Mengakses /dev/sda1 dengan debugfs -R(Request access kepada dev/sda1 melalui Interactive File System Debugger) dan menggunakan stat inode sebagai key yang kita cari. Kemudian kita melacak posisi `crtime` untuk mengetahui kapan file itu dibuat. Lalu kita melakukan print pada jam dengan date format HH:MM:SS.
`awk -F: '{print $1}'` Melakukan print pada bagian HH atau jam pembuatan.
`caesar $donee` Melakukan caesar cipher dengan command caesar berdasarkan jam pembuatan file.
`mv $args $coba1.txt` Rename filename menjadi namafile terenkripsi.

**2.d. Dekripsi file yang sudah di enkripsi**

```bash
#!/bin/bash

args=$*
arg=`basename $args .txt`  
sword=`stat $args`
ketupat=`echo -e "$sword"` 
yasudah=`echo $ketupat | awk 'BEGIN{IFS=";"}{print $15}'` 
hebat=$(sudo debugfs -R 'stat <'$yasudah'>' /dev/sda1 | awk '{if($1~/crtime/)print $7}')
donee=`echo $hebat | awk -F: '{print $1}'`
sepatu=$((10#$donee))
senapan=$((10#26-$sepatu))
#echo $senapan
coba1=`echo "$arg" | caesar $senapan`  
mv $args $coba1.txt
```

`args=$*` Memasukkan argument dalam bentuk filename yang diinputkan ke dalam variable args.
`basename $args .txt` Mengubah filename menjadi basename tanpa ekstensi.
`stat $args` Mencari stat dari file tersebut agar kita dapat mengetahui inode-nya.
`awk 'BEGIN{IFS=";"}{print $15}'` Menggunakan Internal Field Separator ";" untuk menemukan inode file.
`sudo debugfs -R 'stat <'$amboi'>' /dev/sda1 | awk '{if($1~/crtime/)print $7}'` Mengakses /dev/sda1 dengan debugfs -R(Request access kepada dev/sda1 melalui Interactive File System Debugger) dan menggunakan stat inode sebagai key yang kita cari. Kemudian kita melacak posisi `crtime` untuk mengetahui kapan file itu dibuat. Lalu kita melakukan print pada jam dengan date format HH:MM:SS.
`awk -F: '{print $1}'` Melakukan print pada bagian HH atau jam pembuatan.
`10#$donee` Menjadikan HH format menjadi base10 atau angka desimal.
`10#26-$sepatu` Melakukan pengurangan jumlah total alphabet dikurangi jam pembuatan, untuk membalikkan caesar cipher pertama.
`caesar $senapan` Melakukan caesar cipher dengan command caesar dan mendekripsi filename.
`mv $args $coba1.txt` Rename filename menjadi nama file terdekripsi.

## Soal 3
Source Code : [source](https://github.com/naminai/SoalShiftSISOP20_modul1_T06/tree/master/soal3)

**Deskripsi**\
1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing. [a] Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama “pdkt_kusuma_NO” (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file “wget.log”. Karena kalian gak suka ribet, kalian membuat penjadwalan untuk menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan[b] setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan
selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi. [c] Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename “duplicate_nomor” (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename “kenangan_nomor” (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi “.log.bak”.
Hint : Gunakan wget.log untuk membuat location.log yang isinya merupakan hasil dari grep “Location”. Gunakan Bash, Awk dan Crontab

### Soal 3.a
**Pertanyaan**
Membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command **wget** dan menyimpan file dengan nama "pdkt_kusuma_NO" serta menyimpan **log message wget** kedalam sebuah file "wget.log"

### Soal 3.b
**Pertanyaan** 
Membuat crontab download file **setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari sabtu**

### Soal 3.c
**Pertanyaan** 
Membuat script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor". Setelah itu lakukan pemindahan semua gambar yang tersisa ke dalam folder ./kenangan dengan format filename "kenangan_nomor". Setelah tidak ada gambar di *current directory*, maka lakukan backup seluruh log menjadi ekstensi ".log.bak".

**Penyelesaian**

**3.a. Membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" serta menyimpan log message wget kedalam sebuah file "wget.log" **
 
```bash
#!/bin/bash
display=`pwd`
namber=`ls $display | grep "pdkt_kusuma" | cut -d "_" -f 3 |sort -n | tail -1`
if [[ $namber =~ [0..9] ]]
then
  namber=0
fi
x=`expr $namber + 1` 
y=`expr $namber + 28`
for ((c=x; c<=y; c++ ))
do
     wget -a $display/wget.log -O "$display/pdkt_kusuma_$c" https://loremflickr.com/320/240/  
done
grep "Location" wget.log >> location.log
``` 

`display=pwd` Memasukkan hasil pwd(Full Pathname dari Direktori yang sedang kita singgahi) ke dalam variable display.
`ls $display | grep "pdkt_kusuma" | cut -d "_" -f 3 |sort -n | tail -1` Mencari seluruh file bernama pdkt_kusuma yang ada di Current Directory, lalu melakukan cut berdasarkan `_` untuk mendapatkan nomor download (1 hingga 28) dan melakukan sort secara numerik dari kecil ke besar dan mengambil tail atau urutan terakhir dengan angka terbesar. 
`if [[ $namber =~ [0..9] ]] then namber=0 fi` Melakukan pengecekan apabila file tersebut tidak ada maka namber harus menyimpan nilai 0 (agar tidak ada pdkt_kusuma_0)
`x=expr $namber + 1` `y=expr $namber + 28` Menambahkan pada variable namber 1 hingga 28 agar apabila namber=0 maka akan menjadi 1 hingga 28 dan apabila namber=28 maka akan menjadi 29 hingga 56, dan seterusnya. 
`for ((c=x; c<=y; c++ ))
do
     wget -a $display/wget.log -O "$display/pdkt_kusuma_$c" https://loremflickr.com/320/240/  
done`
Melakukan download file dari  https://loremflickr.com/320/240/ dan membuat wget.log yang berisikan log file hasil download.
`grep "Location" wget.log >> location.log` Melakukan grep semua line dengan isi Location pada `wget.log` ke `location.log`.

**3.b. Membuat crontab download file **setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari sabtu**
5 6-23/8 * * 0-5 bash home/donny/shift/soal3/soal3.sh

kolom pertama (minute): 5 -> setiap menit ke-5
kolom kedua (hour): 6-23/8 -> setiap 8 jam dari jam 6 sampai jam 23
kolom ketiga(day of month): * -> tanggal bebas
kolom keempat(month): * -> bulan bebas
kolom kelima(day of week): 0-5 -> setiap hari minggu sampai hari jumat (kecuali hari sabtu)

**3.c. Membuat script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi dan mengklasifikasikannya pada folder kenangan atau duplicate, lalu melakukan backup wget.log --> wget.log.bak**

```bash
#!/bin/bash
dirinfo=`pwd`
testering=`ls $dirinfo | grep "pdkt_kusuma" | cut -d "_" -f 3 | sort -n | tail -1`

mkdir $dirinfo/kenangan
mkdir $dirinfo/duplicate

x=0
y=0
arr=""
for ((i=1; i<=$testering; i++))
do
  lokasi="`cat $dirinfo/wget.log | grep "Location:" | head -$i | tail -1 | cut -d " " -f 2`"
  dupes=`echo -e $arr | awk -v lokasi=$lokasi 'BEGIN {dupes=0} {if (lokasi==$0) dupes=1} END {printf "%d", dupes}'`
  if [[ $dupes == 1 ]]
  then
  x=`expr $x + 1`
      mv $dirinfo/pdkt_kusuma_$i $dirinfo/duplicate/duplicate_$x
  else
  arr="$arr$lokasi\n"
  y=`expr $y + 1`
    mv $dirinfo/pdkt_kusuma_$i $dirinfo/kenangan/kenangan_$y
  fi
done

cat $dirinfo/wget.log >> $dirinfo/wget.log.bak && rm $dirinfo/wget.log 
```

`dirinfo=pwd` Memasukkan hasil pwd(Full Pathname dari Direktori yang sedang kita singgahi) ke dalam variable dirinfo.
`ls $dirinfo | grep "pdkt_kusuma" | cut -d "_" -f 3 |sort -n | tail -1` Mencari seluruh file bernama pdkt_kusuma yang ada di Current Directory, lalu melakukan cut berdasarkan `_` untuk mendapatkan nomor download (1 hingga 28) dan melakukan sort secara numerik dari kecil ke besar dan mengambil tail atau urutan terakhir dengan angka terbesar.
`mkdir $dirinfo/kenangan` `mkdir $dirinfo/duplicate` Membuat folder bernama kenangan dan duplicate.
`x=0` `y=0` Deklarasi counter x dan y.
`arr=""` Mendeklarasikan string arr.
`cat $dirinfo/wget.log | grep "Location:" | head -$i | tail -1 | cut -d " " -f 2`" Menampilkan yang memiliki kata location di wget.log dan menampilkan yangg dipilih dengan head merupakan file ke berapa (1 hingga 28) dan melakukan cut dengan pemisah spasi dan memilih field ke 2 yang merupakan unique identifier.
`awk -v lokasi=$lokasi 'BEGIN {dupes=0} {if (lokasi==$0) dupes=1} END {printf "%d", dupes}` Melakukan pencarian pola dengan menggunakan variable lokasi. Kemudian  mendeklarasikan bahwa pada awalnya dupes=0, namun apabila location file memiliki baris yang sama dengan variable lokasi, maka merupakan duplikat dan dupes=1. Kemudian kita melakukan print nilai dari dupes sehingga kita dapat melakukan cek nanti.
`if [[ $dupes == 1 ]]` Berdasarkan penjelasan diatas, nilai dupes yang semula 0 akan berubah 1 jika merupakan duplikat.
`x=expr $x + 1` `mv $dirinfo/pdkt_kusuma_$i $dirinfo/duplicate/duplicate_$x` Memasukkan file duplicate ke folder duplicate, serta menambah counter x agar nama file menjadi duplicate_1, duplicate_2, dan seterusnya.

```bash
else
  arr="$arr$lokasi\n"
  y=`expr $y + 1`
    mv $dirinfo/pdkt_kusuma_$i $dirinfo/kenangan/kenangan_$y
```

Melakukan concatenation $lokasi kepada $arr sebagai tracker untuk file berikutnya, dimana lokasi akan menjadi penentu apabila file merupakan duplikat atau tidak. Lalu memasukkan file unique ke folder kenangan, serta menambah counter y agar nama file menjadi kenangan_1, kenangan_2, dan seterusnya.
