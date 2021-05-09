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
            h1 = human(i,4)
            self.humans.append(h1)
            i = i+1


    def dump(self):
        print("The name of the universe is: {self.")
        print(f"The size of our current universe is: {self.nSize}")
        print(f"It has been running for {self.nDays} day(s).")
        print(f"There are currently {self.nAlive} individuals alive.")
        print(f"... and {self.nDeaths} deaths have occurred")

    def ageOneDay(self):
        # for each member of the 'universe', do the update
        # reset the universe stats not
        self.nDays = self.nDays + 1

class human:
    def __init__(self, ID, age = 4 ):
        self.ID = ID
        self.status = 1   # 1=alive


# Test code ...
if __name__ == "__main__":
    print(f"This is some test code for agent based COVID-19 simulation ....")
    uni1 = universe(1000)
    uni1.dump()
    uni1.ageOneDay()
    uni1.dump()
print(f"Done.")
