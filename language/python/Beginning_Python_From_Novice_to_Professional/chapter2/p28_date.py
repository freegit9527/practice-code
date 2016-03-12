#!/usr/bin/python

months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
        ]

endings = ['st', 'nd', 'rd'] + ['th'] * 17 + \
    ['st', 'nd', 'rd'] + ['th'] * 7 + ['st']

year  = raw_input("Year: ")
month = raw_input("Month (1-12): ")
day   = raw_input("Day (1-31): ")

month_num = int(month) - 1
day_num = int(day) - 1

month_name = months[month_num]
day_name = day + endings[day_num]

print month_name + ' ' + day_name + ', ' + year
