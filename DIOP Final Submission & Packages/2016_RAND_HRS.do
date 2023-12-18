**For use on the remote desktop server (RDS) you will have to use the following code with the variables you want to deal with because RDS's version of Stata does not support the size of our dataset
**You will need to change the pathway in the use statement
use variable1 variable2 using "C:\Users\ltsippel\Syracuse University\Sophie Rose Haber - DIOP\2016 RAND HRS\h16f2c_STATA (1)\h16f2c.dta" 

**For use on the computers in class you must change the number of variables that Stata will allow in order to open the dataset
set maxvar 10000

**You will need to change the pathway in the use statement
use "C:\Users\ltsippel\Syracuse University\Sophie Rose Haber - DIOP\2016 RAND HRS\h16f2c_STATA (1)\h16f2c.dta"

**We wanted to reduce the number of variables we were working with due the large number in this dataset
keep pc153 pc151 pc152 pc157 pc158 pc159 pc148 pc272 pc273 pc053 pc010 pc285 pc155 pd101 pc055 pd102 pz216 px060_r pa019 pz261 pz262 pz117 pz254 pb014 pb015 pb016 pb017m pb117 pb119 pb122 pb123 pb128_13 pb128_14 pc210 pd501 pd554 pd555 pd556 pf233 pf234 pf235 pf236 pv009 pv264 pv265 pv266 pv267 pv269 pv270 pv271 pv272 pv273 pv274 pv275 pv276 pv277 pv278 pv279 pv280 pv281 pv282 pv283 pv284 pv285 pv286 pv287 pv288 pv289 pv290 pv291 pv292 pv293 pv294 pv295 pv296 pv298 pv299

**Saving a new dataset with the reduced variables 
save "C:\Users\armondin\Syracuse University\Sophie Rose Haber - DIOP\2016 RAND HRS\h16f2c_STATA (1)\h16f2c_reduced_variables.dta"

**Opening the dataset with the reduced set of variables, you will need to change the pathway in the use statement
use "C:\Users\armondin\OneDrive - Syracuse University\Documents\GitHub\course-project-diop\h16f2c_reduced_variables.dta"

**Exploring the variable pz262 (pw dementia)
*initial exploration
codebook pz262
sum pz262, detail 

**Exploring the variable pz216 (r years of education)
*initial exploration
codebook pz216
sum pz216, detail 
*Creating a frequency histogram 
histogram pz216, frequency

*Creating a bar graph for pz262 over pz216
graph bar (count) pz262 if pz262 == 1, over (pz216) 

*Creating tables for rate memory test pd101 and pd501
table pd101
table pd501
table pb014

**Exploring the variable pd554 (get lost in familiar places)
*initial exploration
codebook pd554
sum pd554, detail

*Creating a bar graph for pd554 over pz216 
generate pd554_yes = 0
replace pd554_yes = 1 if pd554 == 1
generate pd554_no = 0
replace pd554_no = 1 if pd554 == 5
graph bar pd554_yes pd554_no, over (pz216) percent stack legend(position(12) rows(2) label(1 "respondents who get lost in familiar places") label(2 "respondents who don't get lost in familiar places")) blabel(total, format(%9.0f))

*Creating a bar graph for pd554 over pc273 (ever had dementia), using the same generate statements as above
generate pd554_yes = 0
replace pd554_yes = 1 if pd554 == 1
generate pd554_no = 0 
replace pd554_no = 1 if pd554 == 5
graph bar pd554_yes pd554_no, over (pc273, label(angle(45)) relabel(1 "Yes" 2 "Now has condition" 3 "Now doesn't have condition" 4 "No" 5 "Don't know" 6 "Refused")) percent stack legend(position(12) rows(2) label(1 "respondents who get lost in familiar places") label(2 "respondents who don't get lost in familiar places")) blabel(total)

**Exploring the variable pv009 (forgetful during daily activities)
*initial exploration
codebook pv009
sum pv009, detail 

*Creating a bar graph for pv009 over pz216 
generate pv009_yes = 0 
replace pv009_yes = 1 if pv009 == 1
generate pv009_no = 0 
replace pv009_no = 1 if pv009 == 5
graph bar pv009_yes pv009_no, over (pz216) percent stack legend(position(12) rows(2) label(1 "forgetful during daily activities") label(2 "not forgetful during daily activities")) blabel(total, format(%9.0f))

*Creating a bar graph for pv009 over pc273 (ever had dementia), using the same generate statements as above
generate pv009_yes = 0 
replace pv009_yes = 1 if pv009 == 1
generate pv009_no = 0 
replace pv009_no = 1 if pv009 == 5
graph bar pv009_yes pv009_no, over (pc273, label(angle(45)) relabel(1 "Yes" 2 "Now has condition" 3 "Now doesn't have condition" 4 "No" 5 "Don't know" 6 "Refused")) percent stack legend(position(12) rows(2) label(1 "forgetful during daily activities") label(2 "not forgetful during daily activities")) blabel(total)

* Create a crosstabulation table
tabulate pc273 pb016, row col

* Cross-tabulate dementia and high school diploma/GED
tabulate pc273 pb015, row col

pwcorr chart
pwcorr pc273 pz216, sig
