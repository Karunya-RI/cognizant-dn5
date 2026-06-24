#floating point salary calculation

def calculatesalary(salary,tax):
    net=salary-(salary*0.18/100)
    print(round(net,2))

salary=75000.5
tax=0.18
calculatesalary(salary,tax)
