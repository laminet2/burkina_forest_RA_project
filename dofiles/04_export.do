* 04_export.do - Final exports: tables and replication files

do "$do/00_setup.do"

* Save cleaned data as replication file
use "$clean/ehcvm_burkina_clean.dta", clear
save "$out/replication/ehcvm_burkina_clean_replication.dta", replace

* Export key summary table
use "$out/tables/diD_results.rtf", clear


