

mytuple= ("max",) # note that there must always be a comma
mytuple= (["max", 26,"boston"]) 

if "max" in mytuple:
    print("yes")
else:
    print("no")

# how to slice tuple
a =(1,2,3,4,5,6,78,9,)
b = a[2:5]
c = a[::2]
print(b)
print(c)

mytuple= "max", 26,"boston", "Nigerian", "final"

size, age, location, country, status=mytuple
print(size)
print(age)
print(location)
print(country)

# assuming we have too many things to Unpack

size, age, *theRest,status=mytuple
print(size)
print(age)
print(theRest) #this then turns to a list
print(status)



# DICTIONARY
my_dict={"name": "max","age":28, "city":"new york"}
print(my_dict)

my_dict2=dict(name="mary", age=27, city="boston")
print(my_dict2)


# to add a key then a value to the dictionary
my_dict["email"]="max@xyz.com"
print(my_dict)
# we can also do 
print(my_dict['age'])

# to remove a key value pair
my_dict.popitem()
print(my_dict)

# you can loop over either key or Value
for i in my_dict.keys():
    print(i)



# to copy dictionaries for it to be on its own
my_dict_cpy= dict(my_dict)
#so independently my dict is on its own

# to merge two dict or to update it
my_dict.update(my_dict2)


# SET
# a set is unordered, mutable , no duplicate
myset={1,2,3,4}
myset=set() #this is denoted as an emptyset and not myset={}

myset.add(1)
myset.add(2)
myset.remove(1)
myset.discard(2) #this is better as it will not throw in an error
myset.clear ()

set1= {1,2,3,4,5,6,7,8}
set2= {3,5,7,9,11,13}

u = set1.union(set2)
print(u)

i= set1.intersection(set2)
print(i)

diff = set1.difference(set2) # meaning output what is not in set2 but in set1
print(diff)
diff = set2.difference(set1) # meaning output what is not in set1 but in set2
print(diff)

diff = set1.symmetric_difference(set2) # meaning we take all the element in both sets except the ones that are common between both
print(diff)

set1.difference_update(set2) #this to remove the common difference between set and then update it

set1.symmetric_difference_update(set2) 




# STRING
my_string= '      hello world      ' #this removes white spaces in a string
my_string= my_string.strip()
print(my_string)

print(my_string.startswith('hello'))  # to check what is starts with
print(my_string.replace('world', 'universe'))

my_string='How are you'

my_list= my_string.split(" ") #this splits by a space
print(my_list)

new_string = ','.join(my_list) #this is to join the elements in a list with a ',' for it to be one list
print(new_string)

my_list = ['a','a','a','a','a',]
print(my_list)

from timeit import default_timer as timer 
#bad
start=timer()
my_string=""
for i in my_list:
    my_string+=i
stop=timer()

print(stop-start)
print(my_string)

#good
start=timer()
my_string = ''.join(my_list)
stop=timer()
print(stop-start)
print(my_string)


# LAMBDA FUNCTION (a quick function)

add10 = lambda x: x+10
print(add10(5))

# this is the same as 
def add10_func(x):
    return x+10

mult= lambda x,y: x+y
print(mult(2,7))

# sorted(iterable, key=key, reverse=reverse) 

points = [(1,2),(15,1),(5,-1),(1,4)]
points_sorted = sorted(points, key=lambda x:x[1]) # note that the key takes in a function, inbuilt or not inbuilt function
points_sorted = sorted(points, key=lambda x: x[0] + x[1])

print(points)
print(points_sorted)


a =[1,2,3,4,5,6]
# slower
start=timer()
b= map(lambda x: x*2,a)
print(list(b))
stop=timer()
print(stop-start)

# faster
start=timer()
c =[x*2 for x in a]
print(c)
stop=timer()
print(stop-start)


start=timer()
b= filter(lambda x: x%2,a)
print(list(b))
stop=timer()
print(stop-start)


start=timer()
c =[x%2 for x in a]
print(c)
stop=timer()
print(stop-start)

