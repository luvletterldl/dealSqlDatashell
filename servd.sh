#bin/bash
source /home/weblogic/.bash_profile
shhome=/home/weblogic/runsh/impdata/servd/
ctlName=servd.ctl
local=/home/weblogic/ftp/ods_jk/day/
lastDay=`date +"%Y%m%d" -d "-1day"`
thismon=`date +"%Y%m"`
preFile=TP_PRD_SERV_
flgName=${preFile}${lastDay}.flg;
fileName=${preFile}${lastDay}.dat;
echo "============================`date +"%Y-%m-%d %H:%M:%S"`============================"
echo "============================${flgName} start============================"
cd ${shhome}
#replace ctl file dat name
sed -i 's/'${preFile}'.*.dat\"$/'${preFile}${lastDay}'.dat\"/' ${ctlName}
sed -i 's/^INTO TABLE TP_PRD_SERV.*/INTO TABLE TP_PRD_SERV_'${thismon}'/' ${ctlName}

cd ${local}
ftp -i -v -n 137.32.126.12 <<ok
use ods_jk ods_jk
binary
cd /day/${lastDay}/
get ${flgName}
bye
ok
if [ -f ${local}${flgName} ] ;then
	echo "=============================${flgName} exist==========================="
	if [ -f ${local}${fileName} ] ;then
		echo "============================${fileName} is exist don't download============================"
	else
ftp -i -v -n 137.32.126.12 <<ok
		use ods_jk ods_jk
		binary
		cd /day/${lastDay}/
		get ${fileName}
		bye
ok
		echo "============================${fileName} download ok======================="
		cd ${shhome}
		sqlldr ÓÃ»§Ãû/ÃÜÂë@tpss_sc control = ${shhome}${ctlName}
	fi
else 
	echo "============================${flgName} not exist============================"
fi
