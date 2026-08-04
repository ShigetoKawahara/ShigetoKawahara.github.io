
## データを読み込みます。このコマンドを走らせてdorakue.csvファイルを選択。
x <- read.csv(file.choose())

## データを確認、Rにattach
head(x)
attach(x)

## 相関係数を計算
cor.test(level,mora,method="spearman")
cor.test(level,sum,method="spearman")

## 散布図をプロットする。

plot(jitter(level,0.3),jitter(sum,0.3),
     xlab="level", ylab="mora counts"
      )

## 回帰直線を計算
z1<-lm(mora~level)

## 回帰直線を図に書き込む
abline(z1)

