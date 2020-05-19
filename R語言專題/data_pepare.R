#讀入企業貸款中「產業類」的資料
loan_industry <- read.csv("C:/Users/lol/Desktop/R/R-project/corporate_loan_industry.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
loan_indutry2014 <- loan_industry[352:1053, ] #存放201408-201901的資料

#讀入企業貸款中「貸款規模類」的資料
loan_scale <- read.csv("C:/Users/lol/Desktop/R/R-project/corporate_loan_scale.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
loan_scale2014 <- loan_scale[109:324, ] #存放201408-201901的資料

#讀入企業貸款中「大型企業之產業授信金額占比」的資料
seg_le_pct <- read.csv("C:/Users/lol/Desktop/R/R-project/seg_le_pct.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
#讀入企業貸款中「中型企業之產業授信金額占比」的資料
seg_me_pct <- read.csv("C:/Users/lol/Desktop/R/R-project/seg_me_pct.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
#讀入企業貸款中「小型企業之產業授信金額占比」的資料
seg_se_pct <- read.csv("C:/Users/lol/Desktop/R/R-project/seg_se_pct.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
#讀入企業貸款中「企業授信金額規模別佔比」的資料
seg_scale_pct <- read.csv("C:/Users/lol/Desktop/R/R-project/seg_scale_pct.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
#讀入企業貸款中「上市櫃企業-企業授信金額產業別佔比」的資料
seg_tseotc_pct <- read.csv("C:/Users/lol/Desktop/R/R-project/seg_tseotc_pct.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
