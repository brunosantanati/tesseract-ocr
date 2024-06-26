# tesseract-ocr

## Script usage

<code>./find-and-copy-photos.sh word-to-be-searched /home/myuser/folder-to-search /home/myuser/destination-folder</code>  

## Installation and usage of tesseract

```
Installation:

sudo apt update

sudo apt install liblept5 libtesseract4 tesseract-ocr-eng tesseract-ocr-osd libxcb-cursor0

sudo apt-get --fix-broken install tesseract-ocr

Examples of usage:

tesseract -v
tesseract IMG-20240619-WA0005.jpg output
tesseract IMG-20240619-WA0005.jpg stdout --dpi 224 | tr '\n' '

```

## Links

[Optical Character Recognition with Tesseract](https://www.baeldung.com/java-ocr-tesseract)  
