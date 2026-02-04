## **Methodology Summary**

I retrieved publicly available somatic mutation data for lung adenocarcinoma (LUAD) from the TCGA PanCancer Atlas study via cBioPortal. The dataset comprised mutation information for 566 LUAD patients. I performed all analyses in R using tidyverse packages to ensure reproducibility.

First, I scripted for the frequency of TP53 mutations , by identifying unique tumor samples harboring at least one TP53 alteration and dividing this count by the total number of unique patients in R studios. Next, I filtered the mutation dataset to retain only TP53-associated mutation events. These mutations were categorized based on their functional classification (e.g., missense, nonsense, frameshift, splice-site).

Finally, I summarized mutation counts by category and generated a bar plot to visualize the distribution of TP53 mutation types across the LUAD dataset.

## **Interpretation of Results**

From this analysis, I observed that TP53 mutations are prevalent in lung adenocarcinoma. Missense mutations constituted the most frequent mutation type, followed by nonsense and frameshift mutations. This distribution is consistent with the established role of TP53 as a tumor suppressor gene, where missense substitutions often disrupt DNA-binding capacity while allowing expression of a dysfunctional protein.

The predominance of functionally impactful TP53 mutations highlights their potential importance in LUAD pathogenesis. These findings provide a strong base for downstream analyses.

