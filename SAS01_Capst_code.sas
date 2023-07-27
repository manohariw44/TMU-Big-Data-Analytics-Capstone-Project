


/*import data from Excel files */
proc import out=ins_data
    datafile="C:/Users/swijesooriya/Documents/ticdata2000_w_hd.csv"
    dbms=csv
    replace;
    getnames=YES;
run;

/* print 10 observations   */
PROC PRINT DATA=ins_data(obs=10);
RUN;
/* Get frequency report     */
PROC FREQ DATA=ins_data;
RUN;
/*  */
/* Check duplicates         */
proc freq data = ins_data;     
      tables var1 / nocum nocol norow nopercent;
run;



proc freq data = ins_data;     
      tables _ALL_ / nocum nocol norow nopercent;
run;

data ins_data_d; set ins_data; run;

proc sort data = ins_data_d nodupkey;
by sd_cust_subtype -- po_ins_pol_caravan ;
run;

proc sql;
	select count(*) as Number_of_re_ins_data from ins_data;
quit;

proc sql;
	select count(*) as Number_of_re_ins_data_d from ins_data_d;
quit;

