#basic input

def getinput():
    while True:
        name=input('enter name:')
        if name=='' or name.isdigit() or not name.isalpha():
            print('invalid input for name')
        else:
            print('hello ',name,'!')
        choice=input('quit? yes/no')
        if choice.lower()=='yes':
            break
getinput()
