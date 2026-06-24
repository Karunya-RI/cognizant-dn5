# variable multiple assignment

def multipleassignment(storage):
    #isinstance kw is used to check if it's dict
    if isinstance(storage,dict):
        for key,val in storage.items():
            print(f"{key}:{val}")

    else:
        for i in storage:
            print(i,end='\n')
multipleassignment([1,2,3,4,5])
print('list unpacking')
print('tuple unpacking')
multipleassignment((10,20,30,40,50))
print('dictionary unpacking')
multipleassignment({1:'a',2:'b',3:'c',4:'d'})
    
       
