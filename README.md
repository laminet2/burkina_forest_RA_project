# burkina_forest_RA_project
Assessing the effect of an agricultural input subsidy on household welfare: a DiD analysis using Burkina Faso household survey data.

---

# README.md

## 📌 Project Title

**The Impact of Agricultural Input Subsidies on Household Welfare in Burkina Faso: A Difference-in-Differences Analysis**

---

## 📂 Project Structure

```
burkina_forest_RA_project/
├── data/
│   ├── raw/                # Original household survey data (EHCVM 2018/19, etc.)
│   ├── raw_docs/           # Questionnaires, codebooks, metadata
│   └── cleaned/            # Cleaned datasets created by dofiles
│
├── dofiles/
│   ├── 00_setup.do         # Path setup, package checks
│   ├── 01_clean.do         # Cleaning and variable construction
│   ├── 02_analysis.do      # Descriptive statistics and DiD regressions
│   ├── 03_figures.do       # Graphs and data visualization
│   └── 04_export.do        # Export regression tables and replication files
│
├── output/
│   ├── tables/             # Summary stats, regression results
│   ├── figures/            # Graphs (trends, treatment effects)
│   └── reports/            # Policy-style results note
│
├── README.md               # This file
```

---

## 📝 Project Description

This project evaluates whether agricultural input subsidies improve household welfare outcomes in Burkina Faso. Using nationally representative household survey data from the **EHCVM 2018/19** (Harmonized Household Living Standards Survey), we apply a **Difference-in-Differences (DiD)** strategy to compare households that received input subsidies (treatment group) to those that did not (control group), before and after program implementation.

Key skills demonstrated:

* **Data cleaning & management** in Stata (merging, reshaping, missing values, labeling).
* **Econometric analysis** (DiD estimation with clustered SEs, household FE).
* **Survey data handling** (household-level data, construction of welfare indicators).
* **Visualization & reporting** (parallel trends graphs, regression tables).
* **Reproducible workflows** (modular `.do` files, structured outputs, GitHub-ready).

---

## ⚙️ Requirements

* **Software:** Stata 15+
* **User-written commands:**

  * `estout` (for regression tables)
  * `reghdfe` (for high-dimensional FE regressions)
  * `ivreg2` (optional, for robustness checks)

Install them via:

```stata
ssc install estout
ssc install reghdfe
ssc install ivreg2
```

---

## ▶️ How to Run

1. **Download data**

   * Register and download the [EHCVM 2018/19 Burkina Faso microdata](https://microdata.worldbank.org/index.php/catalog/4472).
   * Place the `.dta` files in `data/raw/`.
   * Place survey questionnaires/codebooks in `data/raw_docs/`.

2. **Set project path**

   * Open `dofiles/00_setup.do`.

     ```stata
     global projroot "C:/path/to/burkina_forest_RA_project"
     ```
     
3. **Run workflow**

   * In Stata, run the following in order:

     ```stata
     do dofiles/00_setup.do
     do dofiles/01_clean.do
     do dofiles/02_analysis.do
     do dofiles/03_figures.do
     do dofiles/04_export.do
     ```

4. **Check outputs**

   * Cleaned datasets → `data/cleaned/`
   * Regression tables → `output/tables/`
   * Figures → `output/figures/`
   * Policy-style brief → `output/reports/`

---

## 📊 Outputs

* **Tables**: Summary statistics, DiD regression results (in `.rtf` for easy inclusion in reports).
* **Figures**: Parallel trends plots, treatment vs. control comparisons.
* **Policy Brief**: A 2-page note summarizing results and policy implications.

---

## 🔗 References & Data Sources

* World Bank Microdata Catalog — [EHCVM 2018/19, Burkina Faso](https://microdata.worldbank.org/index.php/catalog/4472)
* FAO Agricultural Surveys — [Permanent Agricultural Survey](https://microdata.fao.org)
* Data in Emergencies Monitoring (FAO/WB) — Burkina Faso 2022

