// Auto-written by colscore_build_stata_meta.py

// File written on: 2019-10-15 19:54:57.472289

label define vl_MAIN 0 "Not main campus" 1 "Main campus" 
label values main vl_MAIN

label define vl_PREDDEG 0 "Not classified" 1 "Predominantly certificate-degree granting" 2 "Predominantly associate's-degree granting" 3 "Predominantly bachelor's-degree granting" 4 "Entirely graduate-degree granting" 
label values preddeg vl_PREDDEG

label define vl_HIGHDEG 0 "Non-degree-granting" 1 "Certificate degree" 2 "Associate degree" 3 "Bachelor's degree" 4 "Graduate degree" 
label values highdeg vl_HIGHDEG

label define vl_CONTROL 1 "Public" 2 "Private nonprofit" 3 "Private for-profit" 
label values control vl_CONTROL

label define vl_ST_FIPS 1 "Alabama" 2 "Alaska" 4 "Arizona" 5 "Arkansas" 6 "California" 8 "Colorado" 9 "Connecticut" 10 "Delaware" 11 "District of Columbia" 12 "Florida" 13 "Georgia" 15 "Hawaii" 16 "Idaho" 17 "Illinois" 18 "Indiana" 19 "Iowa" 20 "Kansas" 21 "Kentucky" 22 "Louisiana" 23 "Maine" 24 "Maryland" 25 "Massachusetts" 26 "Michigan" 27 "Minnesota" 28 "Mississippi" 29 "Missouri" 30 "Montana" 31 "Nebraska" 32 "Nevada" 33 "New Hampshire" 34 "New Jersey" 35 "New Mexico" 36 "New York" 37 "North Carolina" 38 "North Dakota" 39 "Ohio" 40 "Oklahoma" 41 "Oregon" 42 "Pennsylvania" 44 "Rhode Island" 45 "South Carolina" 46 "South Dakota" 47 "Tennessee" 48 "Texas" 49 "Utah" 50 "Vermont" 51 "Virginia" 53 "Washington" 54 "West Virginia" 55 "Wisconsin" 56 "Wyoming" 60 "American Samoa" 64 "Federated States of Micronesia" 66 "Guam" 69 "Northern Mariana Islands" 70 "Palau" 72 "Puerto Rico" 78 "Virgin Islands" 
label values st_fips vl_ST_FIPS

label define vl_REGION 0 "U.S. Service Schools" 1 "New England (CT, ME, MA, NH, RI, VT)" 2 "Mid East (DE, DC, MD, NJ, NY, PA)" 3 "Great Lakes (IL, IN, MI, OH, WI)" 4 "Plains (IA, KS, MN, MO, NE, ND, SD)" 5 "Southeast (AL, AR, FL, GA, KY, LA, MS, NC, SC, TN, VA, WV)" 6 "Southwest (AZ, NM, OK, TX)" 7 "Rocky Mountains (CO, ID, MT, UT, WY)" 8 "Far West (AK, CA, HI, NV, OR, WA)" 9 "Outlying Areas (AS, FM, GU, MH, MP, PR, PW, VI)" 
label values region vl_REGION

label define vl_LOCALE 11 "City: Large (population of 250,000 or more)" 12 "City: Midsize (population of at least 100,000 but less than 250,000)" 13 "City: Small (population less than 100,000)" 21 "Suburb: Large (outside principal city, in urbanized area with population of 250,000 or more)" 22 "Suburb: Midsize (outside principal city, in urbanized area with population of at least 100,000 but less than 250,000)" 23 "Suburb: Small (outside principal city, in urbanized area with population less than 100,000)" 31 "Town: Fringe (in urban cluster up to 10 miles from an urbanized area)" 32 "Town: Distant (in urban cluster more than 10 miles and up to 35 miles from an urbanized area)" 33 "Town: Remote (in urban cluster more than 35 miles from an urbanized area)" 41 "Rural: Fringe (rural territory up to 5 miles from an urbanized area or up to 2.5 miles from an urban cluster)" 42 "Rural: Distant (rural territory more than 5 miles but up to 25 miles from an urbanized area or more than 2.5 and up to 10 miles from an urban cluster)" 43 "Rural: Remote (rural territory more than 25 miles from an urbanized area and more than 10 miles from an urban cluster)" 
label values locale vl_LOCALE

label define vl_LOCALE2 1 "Large City (a central city of a CMSA or MSA, with the city having a population greater than or equal to 250,000)" 2 "Mid-Size City (a central city of a CMSA or MSA, with the city having a population less than 250,000)" 3 "Urban Fringe of a Large City (any territory within a CMSA or MSA of a Large City and defined as urban by the Census Bureau)" 4 "Urban Fringe of a Mid-Size City (any territory within a CMSA or MSA of a Mid-Size City and defined as urban by the Census Bureau)" 5 "Large Town (an incorporated place or Census-designated place with a population greater than or equal to 25,000 and located outside a CMSA or MSA)" 6 "Small Town (an incorporated place or Census-designated place with a population less than 25,000 and greater than or equal to 2,500 and located outside a CMSA or MSA)" 7 "Rural, Outside MSA (any territory designated as rural by the Census Bureau that is outside a CMSA or MSA of a Large or Mid-Size City)" 8 "Rural, Inside MSA (any territory designated as rural by the Census Bureau that is within a CMSA or MSA of a Large or Mid-Size City)" 
label values locale2 vl_LOCALE2

label define vl_CCBASIC -2 "Not applicable" 0 "(Not classified)" 1 "Associate's Colleges: High Transfer-High Traditional" 2 "Associate's Colleges: High Transfer-Mixed Traditional/Nontraditional" 3 "Associate's Colleges: High Transfer-High Nontraditional" 4 "Associate's Colleges: Mixed Transfer/Career & Technical-High Traditional" 5 "Associate's Colleges: Mixed Transfer/Career & Technical-Mixed Traditional/Nontraditional" 6 "Associate's Colleges: Mixed Transfer/Career & Technical-High Nontraditional" 7 "Associate's Colleges: High Career & Technical-High Traditional" 8 "Associate's Colleges: High Career & Technical-Mixed Traditional/Nontraditional" 9 "Associate's Colleges: High Career & Technical-High Nontraditional" 10 "Special Focus Two-Year: Health Professions" 11 "Special Focus Two-Year: Technical Professions" 12 "Special Focus Two-Year: Arts & Design" 13 "Special Focus Two-Year: Other Fields" 14 "Baccalaureate/Associate's Colleges: Associate's Dominant" 15 "Doctoral Universities: Very High Research Activity" 16 "Doctoral Universities: High Research Activity" 17 "Doctoral/Professional Universities" 18 "Master's Colleges & Universities: Larger Programs" 19 "Master's Colleges & Universities: Medium Programs" 20 "Master's Colleges & Universities: Small Programs" 21 "Baccalaureate Colleges: Arts & Sciences Focus" 22 "Baccalaureate Colleges: Diverse Fields" 23 "Baccalaureate/Associate's Colleges: Mixed Baccalaureate/Associate's" 24 "Special Focus Four-Year: Faith-Related Institutions" 25 "Special Focus Four-Year: Medical Schools & Centers" 26 "Special Focus Four-Year: Other Health Professions Schools" 27 "Special Focus Four-Year: Engineering Schools" 28 "Special Focus Four-Year: Other Technology-Related Schools" 29 "Special Focus Four-Year: Business & Management Schools" 30 "Special Focus Four-Year: Arts, Music & Design Schools" 31 "Special Focus Four-Year: Law Schools" 32 "Special Focus Four-Year: Other Special Focus Institutions" 33 "Tribal Colleges" 
label values ccbasic vl_CCBASIC

label define vl_CCUGPROF -2 "Not applicable" 0 "Not classified (Exclusively Graduate)" 1 "Two-year, higher part-time" 2 "Two-year, mixed part/full-time" 3 "Two-year, medium full-time" 4 "Two-year, higher full-time" 5 "Four-year, higher part-time" 6 "Four-year, medium full-time, inclusive, lower transfer-in" 7 "Four-year, medium full-time, inclusive, higher transfer-in" 8 "Four-year, medium full-time, selective, lower transfer-in" 9 "Four-year, medium full-time , selective, higher transfer-in" 10 "Four-year, full-time, inclusive, lower transfer-in" 11 "Four-year, full-time, inclusive, higher transfer-in" 12 "Four-year, full-time, selective, lower transfer-in" 13 "Four-year, full-time, selective, higher transfer-in" 14 "Four-year, full-time, more selective, lower transfer-in" 15 "Four-year, full-time, more selective, higher transfer-in" 
label values ccugprof vl_CCUGPROF

label define vl_CCSIZSET -2 "Not applicable" 0 "(Not classified)" 1 "Two-year, very small" 2 "Two-year, small" 3 "Two-year, medium" 4 "Two-year, large" 5 "Two-year, very large" 6 "Four-year, very small, primarily nonresidential" 7 "Four-year, very small, primarily residential" 8 "Four-year, very small, highly residential" 9 "Four-year, small, primarily nonresidential" 10 "Four-year, small, primarily residential" 11 "Four-year, small, highly residential" 12 "Four-year, medium, primarily nonresidential" 13 "Four-year, medium, primarily residential" 14 "Four-year, medium, highly residential" 15 "Four-year, large, primarily nonresidential" 16 "Four-year, large, primarily residential" 17 "Four-year, large, highly residential" 18 "Exclusively graduate/professional" 
label values ccsizset vl_CCSIZSET

label define vl_HBCU 0 "No" 1 "Yes" 
label values hbcu vl_HBCU

label define vl_PBI 0 "No" 1 "Yes" 
label values pbi vl_PBI

label define vl_ANNHI 0 "No" 1 "Yes" 
label values annhi vl_ANNHI

label define vl_TRIBAL 0 "No" 1 "Yes" 
label values tribal vl_TRIBAL

label define vl_AANAPII 0 "No" 1 "Yes" 
label values aanapii vl_AANAPII

label define vl_HSI 0 "No" 1 "Yes" 
label values hsi vl_HSI

label define vl_NANTI 0 "No" 1 "Yes" 
label values nanti vl_NANTI

label define vl_MENONLY 0 "No" 1 "Yes" 
label values menonly vl_MENONLY

label define vl_WOMENONLY 0 "No" 1 "Yes" 
label values womenonly vl_WOMENONLY

label define vl_RELAFFIL -1 "Not reported" -2 "Not applicable" 22 "American Evangelical Lutheran Church" 24 "African Methodist Episcopal Zion Church" 27 "Assemblies of God Church" 28 "Brethren Church" 30 "Roman Catholic" 33 "Wisconsin Evangelical Lutheran Synod" 34 "Christ and Missionary Alliance Church" 35 "Christian Reformed Church" 36 "Evangelical Congregational Church" 37 "Evangelical Covenant Church of America" 38 "Evangelical Free Church of America" 39 "Evangelical Lutheran Church" 40 "International United Pentecostal Church" 41 "Free Will Baptist Church" 42 "Interdenominational" 43 "Mennonite Brethren Church" 44 "Moravian Church" 45 "North American Baptist" 47 "Pentecostal Holiness Church" 48 "Christian Churches and Churches of Christ" 49 "Reformed Church in America" 50 "Episcopal Church, Reformed" 51 "African Methodist Episcopal" 52 "American Baptist" 53 "American Lutheran" 54 "Baptist" 55 "Christian Methodist Episcopal" 57 "Church of God" 58 "Church of Brethren" 59 "Church of the Nazarene" 60 "Cumberland Presbyterian" 61 "Christian Church (Disciples of Christ)" 64 "Free Methodist" 65 "Friends" 66 "Presbyterian Church (USA)" 67 "Lutheran Church in America" 68 "Lutheran Church - Missouri Synod" 69 "Mennonite Church" 71 "United Methodist" 73 "Protestant Episcopal" 74 "Churches of Christ" 75 "Southern Baptist" 76 "United Church of Christ" 77 "Protestant, not specified" 78 "Multiple Protestant Denomination" 79 "Other Protestant" 80 "Jewish" 81 "Reformed Presbyterian Church" 84 "United Brethren Church" 87 "Missionary Church Inc" 88 "Undenominational" 89 "Wesleyan" 91 "Greek Orthodox" 92 "Russian Orthodox" 93 "Unitarian Universalist" 94 "Latter Day Saints (Mormon Church)" 95 "Seventh Day Adventists" 97 "The Presbyterian Church in America" 99 "Other (none of the above)" 100 "Original Free Will Baptist" 101 "Ecumenical Christian" 102 "Evangelical Christian" 103 "Presbyterian" 105 "General Baptist" 106 "Muslim" 107 "Plymouth Brethren" 
label values relaffil vl_RELAFFIL

label define vl_CIP01CERT1 0 "Program not offered" 
label values cip01cert1 vl_CIP01CERT1

label define vl_CIP01CERT2 1 "Program offered" 
label values cip01cert2 vl_CIP01CERT2

label define vl_CIP01ASSOC 2 "Program offered through an exclusively distance-education program" 
label values cip01assoc vl_CIP01ASSOC

label define vl_DISTANCEONLY 0 "Not distance-education only" 1 "Distance-education only" 
label values distanceonly vl_DISTANCEONLY

label define vl_CURROPER 0 "Not currently certified as an operating institution" 1 "Currently certified as operating" 
label values curroper vl_CURROPER

label define vl_ICLEVEL 1 "4-year" 2 "2-year" 3 "Less-than-2-year" 
label values iclevel vl_ICLEVEL

label define vl_OPENADMP 1 "Yes" 2 "No" 3 "Does not enroll first-time students" 
label values openadmp vl_OPENADMP

label define vl_SCHTYPE 1 "Public" 2 "Private, Nonprofit" 3 "Proprietary" 
label values schtype vl_SCHTYPE

label define vl_OPEFLAG 1 "Participates in Title IV federal financial aid programs" 2 "Branch campus of a main campus that participates in Title IV" 3 "Deferment only - limited participation" 5 "Not currently participating in Title IV, has an OPE ID number" 6 "Not currently participating in Title IV, does not have OPE ID number" 7 "Stopped participating during the collection year" 8 "New participants (became eligible during the collection year)" 
label values opeflag vl_OPEFLAG

