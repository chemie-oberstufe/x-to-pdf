#!/bin/bash

for zipfile in *.zip
do
	zipname="$(echo -e "${zipfile}" | sed -e "s/.zip//")"

	echo "$zipname"

	unzip "$zipfile" -d "$zipname"

	cd "$zipname"

	#for bild_jpg in *.jpg
	#do
	#	convert "$bild_jpg" "$bild_jpg".pdf
	#done

	#for bild_jpeg in *.jpeg
	#do
	#	convert "$bild_jpeg" "$bild_jpeg".pdf
	#done

	#for bild_png in *.jpg
	#do
	#	convert "$bild_png" "$bild_png".pdf
	#done

	convert *.jpg -auto-orient "${zipname}.deleteme.pdf"
	
	convert *.jpeg -auto-orient "${zipname}.deleteme.pdf"

	convert *.png -auto-orient "${zipname}.deleteme.pdf"

	for bild_pdf in *.deleteme.pdf
	do
		pdfjam --paper a4paper --outfile "${zipname}_A4.pdf" "$bild_pdf"
	done

	rm -v *.jpg *.jpeg *.png *.deleteme.pdf

	mv -v *.pdf ../

	cd ..

	rm -rf "$zipname"

	rm "$zipfile"

done


