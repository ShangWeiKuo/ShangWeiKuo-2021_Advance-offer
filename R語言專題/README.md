# 107-2-進階R資料分析與應用
## 以時間序列模型預測企業未來的貸款金額
###### 資料來源: https://www.jcic.org.tw/main_ch/download_page.aspx?uid=213&pid=213 (財團法人金融聯合徵信中心-OpenData專區-企業授信統計資訊: 1-5企業產業別貸款狀況統計趨勢資料) 
<br>

## 專題介紹
#### 一、	議題背景
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;企業貸款是銀行不可或缺的收入來源之一，而如何<b>藉由歷史資料客觀地預測未來貸款趨勢</b>乃銀行當前所關注的需求，因此本組將著重於<b>時間序列的建模，以期能觀察並分析產業別的貸款金額走向</b>。

#### 二、	資料欄位與檢視
<p align="center">
  <kbd><img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/%E5%BB%BA%E6%A8%A1%E7%94%A8%E8%B3%87%E6%96%99%E9%9B%86.png"></kbd>
  <br>
   圖 1		建模用資料集
</p>

#### 三、	欲探討之問題
<ul>
  <li>各產業別的貸款金額變化趨勢。</li>
  <li>找尋具有明顯起伏變化的產業。</li>
  <li>預測貸款金額高成長產業的貸款走向。</li>
</ul>
<br>

## 時間序列模型之製作過程
#### 一、	企業產業別貸款總金額變化圖(2013-2018)
1.	引入ggplot2與useful套件，並將上述資料集中的「企業產業別貸款總金額」以折線圖方式呈現，觀察各產業別2013-2018年借貸金額的變化趨勢。
<p align="center">
  <kbd>
    <img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/折線圖程式碼.png" width="800px">
  </kbd>
  <br>
   圖 2		折線圖程式碼
</p>
<br>

2.	從該折線圖上可看出金融保險業的借貸金額自2015年開始急遽陡升，因此我們將以「金融保險業」的相關資料製作時間序列模型。
<p align="center">
  <kbd>
    <img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/各產業別2013-2018的貸款金額變化折線圖.png" width="800px">
  </kbd>
  <br>
   圖 3		各產業別2013-2018的貸款金額變化折線圖
</p>
<br>

3.	抽取「金融保險業」的資料，並製作成時間序列圖。
<p align="center">
  <kbd>
    <img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/時間序列圖程式碼.png" width="800px">
  </kbd>
  <br>
   圖 4		時間序列圖程式碼
</p>
<br>

4.	從時間序列圖來看，金融保險業的借貸金額呈現正成長的趨勢，因此我們將預測該產業未來的借貸情形是否為穩定正成長。
<p align="center">
  <kbd>
    <img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/金融保險業貸款金額時間序列圖.png" width="800px">
  </kbd>
  <br>
   圖 5		金融保險業貸款金額時間序列圖
</p>
<br>

#### 二、	分析資料的時間序列是否可建模
1.	利用ACF和PACF圖來了解該資料的時間序列是否具準確性。
<p align="center">
  <kbd>
    <img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/PAC與PACF圖程式碼.png" width="650px">
  </kbd>
  <br>
   圖 6		PAC與PACF圖程式碼
</p>
<br>

2.	製作ARIMA模型，矯正出最佳的可預測模型。
<p align="center">
  <kbd>
    <img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/ARIMA模型、殘差ACF與PACF圖.png" width="650px">
  </kbd>
  <br>
   圖 7		ARIMA模型、殘差ACF與PACF圖
</p>
<br>

3.	一般情況與ARIMA模型的ACF、PACF之比較，可以看出右邊的ACF和PACF圖有呈現白噪音的特性，表示該模型是好的。

|一般情況|ARIMA模型|
|---|---|
|<p align="center"><kbd><img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/ACF圖.png" width="400px"></kbd><br>ACF圖</p>|<p align="center"><kbd><img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/PACF圖.png" width="400px"></kbd><br>PACF圖</p>|
|<p align="center"><kbd><img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/ARIMA模型的ACF圖.png" width="400px"></kbd><br>ARIMA模型的ACF圖</p>|<p align="center"><kbd><img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/ARIMA模型的PACF圖.png" width="400px"></kbd><br>ARIMA模型的PACF圖</p>|
<br>

#### 三、	建立預測模型
1.	利用predict函數預測金融保險業未來5年的貸款金額，並利用forecast函數將ARIMA模型結果轉換成圖表。
<p align="center">
  <kbd>
    <img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/predict函數與forecast函數程式.png" width="650px">
  </kbd>
  <br>
   圖 8		predict函數與forecast函數程式
</p>
<br>

2.	從predict函數與圖形結果來看，金融保險業未來的貸款金額呈現零成長且不穩定的狀態。
<p align="center">
  <kbd>
    <img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/predict函數之未來5年結果.png" width="650px">
  </kbd>
  <br>
   圖 9		predict函數之未來5年結果
</p>
<br>
<p align="center">
  <kbd>
    <img src="https://github.com/Vivian19970428/R-project/blob/master/Picture/未來5年的時間序列估計圖.png" width="800px">
  </kbd>
  <br>
   圖 10		未來5年的時間序列估計圖
</p>
<br>

## 結論與心得
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以本專案為例，如果只看過去的歷史資料的話，很容易會認為增長率越高的產業如金融業，未來有很大的機率會繼續增長，然而經過後續的預測分析後，可得知<b>金融業貸款額度並不會穩定增長，且極有可能大幅下降</b>，因此銀行在<b>進行貸款業務時，不宜過於專注在金融服務業上</b>。
