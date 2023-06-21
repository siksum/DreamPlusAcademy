def calculateTWAP() :
    prices = [1340, 1520, 1960, 1820, 686, 1177, 1612, 1368, 1803, 624, 1776, 1857, 1908, 926, 1915, 904, 1766, 567, 1709, 1269, 1361, 1982, 1925, 1779, 1034, 873, 715, 790, 954, 750]
    start = 0
    end = 30
    interval = 10
    twap = 0
    avg =[]

    numTicks = int(end / interval)
    i=0
  
    for j in range(0, numTicks):
        open = prices[j*10]
        close = prices[(j+1)*10-1]
        high= prices[0]
        low=prices[0]
        if j==0:
            for i in range(int(len(prices)/(end/interval))):
                if(prices[i]>=high):
                    high = prices[i]
                if(prices[i]<=low):
                    low = prices[i]
            
        else:
            for i in range(j*10, (j+1)*10-1):
                if(prices[i]>=high):
                    high = prices[i]
                if(prices[i]<=low):
                    low = prices[i]

        print("high: ", high)
        print("low: ", low)
        print("open", open)
        print("close", close)
        print(" ")
        avg.append(int((open+high+low+close)/4))
        
    #print(avg)
    twap = int(((avg[0]+avg[1])*interval)/(end-start))
    return twap

def main():
    twap = calculateTWAP()
    print("twap: ", twap)

if __name__ == '__main__':
    main()