#modulo operator

def evenodd(number):
    if number%2==0:
        print(number,' is even')
    elif number%2!=0:
        print(number,' is odd')
    else:
        print('enter valid input')
n=int(input('enter number:'))
evenodd(n)
