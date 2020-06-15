# association-mapping

### Data
Dataset terdiri dari data genotipe sebanyak 600 sampel dengan 1 variable nomer dan 10000 SNP, data fenotipe sebanyak 600 sampel dengan 2 variable yaitu nomer dan fenotipe.
### Metode
Metode yang digunakan adalah Multivariate adaptive regression splines (MARS)
### *Modeling*
MARS merupakan gabungan *forward stepwise* dan *backward stepwise* yang digunakan untuk memilih model terbaik dengan nilai minimum kesalahan Generalized Cross Validation (GCV).
Kriteria GCV telah mempertimbangkan kesalahan residual dan kompleksitas model dan mengukur goodness of fit dari model (Lin et.al 2012).
Pada analisis ini digunakan library earth() dari R dengan variable default yaitu: 
1. Degree atau Maximum degree of interaction adalah 1. 
2. Penalty atau minimal jumlah pengamatan setiap knot. Jika (degree>1) 3 selainnya 2 
3. Threshold sebesar 0.001

*Forward Stepwise* : membuat model dengan kombinasi SNP hingga nilai average sum of square residual (ASR) nya minimum.
*Backward Stepwise*: membuat model dengan menghilangkan fitur atau SNP yang tidak berpengaruh pada model dengan melihat nilai GCV. Semakin kecil nilai GCV dari suatu SNP maka semakin penting SNP tersebut.
### Hasil
![Alt Text](https://user-images.githubusercontent.com/46989222/84624576-da49eb80-af0b-11ea-97f5-9f39fca1799a.PNG)

Hasil dari model didapatkan 10 SNP yang paling berpengaruh yaitu SNP3, SNP4, SNP9, SNP5, SNP5937, SNP2590, SNP1906, SNP4042, SNP696, SNP3538.
Contoh interpretasi hasil Gambar 2 yaitu pada h(2-SNP3) dengan koefisien 78.067 artinya adalah jika nilai SNP3 kurang dari 2 cenderung termasuk sebagai SNP yang berpengaruh terhadap fenotipe sehingga koefesiennya bermakna, yaitu setiap kenaikan satu satuan akan
mengurangi besarnya pengaruh terhadap fenotipe sebesar 78.067, sedangkan jika nilai SNP3 lebih dari atau sama dengan 2 artinya koefesien tidak bermakna sehingga nilainya adalah 0.
### SNP-SNP yang berpangaruh terhadap fenotipe
![Alt Text](https://user-images.githubusercontent.com/46989222/84624572-d918be80-af0b-11ea-919d-bcf52770bfd8.PNG)

SNP-SNP tersebut jika dikombinasikan akan menghasilkan interaksi yang tinggi terhadap fenotipe.
Evaluasi model dilihat dari nilai R-square.
Pada model ini dihasilkan 0.74 yang mengindikasikan kebaikan model sebesar 74%.
