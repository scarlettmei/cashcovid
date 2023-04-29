# Export results
library(tidyverse)
library(fixest)
library(kableExtra)
m1 = feols(roe_recurring_income ~ cash_ratio_l1 + log_at_l1 + log_bm_l1 + lev_l1 + sgr_l1 + saleturnover_l1 + xrd_at_l1 +
             boardsize_l1 + ind_ratio_l1 + foreign_ratio_l1 + dir_own_l1 |tej_industry_id + yyyy, ProfitCovid, vcov="hetero")
m2 = feols(roe_recurring_income ~ cash_ratio_l1 + log_at_l1 + log_bm_l1 + lev_l1 + sgr_l1 + saleturnover_l1 + xrd_at_l1 +
             boardsize_l1 + ind_ratio_l1 + foreign_ratio_l1 + dir_own_l1|tej_industry_id + yyyy, ProfitCovid, vcov=~tej_industry_id)
m3 = feols(roe_recurring_income ~ cash_ratio_l1 + log_at_l1 + log_bm_l1 + lev_l1 + sgr_l1 + saleturnover_l1 + xrd_at_l1 +
             boardsize_l1 + ind_ratio_l1 + foreign_ratio_l1 + dir_own_l1|tej_industry_id + yyyy, ProfitCovid, vcov=~co_id)

m4 = feols(return_on_assets_ratio_b_recurring_income_before_interes ~ cash_ratio_l1 + log_at_l1 + log_bm_l1 + lev_l1 + sgr_l1 + saleturnover_l1 + xrd_at_l1 +
             boardsize_l1 + ind_ratio_l1 + foreign_ratio_l1 + dir_own_l1 |tej_industry_id + yyyy, ProfitCovid, vcov="hetero")
m5 = feols(return_on_assets_ratio_b_recurring_income_before_interes ~ cash_ratio_l1 + log_at_l1 + log_bm_l1 + lev_l1 + sgr_l1 + saleturnover_l1 + xrd_at_l1 +
             boardsize_l1 + ind_ratio_l1 + foreign_ratio_l1 + dir_own_l1|tej_industry_id + yyyy, ProfitCovid, vcov=~tej_industry_id)
m6 = feols(return_on_assets_ratio_b_recurring_income_before_interes ~ cash_ratio_l1 + log_at_l1 + log_bm_l1 + lev_l1 + sgr_l1 + saleturnover_l1 + xrd_at_l1 +
             boardsize_l1 + ind_ratio_l1 + foreign_ratio_l1 + dir_own_l1|tej_industry_id + yyyy, ProfitCovid, vcov=~co_id)

m7 = feols(roe_recurring_income ~ cash_ratio_l1 + log_at_l1 + log_bm_l1 + lev_l1 + sgr_l1 + saleturnover_l1 + xrd_at_l1 +
             boardsize_l1 + ind_ratio_l1 + foreign_ratio_l1 + dir_own_l1|tej_industry_id + yyyy, ProfitCovid_w, vcov=~co_id)
m8 = feols(return_on_assets_ratio_b_recurring_income_before_interes ~ cash_ratio_l1 + log_at_l1 + log_bm_l1 + lev_l1 + sgr_l1 + saleturnover_l1 + xrd_at_l1 +
             boardsize_l1 + ind_ratio_l1 + foreign_ratio_l1 + dir_own_l1|tej_industry_id + yyyy, ProfitCovid_w, vcov=~co_id)


etable(m1, m2, m3, 
       m4, m5, m6, 
       m7, m8,
       coefstat = "tstat", se.below = TRUE) %>% 
  kbl(.) %>%
  kable_classic()
