* 01_clean.do - Import raw data, clean, construct variables

do "$do/00_setup.do"

* ---  specification of raw filename ---
local rawfile "$raw/ehcvm_burkina_2018_2019.dta"

* Load data
display "Loading raw data..."
use "`rawfile'", clear

* --- Inspect
describe
ds

* Example variable renaming and labeling (change names to match dataset)
* The surveys have household id 'hhid', cluster 'village', year variables or wave indicators

* Ensure core IDs
capture confirm variable hhid
if !_rc {
    gen hh_id = hhid
} else {
    * Try alternative
    capture confirm variable hhid2
    if !_rc {
        gen hh_id = hhid2
    } else {
        display as error "ERROR: no household ID found; please locate ID variable"
        exit 1
    }
}

*  create survey wave indicator if present 
capture confirm variable year
if !_rc {
    gen wave = year
} else {
    * If dataset has round variable
    capture confirm variable round
    if !_rc {
        gen wave = round
    }
}

* Create treatment indicator: receipt of input subsidy
if !_rc {
    gen treat = (input_subsidy==1)
} else {
    * If dataset lacks a direct variable, create a proxy: e.g., if household received free fertilizer
    * gen treat = (fert_free==1)
    display "No direct subsidy variable found "
}

* Create outcome variables
* Example: per capita consumption (if consumption and household size exist)
capture confirm variable consumption_total
if !_rc & !_rc {
    capture confirm variable hhsize
    if !_rc {
        gen cons_pc = consumption_total / hhsize
    }
}

* Food security index example (if food_security module exists)
* gen foodsec = ...

* Keep essential variables and save cleaned file
keep hh_id village wave treat cons_pc consumption_total hhsize /* add other vars */
order hh_id wave village
sort hh_id wave
save "$clean/ehcvm_burkina_clean.dta", replace

display "Cleaned dataset saved to $clean/ehcvm_burkina_clean.dta"
