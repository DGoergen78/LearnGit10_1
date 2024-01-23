
import random

class Zahlengenerator :
    def NurGanzeZahlen() :
        return random.randint(0,100000000000000)
    
gen = Zahlengenerator()

print(gen.NurGanzeZahlen())