* 00_setup.do
clear all
set more off

* --- set project root path (change to your local path) ---
global projroot "C:\Users\Traore Mara\Desktop\burkina_forest_RA_project\dofiles"

* Paths
global raw "$projroot/data/raw"
global clean "$projroot/data/cleaned"
global out "$projroot/output"
global do "$projroot/dofiles"

cd "$projroot"

* Check/install useful packages
cap which esttab
if _rc ssc install estout
cap which reghdfe
if _rc ssc install reghdfe
cap which outsheet

display "Project root set to: " "$projroot"
