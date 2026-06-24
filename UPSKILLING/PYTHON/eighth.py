#min max function
def minmax():
    
    n=int(input('enter no of ppl'))
    lst=[]
    for i in range(n):
        sal=int(input('enter salary of ppl:'))
        lst.append(sal)
    print('the maxinimum salary is',max(lst))
    print('the minimum salary is',min(lst))

minmax()
