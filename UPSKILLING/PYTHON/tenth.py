# age+1 numeric input

def fn(age):
    while True:
        print('next year you\'ll be ',age+1)
        choice=input('quit?yes/no')
        if choice.lower()=='yes':
            break
age=int(input('enter your age'))
if not isinstance(age,int):
    print('enter a valid age')
fn(age)
