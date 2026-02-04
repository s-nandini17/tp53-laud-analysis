library(readr)
library(dplyr)

mutations <- read_tsv("C:/Users/Lenovo/Downloads/table.tsv", show_col_types = FALSE)
colnames(mutations)

total_patients <- mutations %>%
  distinct(`Sample ID`) %>%
  nrow()
tp53_mutations <- mutations %>%
  filter(Gene == "TP53")
tp53_patients <- tp53_mutations %>%
  distinct(`Sample ID`) %>%
  nrow()
tp53_frequency <- tp53_patients / total_patients
cat("Total LUAD patients:", total_patients, "\n")
cat("Patients with TP53 mutation:", tp53_patients, "\n")
cat("TP53 mutation frequency:", round(tp53_frequency, 3), "\n")

tp53_categorized <- tp53_mutations %>%
  mutate(
    Mutation_Category = case_when(
      `Mutation Type` == "Missense_Mutation" ~ "Missense",
      `Mutation Type` == "Nonsense_Mutation" ~ "Nonsense",
      `Mutation Type` %in% c("Frame_Shift_Del", "Frame_Shift_Ins") ~ "Frameshift",
      `Mutation Type` %in% c("In_Frame_Del", "In_Frame_Ins") ~ "In-frame Indel",
      `Mutation Type` %in% c("Splice_Site", "Splice_Region") ~ "Splice-site",
      `Mutation Type` == "Nonstop_Mutation" ~ "Nonstop",
      TRUE ~ "Other"
    )
  )
mutation_type_summary <- tp53_categorized %>%
  count(Mutation_Category, name = "Mutation_Count") %>%
  arrange(desc(Mutation_Count))
mutation_type_summary

library(ggplot2)

ggplot(mutation_type_summary,
       aes(x = reorder(Mutation_Category, -Mutation_Count),
           y = Mutation_Count)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Distribution of TP53 Mutation Types in LUAD",
    x = "Mutation Type",
    y = "Number of TP53 Mutations"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(),
    plot.title = element_text()
  )
