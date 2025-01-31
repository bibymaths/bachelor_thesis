## Title: Identification of Potent Biomarkers for Prostate Cancer Through AR, Mapk and M-TOR Signaling Pathways Mining 

## **Overview**
This repository contains all scripts, results, and documentation related to the **bachelor's thesis project** focused on identifying biomarkers for **prostate cancer** by analyzing the **AR (Androgen Receptor), MAPK, and m-TOR signaling pathways** using microarray datasets. The study integrates **bioinformatics, pathway analysis, and statistical approaches** to discover genes that may serve as potential therapeutic targets.

## **Project Components**
The repository is structured as follows:

### **1. Scripts**
- **`view_dataset.R`** – Loads and explores datasets using the `GEOquery` package.
- **`parse_CEL.R`** – Preprocesses `.CEL` files from GEO datasets and normalizes the data.
- **`packages.R`** – Installs and loads necessary Bioconductor packages.
- **`WBDEGS.R`** – Runs WB-DEGS (a Shiny app for differential gene expression analysis).
- **`get_supplement.R`** – Downloads supplementary GEO datasets.

### **2. Data and Results**
- **`results_annotation.xlsx`** – Annotated results of significant genes identified.
- **`results_STRING.xlsx`** – STRING network analysis results for gene interactions.
- **`results.docx`** – Summary of STRING and GeneMANIA interactions, listing key biomarkers.
- **`results.xlsx`** – Comprehensive results including differentially expressed genes (DEGs) across datasets.

### **3. Documentation**
- **`methods.pdf`** – Details the methodology, including preprocessing, statistical analysis, and pathway mapping.
- **`datasets.pdf`** – Lists all GEO datasets used for analysis, including descriptions and accession numbers.
- **`thesis.pdf`** – The full **bachelor's thesis** report.

## **Methodology**
1. **Data Collection**  
   - Microarray gene expression datasets were retrieved from **GEO (NCBI Gene Expression Omnibus)**.
   - Selected datasets targeted **AR, MAPK, and m-TOR pathways**.
   
2. **Preprocessing & Normalization**  
   - **Background correction** and **quantile normalization** were performed using `affy` and `limma` packages.
   - **RMA normalization** was applied to preprocess `.CEL` files.

3. **Differential Expression Analysis**  
   - Conducted using **GEO2R, MeV (MultiExperiment Viewer), and WB-DEGS**.
   - Applied statistical tests: **t-test, linear models, twilight, and SAM (Significance Analysis of Microarrays)**.
   - Identified **overexpressed and underexpressed genes** in prostate cancer samples.

4. **Pathway & Network Analysis**  
   - **STRING and GeneMANIA** were used to analyze gene interactions.
   - Identified **intra-pathway** and **inter-pathway** interactions between AR, MAPK, and m-TOR genes.
   - **Key biomarkers** were selected based on network connectivity and literature evidence.

## **Key Findings**
- **13 candidate genes** identified as potential biomarkers for prostate cancer.
- **Hub genes** found with strong interactions across pathways:
  - **AR Pathway:** _PRKACB, CDK1, EIF5B_
  - **MAPK Pathway:** _EDN1, RPS6, SERBP1_
  - **m-TOR Pathway:** _RPL23, RPS20, UCHL5_
- **Inter-pathway connections** suggest interactions between AR, MAPK, and m-TOR genes in prostate cancer progression.

## **How to Use**
1. **Install Required Packages**  
   ```r
   source("http://bioconductor.org/biocLite.R")
   biocLite(c("GEOquery", "affy", "limma", "gcrma", "shiny"))
   ```
2. **Run Data Preprocessing**  
   ```r
   source("parse_CEL.R")
   ```
3. **Perform Differential Expression Analysis**  
   ```r
   source("WBDEGS.R")
   ```
4. **Explore Pathway Interactions**  
   - Open **results_STRING.xlsx** and **results_annotation.xlsx** to review gene interactions.

## **Authors & Acknowledgments**
- **Abhinav Mishra**, **Nimisha Asati**
- **Supervisor:** Dr. Tiratha Raj Singh
- **Institution:** Jaypee University of Information Technology, Waknaghat
- **Year:** 2017

## **License**
This project is open-source under the **MIT License**.

### Reference 
A. Mishra and N. Asati, Identification of Potent Biomarkers for Prostate Cancer Through AR, MAPK, and m-TOR Signaling Pathways Mining. Solan, HP: Jaypee University of Information Technology, 2017.
