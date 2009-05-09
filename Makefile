all: index.html

index.html: index.html.tt2 data.yaml Makefile projects/*
	tt-render --path=.:template --data=data.yaml --post-chomp $< > $@

data.yaml: config.yaml
	perl bin/mkdata.pl $< > $@

clean:
	rm -f data.yaml
