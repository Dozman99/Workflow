# secreteWord = 'man'
# guess = ''
# count=1
# limit=4
# while guess != secreteWord and count!=limit:
#     guess = input('talk agaaaaaaaaaain: ')
#     count+=1
# if count == limit:
#     print('out of tries')
# else:
#     print('you win')


# secreteWord="man"
# guess =""
# count=0
# limit=3
# outOfguess= False

# while guess!= secreteWord and not (outOfguess):
#     if count<limit:
#         guess = input('talk agaaaaaaaaaain: ')
#         count+=1
#     else:
#         outOfguess=True

# if outOfguess:
#     print('out of tries')
# else:
#     print('you win')


# num_list = [1,2,3,4]
# doubled_list = []
# # Create an empty list that will contain the    doubled numbers
# for number in num_list:   #Loop through all the numbers in the list
#      new_num = number*2   #for each number, double it(multiply by 2)
#      doubled_list.append(new_num) #append it to an empty list
# print(doubled_list)     # Print out the new list


# num1=int(input('the first number'))
# num2=int(input('the second number'))

# for i in range(num1, num2):
#     print(i)


# def translate(phrase):
#     translation_code = ""
#     for i in phrase:
#         if i in 'AEIOUaeiou':
#             print(translation_code + "1")
#             translation_code= translation_code + "g"
#             print(translation_code + "2")
#         else:
#             print(translation_code + "3")
#             translation_code=translation_code+i
#             print(translation_code+"4")

#     return translation_code

# print (translate(input('enter a phrase')))


# try:
#     answer = 10/0
#     number= int(input('enter a number: '))
#     print(number)
# # except:         too broad
# except ZeroDivisionError:
#     print('e cannot divide by zero')
# except ValueError as AvariableName:   #here we are storing the error as a virable
#     print(AvariableName)

# Question quiz
# from Question import Question


# question_prompts=[
#     "What color are apples?\n(a) Red/green\n(b) Purple\n(c) Orange\n\n",
#     "What color are banana?\n(a) Teal\n(b) Magenta\n(c) Yellow\n\n",
#     "What color are strawberries?\n(a) Yellow\n(b) Red\n(c) Blue\n\n",
# ]

# questions=[
#     Question(question_prompts[0], "a"),
#     Question(question_prompts[1], "c"),
#     Question(question_prompts[2], "b")
# ]


# def run_test(questions):
#     score=0
#     for Eachquestion in questions:
#         answer=input(Eachquestion.prompt)
#         if answer == Eachquestion.answer:
#             score += 1
#     print('you got '+ str(score) + '/' + str(len(questions))+ "correct")


# run_test(questions)




# class Student:
#     def __init__(self, name, age, grade) -> None:
#         self.name = name
#         self.age = age
#         self.grade = grade

#     def get_grade(self):  # this is done so that we can adjust the value of grade along the line
#         return self.grade


# class Course:
#     def __init__(self, name, max_students) -> None:
#         self.name = name
#         self.max_students = max_students
#         self.students = []

#     def add_students(self, student):
#         if len(self.students) < self.max_students:
#             self.students.append(student)
#             return True
#         return False

#     def get_average_grade(self):
#         value = 0
#         for student in self.students:
#             value == student.get_grade()  # note that this is calling from another class student
#         return value / len(self.students)


# s1 = Student("Tim", 19, 95)
# s2 = Student("Bill", 19, 75)
# s3 = Student("Jill", 19, 65)

# course = Course("Science", 2)
# course.add_students(s1)
# course.add_students(s2)




# inheritance


# class Pet:
#     def __init__(self,name,age):
#         self.age=age
#         self.name=name
#     def show(self):
#         print(f"I am {self.name}and I am {self.age} years old")
    
#     def speak(self):
#         print("I don't know what i say")

# class Cat(Pet):
#     def __init__(self, name, age, color):
#         super().__init__(name, age)
#         self.color = color

#     def speak(self):
#         print("Meow")

#     def show(self):
#         print(f"I am {self.name}and I am {self.age} years old and I am {self.color}")


# class Dog(Pet):
#     def speak(self):
#         print("Bark")




# class attribute

# this basically talks about things specifically to the class

# class Person:
#     number_of_people = 0 #defining this within a class makes the class portable

#     def __init__(self,name) -> None:
#         self.name = name
#         Person.number_of_people +=  1 #we can use this to keep track of the number of people


# p1=Person("tim")
# print(Person.number_of_people)
# p2=Person("dull")
# print(Person.number_of_people)

# BUT A BETTER WAY IS TO


# class Person:
#     number_of_people = 0 #defining this within a class makes the class portable

#     def __init__(self,name) -> None:
#         self.name = name
#         Person.add_person_function()

#     @classmethod
#     def number_of_people_function(cls):
#         return cls.number_of_people

#     @classmethod
#     def add_person_function(cls):

#         cls.number_of_people += 1

# p1=Person("tim")
# print(Person.number_of_people)
# p2=Person("dull")
# print(Person.number_of_people_function())



# using static methods
#  which it is just a bunch of function being organized within a function

class Math:
    @staticmethod
    def add5(x):
        return x + 5

    @staticmethod
    def add10(x):
        return x + 10
        
    @staticmethod
    def pr():
        print("run")

