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

if not "%GITHUB_SHA%" == "" set GIT_COMMIT_HASH="%GITHUB_SHA%"

:: 1. ВИПРАВЛЕНО: Шлях змінено на актуальну архітектуру msvc2022_64
set QTDIR=C:\Qt\%QTVER%\msvc2022_64
set TOOLSDIR=C:\Qt\Tools\QtCreator

rem Visual Studio init
:: 2. ВИПРАВЛЕНО: Шлях змінено на Visual Studio 2022 Enterprise для windows-latest
set VSPATH=C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build
call "%VSPATH%\vcvarsall" amd64

set FFMPEG_PATH=%CD%\ffmpeg-%FFMPEG_VERSION%-full_build-shared
set PATH_ORIG=%PATH%

set INSTALL_PREFIX=%CD%\webcamoid-data
set PATH=%QTDIR%\bin;%TOOLSDIR%\bin;%FFMPEG_PATH%\bin;%PATH%

:: ТУТ ДАЛІ ЙДЕ ВАША ОРИГІНАЛЬНА ЛОГІКА ДЕПЛОЮ (наприклад, windeployqt, cpack або 7z архівація бінариків)
:: ... Вставте ваш оригінальний код деплою нижче ...

set PATH=%PATH_ORIG%
