all: report2.html

clean:
	rm -f words.txt histogram.tsv histogram.png report.md report.html vowels.tsv vowels.png report2.md report2.html

report.html: report.rmd histogram.tsv histogram.png
	Rscript -e 'rmarkdown::render("$<")'

histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf

histogram.tsv: histogram.r words.txt
	Rscript $<

report2.html: report2.rmd vowels.tsv vowels.png
	Rscript -e 'rmarkdown::render("$<")'

vowels.png: vowels.tsv
	Rscript -e 'library(ggplot2); qplot(count, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf

vowels.tsv: vowels.R words.txt
	Rscript $<

words.txt:
	Rscript -e 'download.file("http://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'