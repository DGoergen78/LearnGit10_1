#Import of a class
import random

#class for generating numbers
class Zahlengenerator :
    def NurGanzeZahlen() :
        return random.randint(0,100000000000000)
    
gen = Zahlengenerator()

#Output of class
print(gen.NurGanzeZahlen())