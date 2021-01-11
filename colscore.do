version 14
clear all
set more off

// Jan/2020:  Routine updates.
// Oct/2019:  Created colscore_build_stata_meta.py to automate.
//            Value and variable label creation.
// Oct/2019:  Updated to include files added since Sep 2017.
// May/2018:  Tested on Linux. Success.
// Apr/2018:  Updated to document data elements added Feb of 2018.
// Mar/2018:  Updated to document data elements added Sep/Dec of 2017.
// Oct/2017:  Updated to include data files added in Sep of 2017.
// Sep/2017:  GitHub rebuild.
// Apr/2017:  Initial build.

// Corresponding Collaborator: Adam Ross Nelson

/*#############################################################################
      Maintained/more information at:
	  https://github.com/adamrossnelson/colscore
  
##############################################################################*/

// Save starting working directory for later reference
local starting_dir = c(pwd)

// Utilizes version of sshnd (interactive file picker)
do https://raw.githubusercontent.com/adamrossnelson/sshnd/master/sshnd.do

capture log close                                // Close stray log files.
log using "$loggbl", append                      // Append sshnd established log file.
local sp char(13) char(10) char(13) char(10)     // Define spacer.
di c(pwd)                                        // Confrim working directory.

// Copy the zip file from the web to our current directory
copy https://ed-public-download.app.cloud.gov/downloads/CollegeScorecard_Raw_Data.zip .

// Extract the contents of the zip file and change into the created directory
unzipfile CollegeScorecard_Raw_Data.zip, replace
cd CollegeScorecard_Raw_Data

forvalues i = 1996 / 2017 {
		// dataset names look like MERGED1996_97_PP.csv so the
		// next two lines come up with the '97' given '1996'.
	local num2 = (`i'+1) - int((`i'+1) / 100)*100
	local num2 : display %02.0f `num2'

		// entertain me while stepping through the files
	display "Processing MERGED`i'_`num2'_PP.csv"

		// read a file into a string scalar in memory
		// replace 'NULL' with Stata's '.n' extended missing value, and
		// likewise replace 'PrivacySuppressed' with '.p'
	scalar fcontents = fileread("MERGED`i'_`num2'_PP.csv")
	scalar fcontents = subinstr(fcontents, ",NULL", ",.n", .)
	scalar fcontents = subinstr(fcontents, ",NULNULL", ",.n", .)
	// scalar fcontents = subinstr(fcontents, ",NU", ",.n", .)
	// scalar fcontents = subinstr(fcontents, ",L", ",.n", .)
	scalar fcontents = subinstr(fcontents, ",PrivacySuppressed", ",.p", .)

		// Save the changed file contents as, e.g., MERGED_1996PP.csv
	scalar byteswritten = filewrite("MERGED_`i'PP.csv", fcontents, 1)

		// Now import all the variables from the CSV and generate a
		// year variable;
		// force opeid (column 2) to always be string;
		// force accredagency (column 8) to always be string;
		// force insturl (column 9) to always be string;
		// force npcurl (column 10) to always be string.
	import delimited "MERGED_`i'PP.csv", clear stringcols(2 8 9 10)
	gen int year = `i'
	gen int isYr = year

		// Fix string variable 'alias', which now has the string ".n"
		// in it for various observations; it is really a string
		// variable, so we just want to indicate missing with "".
	tostring alias accredcode, replace
	replace alias = "" if alias==".n"
	
		// Convert repay_dt_mdn and separ_dt_mdn, if they exist,
		// to Stata dates
	capture confirm string variable repay_dt_mdn
	if _rc==0 {
		gen long newdate = date(repay_dt_mdn,"MDY")
		replace newdate = .n if repay_dt_mdn==".n"
		replace newdate = .p if repay_dt_mdn==".p"
		drop repay_dt_mdn
		rename newdate repay_dt_mdn
		format repay_dt_mdn %td
	}
	else {
		// repay_dt_mdn didn't exist as string, so it must have
		// been all missing; fix up its type to match the type
		// of repay_dt_mdn from other datasets where it will be
		// a Stata date
		recast long repay_dt_mdn
	}
	capture confirm string variable separ_dt_mdn
	if _rc==0 {
		gen long newdate = date(separ_dt_mdn,"MDY")
		replace newdate = .n if separ_dt_mdn==".n"
		replace newdate = .p if separ_dt_mdn==".p"
		drop separ_dt_mdn
		rename newdate separ_dt_mdn
		format separ_dt_mdn %td
	}
	else {
		recast long separ_dt_mdn
	}
	capture confirm string variable t4approvaldate
	if _rc==0 {
		gen long newdate = date(t4approvaldate,"MDY")
		replace newdate = .n if t4approvaldate==".n"
		replace newdate = .p if t4approvaldate==".p"
		drop t4approvaldate
		rename newdate t4approvaldate
		format t4approvaldate %td
	}
	else {
		recast long separ_dt_mdn
	}
	
		// Update: Thse year specific fixes corrected in source data.
		// Commenting the block of code for historic reference.
		/*	
		// Repair incorrect values in HSI (2017)
	if `i' == 2017 {
		replace hsi = ".n" if hsi == "NU"
		destring hsi, replace
	}

		// Repair incorrect values in poolyrsret_pt (2001)
	if `i' == 2001 {
		replace poolyrsret_pt = ".n" if poolyrsret_pt == "L"
		destring poolyrsret_pt, replace
	}
	*/
		// Save as Stata dataset
	compress
	save "MERGED_`i'PP.dta", replace
}

clear
use "MERGED_1996PP.dta"
di "Loaded MERGED_1996PP.dta"

forvalues i = 1997/2017 {
	di "Merging MERGED_`i'PP.dta"
	append using "MERGED_`i'PP.dta"
}

// Fix strange character that sometimes appears in unitid
// column header/variable name
rename ïunitid unitid

// Data dictionary and other documenation:
//    https://collegescorecard.ed.gov/data/

// Variable labels & Value labels
// See colscore_legacy.do for former approaches.
// These files can be refreshed with colscore_build_stata_meta.py
// TODO: Engineer a method to "find" local copy of these files...
// do "`starting_dir'/colscore_val_lab_writes.do"
// do "`starting_dir'/colsgticore_var_lab_writes.do"
do https://raw.githubusercontent.com/adamrossnelson/colscore/master/colscore_var_lab_writes.do
do https://raw.githubusercontent.com/adamrossnelson/colscore/master/colscore_val_lab_writes.do


// Move up file directory level, compress, add notes.
// Save resulting panel data set.
cd ..
compress
label data "PanelBuildInfo: https://github.com/adamrossnelson/colscore"
notes _dta: "PanelBuildInfo: https://github.com/adamrossnelson/colscore"
notes _dta: "Panel built on `c(current_date)'"
saveold "$dtagbl", replace version(13)

qui { 
noi di "#####################################################################"
noi di ""
noi di "      Saved $dtagbl"
noi di ""
noi di "	  This do file is maintained by Adam Ross Nelson JD PhD at"
noi di "	  https://github.com/adamrossnelson/colscore"
noi di ""
noi di "	  Questions or comments via GitHub or Twitter @adamrossnelson"
noi di ""
noi di "######################################################################"
}
log close
