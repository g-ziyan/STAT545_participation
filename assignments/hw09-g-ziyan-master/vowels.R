library(stringr)
words <- readLines("words.txt")
count <- str_count(words, "[aeiou]")
vowels <- table(count)
write.table(vowels, "vowels.tsv",
						sep = "\t", row.names = FALSE, quote = FALSE)