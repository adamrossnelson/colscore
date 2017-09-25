# colscore
College Scorecard Panel Data Builder

## Introduction

This project is inspired by a collaborative effort that begain in the summer of 2017 [Professor Nick Hillman](https://elpa.education.wisc.edu/elpa/people/faculty-and-staff-directory/nicholas-hillman) published [Working with college scorecard data](http://website.education.wisc.edu/nwhillman/index.php/2017/06/09/working-with-college-scorecard-data/) that guided readers through the process of building a panel data set consisting of [college score card data](https://collegescorecard.ed.gov/data/). From that post a conversation between Hillman, [Nicholas Cox](https://www.dur.ac.uk/geography/staff/geogstaffhidden/?id=335), [Kevin Fosnacht](http://education.indiana.edu/dotnetforms/Profile.aspx?u=kfosnach), and Alan Riley [of Stata Corporation](https://blog.stata.com/author/ariley/) further developed the choice of code. I had the fortune to 'listen' in on some of the emails.

Subsequently Hillman published [More college scorecard code for Stata](http://website.education.wisc.edu/nwhillman/index.php/2017/06/23/more-college-scorecard-code-for-stata/). Using the ideas shared in the above conversations I developed a set of routines that build a panel data set of IPEDS data [StataIPEDSAll Stable Version 1.0](https://github.com/adamrossnelson/StataIPEDSAll/tree/1.0). Using the same ideas this routine builds on Hillman's original blog post.

Upon implementation available from Stata's command line is a quick way to download and build college scorecard panel data:
```
do https://raw.githubusercontent.com/adamrossnelson/colscore/___/colscore.do

[to be impemented]
```