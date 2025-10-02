* 02_analysis.do - descriptive stats and DiD estimation

do "$do/00_setup.do"
use "$clean/ehcvm_burkina_clean.dta", clear

* Descriptive statistics
sum cons_pc if !mi(cons_pc)
tabstat cons_pc, by(treat) statistics(n mean sd median) format(%9.2f)

* Simple means by group and wave
table wave treat, c(mean cons_pc sd cons_pc N cons_pc)

* Visual check: mean outcomes by group and wave (exported in 03_figures.do)
collapse (mean) cons_pc, by(wave treat)
save "$out/tmp_means_for_fig.dta", replace

* Re-load cleaned data for regression
use "$clean/ehcvm_burkina_clean.dta", clear

* Create post indicator if wave values are known (e.g., baseline=2018, followup=2022)
gen post = (wave==2022) 

* DiD OLS:
* Basic specification
regress cons_pc i.treat##i.post, vce(cluster village)

* If panel with household fixed effects and multiple waves:
xtset hh_id wave
xtreg cons_pc i.treat##i.post, fe vce(cluster village)

* Using reghdfe for high-dim fixed effects (e.g., wave + village)
cap which reghdfe
if _rc ssc install reghdfe
reghdfe cons_pc i.treat##i.post, absorb(hh_id) vce(cluster village)

* Save regression outputs
esttab using "$out/tables/diD_results.rtf", replace se star(* 0.10 ** 0.05 *** 0.01)
