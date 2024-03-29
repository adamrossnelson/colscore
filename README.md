# 1. College Scorecard Panel Data Builder
Collaborative effort that began in the summer of 2017 inspired this project. See for example: [Professor Nick Hillman](https://elpa.education.wisc.edu/elpa/people/faculty-and-staff-directory/nicholas-hillman) published [Working with college scorecard data](http://website.education.wisc.edu/nwhillman/index.php/2017/06/09/working-with-college-scorecard-data/) that guided readers through building a panel data set comprising [college score card data](https://collegescorecard.ed.gov/data/). From that post a conversation between Hillman, [Nicholas Cox](https://www.dur.ac.uk/geography/staff/geogstaffhidden/?id=335), [Kevin Fosnacht](http://education.indiana.edu/dotnetforms/Profile.aspx?u=kfosnach), and Alan Riley [of Stata Corporation](https://blog.stata.com/author/ariley/) further developed the choice of code.

Subsequently Hillman published [More college scorecard code for Stata](http://website.education.wisc.edu/nwhillman/index.php/2017/06/23/more-college-scorecard-code-for-stata/). Using the ideas shared in the above conversations, I developed a set of routines that build a panel data set of IPEDS data [StataIPEDSAll Project](https://github.com/adamrossnelson/StataIPEDSAll). Using the same ideas, this routine builds on Hillman's original blog post.

Fall 2019 brought an update to this code which includes `colscore_build_stata_meta.py` which works with [CollegeScorecardDataDictionary.xlsx](https://collegescorecard.ed.gov/assets/CollegeScorecardDataDictionary.xlsx) to create do file code that creates variable labels and value labels. Using `colscore_build_stata_meta.py` can help quickly update and refresh College Scorecard data as its source files evolve.

## 1.1. Usage

Plan your day. 
- At last testing, building the complete college scorecard data required approximately 11 min on a PC Windows 10 3.60 GHz Intel(R) Core(TM) i7-7700 CPU 16 GB RAM computer running Stata SE 15. 
- Slightly longer at 17 min on a Mac OS 10.10.5 (Mid 2014) 2.8 GHz Intel Core i7 16 GB RAM running Stata SE 15.
- Only 17 min on a Mac OX 11.1 (M1, 2020 Big Sur) MacBook Air 8 GB AM running Stata SE 16.

No promises that these code work as described or as users may desire. This work is collaborative and needs to be checked and re-checked. Report problems or concerns to Adam Ross Nelson on GitHub issues or via Twitter @adamrossnelson.

Run from Stata:

```Stata
do https://raw.githubusercontent.com/adamrossnelson/colscore/master/colscore.do
```

## 1.2. Suggested Naming Convention

When prompted for a log file name suggested name is `ColScore96to18.log` which will produce `ColScore96to18.dta` at the location you specify. (_Update year reference as needed_).

## 1.3. Updates

If I am behind on making updates let me know. Or branch the project, revise on your own, and submit a pull request. For beginners, contact me and I'll help you learn how.

## 1.4. Change log

See `colscore.do` headers and comments for change log.

## 1.5. License

MIT License

Copyright (c) 2018 Adam Ross Nelson

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
