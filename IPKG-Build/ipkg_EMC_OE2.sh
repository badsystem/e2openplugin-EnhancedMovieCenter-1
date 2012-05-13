#!/bin/sh

echo "Kopiere Plugin Enhanced Movie Center nach /tmp/temp/"
mkdir -p /tmp/temp/usr/lib/enigma2/python/Plugins/Extensions/
cp -r /usr/lib/enigma2/python/Plugins/Extensions/EnhancedMovieCenter/ /tmp/temp/usr/lib/enigma2/python/Plugins/Extensions/

echo "Kopiere Converter (nur *.pyo) nach /tmp/temp/"
mkdir -p /tmp/temp/usr/lib/enigma2/python/Components/Converter/
cp -r /usr/lib/enigma2/python/Components/Converter/EMCClockToText.pyo /tmp/temp/usr/lib/enigma2/python/Components/Converter/
cp -r /usr/lib/enigma2/python/Components/Converter/EMCEventName.pyo /tmp/temp/usr/lib/enigma2/python/Components/Converter/
cp -r /usr/lib/enigma2/python/Components/Converter/EMCServicePosition.pyo /tmp/temp/usr/lib/enigma2/python/Components/Converter/
cp -r /usr/lib/enigma2/python/Components/Converter/EMCServiceTime.pyo /tmp/temp/usr/lib/enigma2/python/Components/Converter/
cp -r /usr/lib/enigma2/python/Components/Converter/EMCMovieInfo.pyo /tmp/temp/usr/lib/enigma2/python/Components/Converter/
cp -r /usr/lib/enigma2/python/Components/Converter/EMCRecordPosition.pyo /tmp/temp/usr/lib/enigma2/python/Components/Converter/

echo "Kopiere Renderer (nur *.pyo) nach /tmp/temp/"
mkdir -p /tmp/temp/usr/lib/enigma2/python/Components/Renderer/
cp -r /usr/lib/enigma2/python/Components/Renderer/EMCPositionGauge.pyo /tmp/temp/usr/lib/enigma2/python/Components/Renderer/

echo "Kopiere Sources (nur *.pyo) nach /tmp/temp/"
mkdir -p /tmp/temp/usr/lib/enigma2/python/Components/Sources/
cp -r /usr/lib/enigma2/python/Components/Sources/EMCCurrentService.pyo /tmp/temp/usr/lib/enigma2/python/Components/Sources/
cp -r /usr/lib/enigma2/python/Components/Sources/EMCServiceEvent.pyo /tmp/temp/usr/lib/enigma2/python/Components/Sources/

echo "Kopiere Config Dateien aus /etc/enigma2/ nach /tmp/temp/"
mkdir -p /tmp/temp/etc/enigma2/
cp -r /etc/enigma2/emc-hide.cfg /tmp/temp/etc/enigma2/
cp -r /etc/enigma2/emc-noscan.cfg /tmp/temp/etc/enigma2/
cp -r /etc/enigma2/emc-permsort.cfg /tmp/temp/etc/enigma2/
cp -r /etc/enigma2/emc-topdir.cfg /tmp/temp/etc/enigma2/

echo "L�sche alle *.py unter /tmp/temp/"
rm -r /tmp/temp/usr/lib/enigma2/python/Plugins/Extensions/EnhancedMovieCenter/*.py

echo "Kopiere control Daten nach /tmp/temp/"
cp -r /media/hdd/ipk/EMC_OE2/CONTROL/ /tmp/temp/

echo "IPKG erstellung l�uft...."
sh ipkg-build.sh /tmp/temp/ /tmp
echo "IPKG erstellt unter /tmp/"