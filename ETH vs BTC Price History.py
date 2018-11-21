import matplotlib.pyplot as plt 
import fix_yahoo_finance as yf

# Downloads Yahoo Finance ETH-USD and BTC-USD Historical Data                 
ETH = yf.download("ETH-USD","2015-01-01","2019-01-01") 
ETH = ETH[["Close"]]  

BTC = yf.download("BTC-USD","2015-01-01","2019-01-01") 
BTC = BTC[["Close"]]

# Set Default Figure Size
plt.rcParams["figure.figsize"] = (10,5) 

plt.plot(ETH, label="ETH")
plt.plot(BTC, label="BTC")
plt.ylabel("Value in $")
plt.legend()
plt.show()      