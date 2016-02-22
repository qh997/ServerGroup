#!/usr/bin/bash

WORK_PATH=$(cd `dirname $0`; pwd)

for ser_conf in `ls *.ser`; do
	ser=`echo $ser_conf | sed 's/\.ser//'`
	ip=`sed -n 1p $ser_conf`
	for file in `sed 1d $ser_conf`; do
		file_path="./${ser}$(dirname $file)"
		[ -d "${file_path}" ] || mkdir -p "${file_path}"
		expect -c "
			spawn scp gengs@${ip}:${file} ./${ser}${file}
			expect \"*password:\"
			send \"123\r\"
			expect eof
		"
	done
done
