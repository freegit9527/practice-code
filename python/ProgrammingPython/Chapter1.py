__author__ = 'aries'

bob = ['Bob Smith', 42, 30000, 'software']
sue = ['Sue Jones', 45, 40000, 'hardware']
people = [bob, sue]
# pays = [person[2] for person in people]
pays = map((lambda x: x[2]), people)
pays = list(pays)
people.append(['Tom', 50, 0, None])
NAME, AGE, PAY = range(3)

bob = {'name': 'Bob Smith', 'age': 42, 'pay': 30000, 'job': 'dev'}
sue = {'name': 'Sue Jones', 'age': 45, 'pay': 40000, 'job': 'hdw'}
print(bob['name'], sue['pay'])