# Use CollegeScorecardDataDictionary.xlsx, build var & val labels.
# Data source: 
# https://collegescorecard.ed.gov/assets/CollegeScorecardDataDictionary.xlsx
#
# Oct/2019:  Initial build.

import local_support_code as lsc
import requests
import datetime
import pandas as pd
import numpy as np

def abbreviate_long_labs(long_text):
    short_text = long_text

    wrds_to_abbrev = {'Institution':'Inst','State':'St.',
                      'institution':'inst','program':'prog.',
                      'Number':'Num','undergraduate':'udgr.',
                      'number':'num',
                      'degree':'deg.','Classificaiton':'Class',
                      'College and University':'Col.&Univ.',
                      'American':'Am.','Native':'Natv.',
                      'Hispanic':'Hisp.','Pacific':'Pac.',
                      'Religous':'Relig.','affiliation':'affl.',
                      'rate':'rt.','percentile':'pctl.',
                      'Midpoint':'Midpt.','cumulative':'cuml.',
                      'Average':'Avg.','equivalent':'equiv.',
                      'Percentage':'Pctg.','Certificate':'Cert.',
                      'Percent':'%','the ':'',
                      'of degress awarded in':'deg. awd. in',
                      'Associate':'Assoc.','Bachelor':'Bchlr',
                      'And':'&','Total':'Tot.',
                      'enrollment':'enrlmt.','degree-seeking':'deg-sking',
                      'student':'stdnt','income':'inc.',
                      'family':'fam.','other':'oth',
                      'first':'1st','four-year':'4yr',
                      'two-year':'2yr','2-year':'2yr','4-year':'4yr',
                      'of expected time to completion':'exp time to comltn',
                      'denominator':'dnmtr','Adjusted':'Adjstd',
                      'count for':'cnt.','low-':'LW','high-':'HI','middle-':'MID',
                      'transfer':'xfr','receiv':'rcv',
                      'Transfer':'Xfer',
                      'federal':'fed.','at the':'@',
                      'first-generation':'1stGen','between':'btwn',
                      'unknown':'unkn','of ':'',
                      'never':'nvr','generation':'genrtn',
                      'original':'orig','female':'fmle',
                      'years':'yrs','Years':'Yrs',
                      'One-year':'1yr','average':'avg',
                      'Two-year':'2yr','Three-year':'3yr',
                      'Four-year':'4yr','Five-year':'5yr',
                      'Six-year':'6yr','Seven-year':'7yr',
                      'Cumulative':'Cmltive','1-year':'1yr',
                      '5-year':'5yr','3-year':'3yr','7-year':'7yr',
                      'program':'prog','full-time':'flTime',
                      'First-time':'1stTime',
                      'part-time':'ptTime','year':'yr',
                      ' yrs':'yrs','completion':'comp',
                      'less-than-':'<',
                      '\n':''}

    for key, value in wrds_to_abbrev.items():
        if short_text is not np.nan:
            short_text = short_text.replace(key, value)

    return(short_text)

def remove_after_break(broken_text):
    unbroken_text = broken_text
    if broken_text is not np.nan:
        if broken_text.find('\n') > -1:
            unbroken_text = broken_text[0:broken_text.find('\n')]
    return unbroken_text

def write_a_file(text_to_write, fname=''):
    text_file = open(fname, 'w')
    text_file.write(text_to_write)
    text_file.close()

def yes_or_no(question):
    reply = str(input(question+' (y/n): ')).lower().strip()
    if reply[0] == 'y':
        return True
    if reply[0] == 'n':
        return False
    else:
        return yes_or_no("Please enter:")

try:
    df = pd.read_excel('CollegeScorecardDataDictionary.xlsx', verbose=True,
                       sheet_name='data_dictionary')
except FileNotFoundError:
    file_domain = 'https://collegescorecard.ed.gov/assets/'
    file_source = 'CollegeScorecardDataDictionary.xlsx'
    print('\nFile not found. Would you like to download a local copy of:')
    if yes_or_no(file_domain + file_source):
        r = requests.get(file_domain + file_source)
        with open(file_source, 'wb') as f:
            f.write(r.content)
    df = pd.read_excel(file_domain + file_source, verbose=True,
                       sheet_name='data_dictionary')

df['NAME OF DATA ABBREV'] = df['NAME OF DATA ELEMENT'].apply(remove_after_break)
df['NAME OF DATA ABBREV'] = df['NAME OF DATA ABBREV'].apply(abbreviate_long_labs)

# Make reference file show orig description and abbrev description
orig_to_abbrev_file = '# Crosswalk Of Original & Abberviated Descriptions\n\n'

varname_list = []
original_desc_list = []
abbrev_desc_list = []
for i in list(df['VARIABLE NAME'].dropna()):
    varname_list.append(i)

for i in list(df['NAME OF DATA ELEMENT'].dropna()):
    original_desc_list.append(i)

for i in list(df['NAME OF DATA ABBREV'].dropna()):
    abbrev_desc_list.append(i)

for i in range(0,len(original_desc_list)):
    orig_to_abbrev_file = orig_to_abbrev_file + varname_list[i]
    orig_to_abbrev_file = orig_to_abbrev_file + '\n'
    orig_to_abbrev_file = orig_to_abbrev_file + original_desc_list[i]
    orig_to_abbrev_file = orig_to_abbrev_file + '\n'
    orig_to_abbrev_file = orig_to_abbrev_file + abbrev_desc_list[i]
    orig_to_abbrev_file = orig_to_abbrev_file + '\n\n'

write_a_file(orig_to_abbrev_file, fname='colscore_varname_abbrevs.md')

# Make do file that will write var labels
colscore_var_lab_writer = '// Auto-written by colscore_build_stata_meta.py\n\n'
colscore_var_lab_writer = colscore_var_lab_writer + '// File written on: ' 
colscore_var_lab_writer = colscore_var_lab_writer + str(datetime.datetime.now()) + '\n\n'

for i in range(0,len(original_desc_list)):
    colscore_var_lab_writer = colscore_var_lab_writer + 'lab var '
    colscore_var_lab_writer = colscore_var_lab_writer + varname_list[i].lower()
    colscore_var_lab_writer = colscore_var_lab_writer + ' "'
    colscore_var_lab_writer = colscore_var_lab_writer + abbrev_desc_list[i]
    colscore_var_lab_writer = colscore_var_lab_writer + '"\n'

colscore_var_lab_writer = colscore_var_lab_writer + '\n'   
write_a_file(colscore_var_lab_writer, fname='colscore_var_lab_writes.do')

# Make do file that will write the val labels.
calscore_val_lab_writer = '// Auto-written by colscore_build_stata_meta.py\n\n'
calscore_val_lab_writer = calscore_val_lab_writer + '// File written on: ' 
calscore_val_lab_writer = calscore_val_lab_writer + str(datetime.datetime.now()) + '\n\n'

varlist = list(df[(df['LABEL'].fillna('.') != '.') & \
    (df['VALUE'].fillna('.') != '.')]['VARIABLE NAME'].dropna())
df['VARIABLE NAME FFILL'] = df['VARIABLE NAME'].ffill()
for i in varlist:
    keylist = df[df['VARIABLE NAME FFILL'] == i]['VALUE'].dropna().apply(int)
    lablist = df[df['VARIABLE NAME FFILL'] == i]['LABEL'].dropna()
    val_lab_dict = dict(zip(keylist, lablist))

    calscore_val_lab_writer = calscore_val_lab_writer + 'label define '
    calscore_val_lab_writer = calscore_val_lab_writer + 'vl_' + i + ' '
    for key, value in val_lab_dict.items():
        calscore_val_lab_writer = calscore_val_lab_writer + str(key) + ' "'
        calscore_val_lab_writer = calscore_val_lab_writer + value.strip() + '" '
    calscore_val_lab_writer = calscore_val_lab_writer + '\n'
    calscore_val_lab_writer = calscore_val_lab_writer + 'label values '
    calscore_val_lab_writer = calscore_val_lab_writer + i.lower() + ' vl_' + i
    calscore_val_lab_writer = calscore_val_lab_writer + '\n\n'

write_a_file(calscore_val_lab_writer, fname='colscore_val_lab_writes.do')
