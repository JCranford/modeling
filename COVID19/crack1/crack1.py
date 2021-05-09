# Initial crack at an ABM for predicting vaccine strategies for COVID-19
import numpy as np
# import pandas as pd

# Objects:

class universe:
    def __init__(self, cName = "Untitled", nSize=1000):
        self.nSize = nSize
        self.cName = cName
        self.nDays = 0
        self.nAlive = self.nSize
        self.nDeaths = 0
        self.humans = []
        i = 0
        while i < self.nSize:
            h1 = human(i,0)
            self.humans.append(h1)
            i = i+1


    def dump(self):
        print(f"The name of the universe is: {self.cName}")
        print(f"The size of our current universe is: {self.nSize}")
        print(f"It has been running for {self.nDays} day(s).")
        print(f"There are currently {self.nAlive} individuals alive.")
        print(f"... and {self.nDeaths} deaths have occurred")
        
    def ageReport(self):
        print(f"Age analysis for universe: {self.cName}:")
        tmp=[0,0,0,0,0]
        for i in range(self.nSize):
            if self.humans[i].age == 1:
                tmp[0] = tmp[0] + 1
            elif self.humans[i].age == 2:
                tmp[1] = tmp[1] + 1
            elif self.humans[i].age == 3:
                tmp[2] = tmp[2] + 1
            elif self.humans[i].age == 4:
                tmp[3] = tmp[3] + 1
            else:
                tmp[4] = tmp[4] + 1
        print(f"Number age < 20: {tmp[0]}")
        print(f"Number age 20-39: {tmp[1]}")
        print(f"Number age 40-59: {tmp[2]}")
        print(f"Number age 60-79: {tmp[3]}")
        print(f"Number age  >80 yr: {tmp[4]}")
        
        
    def updateDeaths(self):
        tmp = 0
        for i in range(self.nSize):
            if self.humans[i].status == 0:
                tmp = tmp + 1
        self.nDeaths = tmp
        self.nAlive = self.nSize - self.nDeaths

    def ageOneDay(self):
        # for each member of the 'universe', do the update
        # reset the universe stats not
        self.nDays = self.nDays + 1
        self.updateDeaths()

class human:
    def __init__(self, ID, age = 0, cVaccine = "P" ):
        self.ID = ID
        if age == 0:
            tmp = np.random.randint(12)+1
            self.age=tmp
            if (tmp <= 2):
                self.age = 1
            elif (tmp > 2) and tmp <= (6):
                self.age = 2
            elif (tmp >6) and (tmp <= 9):
                self.age = 3
            elif (tmp > 9) and (tmp <= 11):
                self.age = 4
            else:
                self.age = 5
        self.status = 1   # 1=alive
        self.dayInf = 0   # Day infected
        self.dayDis = 0   # Day symptoms show
        self.dayRecovered = 0  # calc recovery or not - adjust other values
        self.dayDied = 0
        if cVaccine == "P":
            self.vaccine = vaccine()

class vaccine:
    def __init__(self, cType="P", ):
        if cType=="P":
            self.cName = "Pfizer"
            self.effectiveness = [0,10,20,40,60,80,85,85,70,60,50,45,40,35,30,25,20]
        elif cType=="M":
            self.cName = "Moderna"
            self.effectiveness = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
        else:
            self.cName = "AstraZeneca"
            self.effectiveness = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

# Test code ...
if __name__ == "__main__":
    print(f"This is some test code for agent based COVID-19 simulation ....")
    vacc1 = vaccine()
    uni1 = universe("TestUniverse",100000 )
    uni1.dump()
    uni1.ageOneDay()
    uni1.dump()
    uni1.ageReport()
    print(f"Done.")
