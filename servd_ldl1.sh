#bin/bash
source /home/weblogic/.bash_profile
shhome=/zsoft/yxsp/sh/
ctlName=servd_ldl1.ctl
local=/zsoft/yxsp/file/res/
lastDay=`date +"%Y%m%d" -d "-1day"`
lastDay=20170807
thismon=`date +"%Y%m"`
preFile=INT_PTY_CUST_
flgName=${preFile}${lastDay}.flg;
fileName=${preFile}${lastDay}.dat;
echo "============================`date +"%Y-%m-%d %H:%M:%S"`============================"
echo "============================${flgName} start============================"
cd ${shhome}
#replace ctl file dat name
sed -i 's/'${preFile}'.*.dat\"$/'${preFile}${lastDay}'.dat\"/' ${ctlName}
sed -i 's/^INTO TABLE INT_PTY_CUST.*/INTO TABLE INT_PTY_CUST_'${thismon}'/' ${ctlName}

cd ${local}
#ftp -i -v -n 137.32.126.12 <<okls
#use ods_jk ods_jk
#binary
#cd /day/${lastDay}/
#get ${flgName}
#bye
#ok
#if [ -f ${local}${flgName} ] ;then
	#echo "=============================${flgName} exist==========================="
	#if [ -f ${local}${fileName} ] ;then
		#echo "============================${fileName} is exist don't download============================"
	#else
#ftp -i -v -n 137.32.126.12 <<ok
		#use ods_jk ods_jk
		#binary
		#cd /day/${lastDay}/
		#get ${fileName}
		#bye
#ok
		#echo "============================${fileName} download ok======================="
		#cd ${shhome}
		sqlldr hn_mst/zsoft_189@YXSPDB control = ${shhome}${ctlName}
	#fi
#else 
	#echo "============================${flgName} not exist============================"
#fi
