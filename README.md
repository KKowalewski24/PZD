## Big Data Processing - PZD(Przetwarzanie (dużych) zbiorów danych)

### Docker
Zainstalować Docker for Windows, sprawdzić czy się dobrze zainstowalał - docker pull hello-world \
Zmienić w ustawieniach Dockera na:
* ilość ramu na max - 2GiB
* swap na max - 4GiB 
* CPU 2 rdzenie wystarczaja
* żeby nie włączał się razem z systemem

###### Pobieranie obrazu
`docker pull cloudera/quickstart:latest`
###### Pierwsze uruchamienie
`docker run --hostname=quickstart.cloudera -v c:/coding:/coding --privileged=true -t -i -p 8888:8888 -p 7180:7180 cloudera/quickstart /usr/bin/docker-quickstart`

gdzie `-v c:/coding:/coding` oznacza, że udostepniam folder coding z windowsa - może myć to każdy inny folder na komputerze tylko
ważne aby w ustawieniach dockera - resources/filesharing wybrać dysk, który chcemy udostępniać. Co do nazwy folderu na windowsie to
lepiej, żeby była z małej litery.

###### Kolejne uruchomienia
`docker ps -a`\
`docker start -a id_container`\
albo \
`docker desktop` i pozniej `docker attach id_container`\
przełączam się na użytkowanika cloudera `su cloudera`

###### Wyłączanie 
`docker stop id_container` albo przez docker desktop

###### Włączanie i wyłączenie Hyper-V 
* https://blog.zeddba.com/2017/09/25/disabling-microsofts-hyper-v-to-use-oracles-virtualbox/
* Aby można było korzystać z VirtualBox mając jednocześnie zainstalowanego dockera trzeba włączać i wyłączać Hyper-V
* Wyłączanie - dla maszyny - Otwieramy CMD jako admin i polecenia `bcdedit /set hypervisorlaunchtype off` i poźniej panel sterowania->promgramy->ON/OFF funkcje Systemu Windows i odznaczamy cały folder Hyper-V i pozniej restart
* Włączanie - dla Docker - Otwieramy CMD jako admin i polecenia `bcdedit /set hypervisorlaunchtype auto` i poźniej panel sterowania->promgramy->ON/OFF funkcje Systemu Windows i zaznaczamy cały folder Hyper-V i pozniej restart

###### HUE
`http://localhost:8888/about/`

###### Budowanie i uruchamianie projektu MapReduce - tyg 1-4
* Tworzymy projekt z mavenem, ustawiamy w maven compiler plugin release na 1.6 i robimy mvn clean package
* Poźniej w przechodzimi do cmd gdzie jest odpalona cloudera z dockera i przechodzimy do shared folder tzn coding
* Wchodzimy do folderu z projektem i do folderu target
* Wykonujemy polecenie hadoop jar "Nazwa Jara" "głowna klasa z pakietem" "argsy z maina" tzn: \
    `hadoop jar task0-1.0.jar pl.jkkk.task0.WordCount ShortFile.txt out`
* Odpalamy tego jara domyślnego - ten co nie ma pliku manifest, póki co nie udało mi się ogarnąć generowania
  Jar with dependecies, żeby nie trzeba było podawać klasy głównej

###### Uruchamianie PIG Latin - tyg 5-7
* Warto pobrać plugin PIG do Jetbrains(IntelliJ)
* Upload zip poprzez Upload->Zip/Tzg file
* Wchodzimy w HUE->Query Editor->PIG->Wklejamy lub piszemy skrypt
* Zapisujemy go a pozniej robimy run
* Postępy działania programu widać w zakładce Job Browser
* Plik wynikowy jest w File Browser
* Lub wchodzimy w konsole gdzie jest odpalony docker w cloudera i wpisujemy `pig`
* Pozniej wklejami skrypt i czekamy na wykonanie
* Na samym dole bedzie wypisane dane z polecenia dump

###### HIVE 
* Wchodzimy w HUE->Query Editor->HIVE->Wklejamy lub piszemy skrypt
* Poźniej robimy execute i wykonuje sie cały skrypy, jeśli zaznaczymy tylko fragment to 
wykona sie tylko ten fragment
* Poniżej przycisku do uruchamiania wyświetla się efekt działania poleceń\
* Moim zdaniem najlepiej jest pisać kod w IntelliJ Ultimate - wspracie SQL tak jak w DataGrip
i tworzymy plik o *.hql (tak było napisane w internecie, że jest to poprawne rozszerzenie)
* Po utworzeniu pliku wybieramy, żeby interperowało ten plik jako SQL i poźniej w górny pasku,
który wyskoczy wybieramy Apache Hive - polecam sobie ustawić formatowanie dla SQL 

###### HBase
* W konsoli wpisujemy HBase Shell i możemy wprowadzać komendy tak jak są w stosownych plikach na repo
* Mozna ewentualnie robic to przez HUE - zakładka po prawo od Query Editor wybieramy 
HBase i analogiczne tworzymy tabele, rodziny itd 

###### Protipy:
* zeby skrypty dzialaly trzeba miedzy operatorami dawać spacje tzn przed i po 
znaku '=' musi byc spacja
* nazwy wszystkich funkcji agregujacych musza byc duzymi literami tzn SUM, COUNT itd
* Jak sie korzysta z funkcji agregujących to podczas wczytywania warto okreslic typ 
tzn age:int wtedy funkcje nie walą bledow

#### Harmonogram
* Tydzień 1 -- zapoznanie i instalacja
* Tydzień 2
    - task0 - Pierwszy program - WordCount `pl.jkkk.task0.WordCount`
    - task1 - WordCount – wersja z trzema plikami `pl.jkkk.task1.WordCount`
    - task2 - Średnia długość słów `pl.jkkk.task2.AvgWordLength`
    - task3 - Zliczanie wejść z adresów IP `pl.jkkk.task3.ProcessLogs`
* Tydzień 3
    - task1 - ImageCount `pl.jkkk.task1.ImageCounter`
    - task2 - Zmodyfikowany WordCount `pl.jkkk.task2.WordCountDriver`
* Tydzień 4
    - task1 - MonthPartitioner `pl.jkkk.task1.ProcessLogs`
    - SQL to MapReduce - sprawdź wiedze
* Tydzień 5
    - examples - przyklady kodu z GitHub
    - task1 - PIG - Przykład 1 - pogladowy 
    - task2 - PIG - Przykład 2 - WordCount
    - task3 - PIG - movies_data.csv
    - task4 - PIG - SEAflights.csv
    - task5 - PIG - WhiteHouseVisitorLog.csv
* Tydzień 6
    - task1 - PIG - Polecenia (a) DESCRIBE, (b) EXPLAIN, (c) LIMIT...DUMP, (d) ILLUSTRATE
    - task2 - PIG - Polecenia (a) JOIN (b) UNION
    - task3 - PIG - Polecenia (a) GROUP (b) COGROUP
    - task4 - PIG - Polecenia (a) COUNT_STAR (b) COUNT (c) MIN (d) MAX (e) SUM (f) AVG
    - task5 - PIG - Opis teoretyczny tylko w sprawku
* Tydzień 7
    - task1 - PIG - Salaries.csv
    - task2 - PIG - Salaries.csv
    - task3 - PIG - Salaries.csv
    - task4 - PIG - Batting.csv
    - task5 - PIG - Batting.csv
    - task6 - PIG - Batting.csv
    - task7 - PIG - Batting.csv
* Tydzień 8
    - task1 - Hive - zapoznanie z technologia
* Tydzień 9
    - task1 - Hive - Podaj dane 5 baseballistów, którzy zarobili najwięcej w swojej karierze zawodowej.
    - task2 - Hive - Dla każdego roku podaj gracza z najwyższą wartością zdobytych 
                     punktów (run - przejście przez bazę domową)
    - task3 - Hive - Znajdź zawodnika z najwyższą liczbą AB (At bat) i wylicz dla niego jego 
                     średnią odbić bating average (BA=H/AB, H - hits) w każdym roku
    - task4 - Hive - Pokaż graczy którzy zdobyli ponad 45 home run (HR) w sezonie
    - task5 - Hive - Podaj zespoły w kolejności malejącej dla których rzucający (pitch) zdobyli 
                     największą liczbę strikeout - SO (wyeliminowanie odbijającego)
* Tydzień 10
    - task1 - HBase - cwiczenia z poziomu powłoki
    - Brak Pliku - HBase - ćwiczenia z poziomu HUE
    - task2 - HBase - Zadanie – do zrealizowania z powłoki
* Tydzień 11
     - task1 - HBase - cwiczenia1 
     - task2 - HBase - cwiczenia2 
* Tydzień 12
     - Wolne     
* Tydzień 13
     - extra - folder treningowy przed kolosem
     - Kolos - plik z kolokwium
