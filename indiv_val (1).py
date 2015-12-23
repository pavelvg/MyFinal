# -*- coding: utf-8 -*-
"""
Created on Sun Dec  6 21:10:54 2015

@author: Valentin Pavel
"""

import pandas as pd
import MySQLdb as myDB
import sys
import wbdata
import datetime
import matplotlib.pyplot as plt

def createMd():
    db1=myDB.connect('localhost','root','root')
    cursor=db1.cursor()
    sql="CREATE DATABASE IF NOT EXISTS MD"
    cursor.execute(sql)
    myDB.connection.close


data_date=(datetime.datetime(2014,1,1),datetime.datetime(2014,12,1))
#ce_cap=wbdata.get_data('NY.GDP.MKTP.PP.KD', data_date=datetime.datetime(2011,1,1))



countryInfo = wbdata.get_country(country_id=None, display=False)
dfInfo = pd.DataFrame(countryInfo) 
cix=[]
ccodes = [];
cnames = [];
for i in range(len(dfInfo)):
    if str(dfInfo['region'][i]['value'])  != 'Aggregates':
        cix.append(i)
        ccodes.append(dfInfo['id'][i])
        cnames.append(dfInfo['name'][i])
dfCC = pd.DataFrame(ccodes, index=cnames, columns=['id']) 

indicators={'EN.ATM.CO2E.PC':'CO2PC','EN.ATM.CO2E.KT':'CO2TOTL','NY.GDP.MKTP.PP.KD':'GDP','SP.DYN.LE00.IN':'LifeExp','SP.URB.TOTL.IN.ZS':'UrbanP','EG.USE.COMM.FO.ZS':'Fossil','EG.FEC.RNEW.ZS':'Renew'}
#ind={'NY.GDP.MKTP.PP.KD':'GDP'}
ce_def=wbdata.get_dataframe(indicators,  country=ccodes, data_date=datetime.datetime(2011,1,1))#,keep_levels=False)
d1=ce_def.GDP/ce_def.CO2TOTL
res=pd.concat([ce_def,d1], axis=1,join_axes=[ce_def.index])
res.columns=[u'CO2PC', u'CO2TOTL', u'Fossil', u'GDP', u'LifeExp', u'Renew', u'UrbanP', u'GDPCO2'] # reneame last column to GDPCO2

def myscatterplot(df,a,b):
    df.plot(kind='scatter',x=a,y=b)
def mybarplot(df,a):
    df.sort(a,ascending=False)[:5][a].plot(kind='bar',color='g')
    
def writteDb(df,tabl): # writte df dataframe to dba databse in table tabl
    db=myDB.connect('localhost','root','root','MD') # Opens a connection to the 'dba' database
    df.to_sql(name=tabl,con=db,if_exists='replace',flavor='mysql',index='True')
    myDB.connection.close
createMd()
writteDb(res,'MyD')
