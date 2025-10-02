* 03_figures.do - Create figures for parallel trends & treatment effect

do "$do/00_setup.do"

* Load prepared means
use "$out/tmp_means_for_fig.dta", clear

* reshape for easy plotting
reshape wide cons_pc, i(wave) j(treat)

* Example line plot with markers
twoway (line cons_pc0 wave) (line cons_pc1 wave), ///
    title("Mean consumption per capita by group and wave") ///
    legend(label(1 "Control") label(2 "Treated")) ///
    xlabel(,angle(0))

graph export "$out/figures/mean_cons_by_group.png", replace

display "Figure exported to $out/figures/mean_cons_by_group.png"
