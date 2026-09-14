REM Webcamoid, camera capture application.
REM Copyright (C) 2022  Gonzalo Exequiel Pedone
REM
REM Webcamoid is free software: you can redistribute it and/or modify
REM it under the terms of the GNU General Public License as published by
REM the Free Software Foundation, either version 3 of the License, or
REM (at your option) any later version.
REM
REM Webcamoid is distributed in the hope that it will be useful,
REM but WITHOUT ANY WARRANTY; without even the implied warranty of
REM MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
REM GNU General Public License for more details.
REM
REM You should have received a copy of the GNU General Public License
REM along with Webcamoid. If not, see <http://www.gnu.org/licenses/>.
REM
REM Web-Site: http://webcamoid.github.io/

rem Install Qt
pip install -U pip
pip install aqtinstall

:: Змінено архітектуру на msvc2022, оскільки msvc2019 більше не постачається для Qt 6.8.2
aqt install-qt windows desktop "%QTVER%" win64_msvc2022_64 -O "C:\Qt"
aqt install-tool windows desktop tools_qtcreator -O "C:\Qt"

set QTDIR=C:\Qt\%QTVER%\msvc2022_64
set TOOLSDIR=C:\Qt\Tools\QtCreator
set PATH=%QTDIR%\bin;%TOOLSDIR%\bin;%PATH%

rem Install FFmpeg development headers and libraries
set FFMPEG_FILE=ffmpeg-%FFMPEG_VERSION%-full_build-shared.7z

:: Додано прапорець -f (падати при помилці сервера) та кастомний User-Agent, щоб gyan.dev не блокував запит
if not exist %FFMPEG_FILE% curl -f --retry 10 -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)" -kLOC - "https://www.gyan.dev/ffmpeg/builds/packages/%FFMPEG_FILE%"

if exist %FFMPEG_FILE% 7z x %FFMPEG_FILE% -aoa -bb

:: Прокидуємо змінні оточення у наступні кроки GitHub Actions (щоб build.bat та deploy.bat їх бачили)
if not "%GITHUB_ENV%"=="" echo QTDIR=%QTDIR% >> %GITHUB_ENV%
if not "%GITHUB_ENV%"=="" echo TOOLSDIR=%TOOLSDIR% >> %GITHUB_ENV%
if not "%GITHUB_PATH%"=="" echo %QTDIR%\bin >> %GITHUB_PATH%
if not "%GITHUB_PATH%"=="" echo %TOOLSDIR%\bin >> %GITHUB_PATH%

:Exit
