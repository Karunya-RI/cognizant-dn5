#floor division

def splitbill(ppl,bill):
    each=bill//ppl
    print('each person splits upto rupees ',each)

ppl=int(input('enter no of people:'))
bill=int(input('enter the bill amount in integer:'))
splitbill(ppl,bill)
