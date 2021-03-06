OPTIONS(ROWS=10000,DIRECT=True)
LOAD DATA
CHARACTERSET ZHS16GBK
INFILE "/zsoft/yxsp/file/res/INT_PTY_CUST_20170807.dat"
INTO TABLE yxsp_INT_PTY_CUST
TRUNCATE
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
	ODS_DATE,
	CUST_ID,
	CUST_NAME,
	CUST_TYPE_ID,
	CUST_SUB_TYPE,
	OCCUPATION_ID,
	COMPANY,
	POSITION,
	EDUCATION,
	EMAIL,
	CUST_CLASS_ID,
	CREDIT,
	PROVINCE_ID,
	CITY_ID,
	COUNTRY_ID,
	CREATE_DATE DATE "YYYY-MM-DD HH24:MI:SS",
	CUST_STS_ID,
	VALID_DATE DATE "YYYY-MM-DD HH24:MI:SS",
	CUST_CODE,
	CUST_GROUP_ID,
	STD_CUST_TYPE,
	LOCATION_TYPE,
	CUST_LEVEL,
	INDUSTRY_CD,
	ETL_TIME DATE "YYYY-MM-DD HH24:MI:SS"
)
