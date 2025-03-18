%let pgm=utl-sum-purchases-before-and-after-sale-dates-sql-sas-r-python-and-excel;

%stop_submission;

Sum purchases before and after a sale dates date sql sas r python and excel

       SOLUTIONS
            1 sql sas
            2 sql r
            3 sql python
            4 sql excel

sas communities
https://tinyurl.com/mmttn3dc
https://communities.sas.com/t5/SAS-Programming/Total-sum-before-and-after-dates-in-a-dataset/m-p/937289#M368281

solution by ksharp
https://communities.sas.com/t5/user/viewprofilepage/user-id/18408


/**************************************************************************************************************************/
/*   INPUTS             |               PROCESS                                      |     OUTPUT                         */
/*                      |                                                            |     ======                         */
/* TRANS DATES          |              1 SAS SQL (self explantory)                   |                                    */
/*                      |               ==========================                   |    DT     SUM_LE_DATE SUM_GT_DATE  */
/*      DT              |                                                            |                                    */
/*                      |                                                            | 2024-07-04    60          430      */
/* 2024-07-04           |                                                            | 2024-07-25   390          100      */
/* 2024-07-25           |                                                            |                                    */
/*                      |                       select                               |                                    */
/* MASTER DATES         |                         *                                  |                                    */
/*               BEFORE |  <= and >     <= and>  ,(select                            |                                    */
/*                AFTER |   07-04        07-25       sum(AMT)                        |                                    */
/*     DT      AMT CUTS |   SUMS         SUMS      from                              |                                    */
/*                      |                            sd1.master                      |                                    */
/* 2024-07-03   10      |                          where                             |                                    */
/* 2024-07-04   20      |                            DT <= trans.DT) as sum_le_date  |                                    */
/* 2024-07-04-- 30 --- -- 60 <=07-04                                                 |                                    */
/* 2024-07-11   40      |                        ,(select                            |                                    */
/* 2024-07-11   50      |                            sum(AMT)                        |                                    */
/* 2024-07-16   70      |                         from                               |                                    */
/* 2024-07-16   80      |                            sd1.master                      |                                    */
/* 2024-07-25-- 90 ------------------ 390 <=0725  where                              |                                    */
/* 2024-07-26  100      |430 > 07-04  100 > 0725     DT >trans.DT) as sum_gt_date    |                                    */
/*                      |                         from                               |                                    */
/*                      |                       sd1.trans;                           |                                    */
/* TRANSACTIONS         |                                                            |                                    */
/* ============         |------------------------------------------------------------|                                    */
/*                      |                                                            |                                    */
/* options              | 2 sql r (exactly the same code, see below)                 |                                    */
/* validvarname=upcase; | ==========================================                 |                                    */
/* libname sd1 "d:/sd1";|                                                            |                                    */
/* data sd1.trans;      | 3 sql python (exactly the same code, see below)            |                                    */
/* input DT $10.;       | ===============================================            |                                    */
/* cards4;              |                                                            |                                    */
/* 2024-07-04           | 4 sql excel (exactly the same code, see below)             |                                    */
/* 2024-07-25           | ==============================================             |                                    */
/* ;;;;                 |                                                            |                                    */
/* run;quit;            |                                                            |                                    */
/*                      |                                                            |                                    */
/*                      |                                                            |                                    */
/* MASTER               |                                                            |                                    */
/* ======               |                                                            |                                    */
/*                      |                                                            |                                    */
/* data sd1.master;     |                                                            |                                    */
/* input DT $10.        |                                                            |                                    */
/*  AMT;                |                                                            |                                    */
/* datalines;           |                                                            |                                    */
/* 2024-07-03 10        |                                                            |                                    */
/* 2024-07-04 20        |                                                            |                                    */
/* 2024-07-04 30        |                                                            |                                    */
/* 2024-07-11 40        |                                                            |                                    */
/* 2024-07-11 50        |                                                            |                                    */
/* 2024-07-16 70        |                                                            |                                    */
/* 2024-07-16 80        |                                                            |                                    */
/* 2024-07-25 90        |                                                            |                                    */
/* 2024-07-26 100       |                                                            |                                    */
/* ;;;;                 |                                                            |                                    */
/* run;quit;            |                                                            |                                    */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options
validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.trans;
input DT $10.;
cards4;
2024-07-04
2024-07-25
;;;;
run;quit;

data sd1.master;
input DT $10.
 AMT;
datalines;
2024-07-03 10
2024-07-04 20
2024-07-04 30
2024-07-11 40
2024-07-11 50
2024-07-16 70
2024-07-16 80
2024-07-25 90
2024-07-26 100
;;;;
run;quit;

/**************************************************************************************************************************/
/*  SD1.TRANS                                                                                                             */
/*                                                                                                                        */
/*         DT                                                                                                             */
/*                                                                                                                        */
/*     2024-07-04                                                                                                         */
/*     2024-07-25                                                                                                         */
/*                                                                                                                        */
/*  SD1.MASTER                                                                                                            */
/*                                                                                                                        */
/*        DT        AMT                                                                                                   */
/*                                                                                                                        */
/*    2024-07-03     10                                                                                                   */
/*    2024-07-04     20                                                                                                   */
/*    2024-07-04     30                                                                                                   */
/*    2024-07-11     40                                                                                                   */
/*    2024-07-11     50                                                                                                   */
/*    2024-07-16     70                                                                                                   */
/*    2024-07-16     80                                                                                                   */
/*    2024-07-25     90                                                                                                   */
/*    2024-07-26    100                                                                                                   */
/**************************************************************************************************************************/

/*                             _
/ |  ___  __ _ ___   ___  __ _| |
| | / __|/ _` / __| / __|/ _` | |
| | \__ \ (_| \__ \ \__ \ (_| | |
|_| |___/\__,_|___/ |___/\__, |_|
                            |_|
*/

proc sql;
  create
    table want as
   select
     *
    ,(select
        sum(AMT)
      from
        sd1.master
      where
        DT <= trans.DT) as sum_le_date

    ,(select
        sum(AMT)
     from
        sd1.master
     where
        DT >trans.DT) as sum_gt_date
     from
   sd1.trans;
quit;

/**************************************************************************************************************************/
/*                SUM_LE_    SUM_GT_                                                                                      */
/*      DT          DATE       DATE                                                                                       */
/*                                                                                                                        */
/*  2024-07-04       60        430                                                                                        */
/*  2024-07-25      390        100                                                                                        */
/**************************************************************************************************************************/

/*___                     _
|___ \   _ __   ___  __ _| |
  __) | | `__| / __|/ _` | |
 / __/  | |    \__ \ (_| | |
|_____| |_|    |___/\__, |_|
                       |_|
*/

proc datasets lib=sd1 nolist nodetails;
 delete want;
run;quit;

%utl_rbeginx;
parmcards4;
library(haven)
library(sqldf)
source("c:/oto/fn_tosas9x.R")
trans<-read_sas("d:/sd1/trans.sas7bdat")
master<-read_sas("d:/sd1/master.sas7bdat")
want<-sqldf('
select
  *
 ,(select
     sum(AMT)
   from
     master
   where
     DT <= trans.DT) as sum_le_date

 ,(select
     sum(AMT)
  from
     master
  where
     DT >trans.DT) as sum_gt_date
  from
     trans
');
want
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;quit;


/**************************************************************************************************************************/
/*  R                                   | SAS                                                                             */
/*                                      |                            SUM_LE_    SUM_GT_                                   */
/*          DT sum_le_date sum_gt_date  |  ROWNAMES        DT          DATE       DATE                                    */
/*                                      |                                                                                 */
/*  2024-07-04          60         430  |      1       2024-07-04       60        430                                     */
/*  2024-07-25         390         100  |      2       2024-07-25      390        100                                     */
/**************************************************************************************************************************/

/*____               _   _                             _
|___ /   _ __  _   _| |_| |__   ___  _ __    ___  __ _| |
  |_ \  | `_ \| | | | __| `_ \ / _ \| `_ \  / __|/ _` | |
 ___) | | |_) | |_| | |_| | | | (_) | | | | \__ \ (_| | |
|____/  | .__/ \__, |\__|_| |_|\___/|_| |_| |___/\__, |_|
        |_|    |___/                                |_|
*/

proc datasets lib=sd1 nolist nodetails;
 delete pywant;
run;quit;

%utl_pybeginx;
parmcards4;
exec(open('c:/oto/fn_python.py').read());
trans,meta = ps.read_sas7bdat('d:/sd1/trans.sas7bdat');
master,meta = ps.read_sas7bdat('d:/sd1/master.sas7bdat');
want=pdsql('''
select                                 \
  *                                    \
 ,(select                              \
     sum(AMT)                          \
   from                                \
     master                            \
   where                               \
     DT <= trans.DT) as sum_le_date    \
                                       \
 ,(select                              \
     sum(AMT)                          \
  from                                 \
     master                            \
  where                                \
     DT >trans.DT) as sum_gt_date      \
  from                                 \
     trans
''')
print(want);
fn_tosas9x(want,outlib='d:/sd1/',outdsn='pywant',timeest=3);
;;;;
%utl_pyendx;

proc print data=sd1.pywant;
run;quit;

/**************************************************************************************************************************/
/* PYTHON                                   | SAS                                                                         */
/*                                          |               SUM_LE_    SUM_GT_                                            */
/*            DT  sum_le_date  sum_gt_date  |     DT          DATE       DATE                                             */
/*                                          |                                                                             */
/* 0  2024-07-04         60.0        430.0  | 2024-07-04       60        430                                              */
/* 1  2024-07-25        390.0        100.0  | 2024-07-25      390        100                                              */
/**************************************************************************************************************************/


%utlfkil(d:/xls/wantxl.xlsx);

%utl_rbeginx;
parmcards4;
library(openxlsx)
library(sqldf)
library(haven)
trans<-read_sas("d:/sd1/trans.sas7bdat")
master<-read_sas("d:/sd1/master.sas7bdat")
wb <- createWorkbook()
addWorksheet(wb, "trans")
addWorksheet(wb, "master")
writeData(wb, sheet = "trans", x = trans)
writeData(wb, sheet = "master", x = master)
saveWorkbook(
    wb
   ,"d:/xls/wantxl.xlsx"
   ,overwrite=TRUE)
;;;;
%utl_rendx;

%utl_rbeginx;
parmcards4;
library(openxlsx)
library(sqldf)
source("c:/oto/fn_tosas9x.R")
 wb<-loadWorkbook("d:/xls/wantxl.xlsx")
 trans<-read.xlsx(wb,"trans")
 master<-read.xlsx(wb,"master")
 addWorksheet(wb, "want")
 want<-sqldf('
select
  *
 ,(select
     sum(AMT)
   from
     master
   where
     DT <= trans.DT) as sum_le_date

 ,(select
     sum(AMT)
  from
     master
  where
     DT >trans.DT) as sum_gt_date
  from
     trans
');
print(want)
writeData(wb,sheet="want",x=want)
saveWorkbook(
    wb
   ,"d:/xls/wantxl.xlsx"
   ,overwrite=TRUE)
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;quit;

/**************************************************************************************************************************/
/* d:/xls/wantxl.xlsx                                                                                                     */
/*                                                                                                                        */
/* -----------------------+                                                                                               */
/* | A1| fx      | DT     |                                                                                               */
/* ----------------------------------                                                                                     */
/* [_] |   A     |    B   |    C    |                                                                                     */
/* ----------------------------------                                                                                     */
/*     |         | SUM_LE_| SUM_GE_ |                                                                                     */
/*  1  |    DT   | DATE   | DATE    |                                                                                     */
/*  -- |---------+------- +---------+                                                                                     */
/*  2  |2024-07-04|  60   | 430     |                                                                                     */
/*  -- |----------+--+----+----------                                                                                     */
/*  3  |2024-07-25| 390   | 100     |                                                                                     */
/*  -- |----------+-------+----------                                                                                     */
/* [WANT]                                                                                                                 */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
