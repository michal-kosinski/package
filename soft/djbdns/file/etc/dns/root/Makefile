data.cdb: data_new data_static
	@cat data_new|grep "%"|sort -u > data_new.tmp
	@cat data_static >> data_new.tmp
	@mv data_new.tmp data_new
	php doit.php
	/usr/bin/tinydns-data
	@cat data_new|grep "%"|wc -l
	