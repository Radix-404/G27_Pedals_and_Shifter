REM g27calib release script
REM usage: g27calib_release.bat <path\to\python_interpreter> <GITHUB_VERSION>

%1 -m venv g27calib || exit /B 1

.\g27calib\Scripts\pip install https://github.com/n-e-y-s/G27_Pedals_and_Shifter/archive/%2.zip  || exit /B 1
.\g27calib\Scripts\pip install pyinstaller pywin32  || exit /B 1

echo from g27_pedals_and_shifter_gui.calib import main > g27calib.py
echo if __name__ == "__main__": >> g27calib.py
echo         main() >> g27calib.py

.\g27calib\Scripts\pyinstaller.exe -w --clean .\g27calib.py  || exit /B 1

cd dist
"C:\Program Files\7-Zip\7z.exe" a g27calib.zip g27calib || exit /B 1
cd ..
move dist\g27calib.zip . || exit /B 1
 

