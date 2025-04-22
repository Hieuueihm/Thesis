@echo off
setlocal
REM Remove Vivado's python path to avoid conflicts
C:\Users\gbmhi\AppData\Local\Programs\Python\Python38\python.exe -m pip install --upgrade pip
C:\Users\gbmhi\AppData\Local\Programs\Python\Python38\python.exe -m pip install numpy
C:\Users\gbmhi\AppData\Local\Programs\Python\Python38\python.exe -m pip install scipy
C:\Users\gbmhi\AppData\Local\Programs\Python\Python38\python.exe -m pip install opencv-python

C:\Users\gbmhi\AppData\Local\Programs\Python\Python38\python.exe D:\Thesis\auto_scripts\generation\auto.py
endlocal
