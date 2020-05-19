#由於 [13其他] 只佔有0%，不具參考價值，所以將該列刪除
seg_le_pct <- seg_le_pct[seg_le_pct$產業別 != "13其他", ]
seg_me_pct <- seg_me_pct[seg_me_pct$產業別 != "13其他", ]
seg_se_pct <- seg_se_pct[seg_se_pct$產業別 != "13其他", ]
row_se_pct <- c("201704","11投資業","0%")
seg_se_pct <- rbind(seg_se_pct[1:394, ], row_se_pct, seg_se_pct[1:395, ])
loan_industry2014 <- loan_industry2014[loan_indutry2014$產業別 != "13其他", ]

#合併成單一資料
total_loan_seg_industry <- cbind("資料年月" = seg_tseotc_pct$資料年月, 
                                 "產業別" = seg_tseotc_pct$產業別,
                                 "上市櫃企業-企業授信金額產業別佔比" = seg_tseotc_pct$上市櫃企業.企業授信金額產業別佔比, 
                                 "大型企業-企業授信金額產業別佔比" = seg_le_pct$大型企業.企業授信金額產業別佔比, 
                                 "中型企業-企業授信金額產業別佔比" = seg_me_pct$中型企業.企業授信金額產業別佔比, 
                                 "小型企業-企業授信金額產業別佔比" = seg_se_pct$小型企業.企業授信金額產業別佔比, 
                                 "企業產業貸款總家數" = loan_industry2014$企業產業貸款總家數, 
                                 "企業產業貸款總金額(仟元)" = loan_industry2014$企業產業貸款總金額.仟元., 
                                 "企業產業貸款平均金額(仟元)" = loan_industry2014$企業產業貸款平均金額.仟元.)

#轉換資料型態(字元character轉乘數值numeric)
total_loan_seg_industry$`上市櫃企業-企業授信金額產業別佔比` <- str_replace_all(total_loan_seg_industry$`上市櫃企業-企業授信金額產業別佔比`, pattern="%", replacement = "")
total_loan_seg_industry$`上市櫃企業-企業授信金額產業別佔比` <- as.numeric(total_loan_seg_industry$`上市櫃企業-企業授信金額產業別佔比`)
total_loan_seg_industry$`上市櫃企業-企業授信金額產業別佔比` <- total_loan_seg_industry$`上市櫃企業-企業授信金額產業別佔比` * 0.01

total_loan_seg_industry$`大型企業-企業授信金額產業別佔比` <- str_replace_all(total_loan_seg_industry$`大型企業-企業授信金額產業別佔比`, pattern = "%", replacement = "")
total_loan_seg_industry$`大型企業-企業授信金額產業別佔比` <- as.numeric(total_loan_seg_industry$`大型企業-企業授信金額產業別佔比`)
total_loan_seg_industry$`大型企業-企業授信金額產業別佔比` <- total_loan_seg_industry$`大型企業-企業授信金額產業別佔比` * 0.01

total_loan_seg_industry$`中型企業-企業授信金額產業別佔比` <- str_replace_all(total_loan_seg_industry$`中型企業-企業授信金額產業別佔比`, pattern = "%", replacement = "")
total_loan_seg_industry$`中型企業-企業授信金額產業別佔比` <- as.numeric(total_loan_seg_industry$`中型企業-企業授信金額產業別佔比`)
total_loan_seg_industry$`中型企業-企業授信金額產業別佔比` <- total_loan_seg_industry$`中型企業-企業授信金額產業別佔比` * 0.01

total_loan_seg_industry$`小型企業-企業授信金額產業別佔比` <- str_replace_all(total_loan_seg_industry$`小型企業-企業授信金額產業別佔比`, pattern = "%", replacement = "")
total_loan_seg_industry$`小型企業-企業授信金額產業別佔比` <- as.numeric(total_loan_seg_industry$`小型企業-企業授信金額產業別佔比`)
total_loan_seg_industry$`小型企業-企業授信金額產業別佔比` <- total_loan_seg_industry$`小型企業-企業授信金額產業別佔比` * 0.01
