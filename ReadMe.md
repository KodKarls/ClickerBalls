# README #

## POLSKI

### Opis gry
ClickerBalls to prosta gra, w której gracz za pomocą myszki musi w czasie 60 sekund kliknąć jak najwięcej pojawiających się piłek. Za każdą z nich gracz otrzymuje odpowiednią liczbę punktów. Piłki występują w trzech kolorach i każda z nich znika po określonym czasie:

* piłka czerwona: znika po jednej sekundzie, gracz otrzymuje za nią 10 punktów
* piłka zielona: znika po trzech sekundach, gracz otrzymuje za nią 5 punktów
* piłka niebieska: nie znika (dopóki nie zostanie kliknięta), gracz otrzymuje za nią 1 punkt

Po upływie 60 sekund gra sprawdza czy został ustanowiony nowy rekord punktowy. Jeśli tak to zapisuje go i wczytuje w kolejnej rozgrywce. Czas gry widoczny jest w środkowo-górnej części ekranu. Punkty zdobywane w rozgrywce są widoczne w lewym górnym rogu ekranu. Natomiast najlepszy wynik widoczny jest w prawym górnym rogu ekranu. Dane o najlepszym wyniku można znaleźć w pliku best_score.txt, znajdującym się w folderze data.

### Sposób uruchamiania
Projekt stworzony został za pośrednictwem Visual Studio Code z wykorzystaniem Lua w wersji 5.3.6 i frameworka LÖVE w wersji 11.4. W celu uruchomienia gry należy pobrać repozytorium, zainstalować odpowiednią wersję Lua i framework LÖVE:

* [Lua](http://luabinaries.sourceforge.net)
* [LÖVE](https://love2d.org)

Następnie należy postępować zgodnie z instrukcjami zawartymi na stronie frameworka LÖVE.

### Notka twórcy
Jeśli masz jakieś uwagi? Widzisz jakiś błąd? Pisz śmiało :)

## English

### Description of the application
ClickerBalls is a simple game in which the player has to use the mouse to click as many balls as possible within 60 seconds. For each of them, the player receives the appropriate number of points. Balls come in three colors and each of them disappears after a certain period of time:

* red ball: disappears after one second, the player gets 10 points for it
* green ball: disappears after three seconds, the player gets 5 points for it
* blue ball: it does not disappear (until it is clicked), the player gets 1 point for it

After 60 seconds, the game checks whether a new point record has been achieved. If so, it saves it and loads it in the next game. The game time is shown in the top-middle of the screen. The points earned during the game are shown in the top-left corner of the screen. Whereas the best score is shown in the top-right corner of the screen. The best score data can be found in the best_score.txt file in the data folder.

### How to run
The project was created using Visual Studio Code with the use of Lua version 5.3.6 and the LÖVE framework version 11.4. To run the game, you need to download the repository, install the appropriate version of Lua and the LÖVE framework:

* [Lua](http://luabinaries.sourceforge.net)
* [LÖVE](https://love2d.org)

Then follow the instructions on the LÖVE framework website. 

### Creator's Note
If you have any comments? Do you see any mistake? Go on and write to me :) 