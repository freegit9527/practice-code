package com.aries;

import java.util.Date;
import java.util.GregorianCalendar;

import static java.lang.System.*;

public class PersonTest {

    public static void main(String[] args) {
        Person[] people = new Person[2];

        people[0] = new Employee("Harry", 50000, 1992, 11, 21);
        people[1] = new Student("snow", "computer science");

        for (Person p : people)
        {
            out.println(p.getName() + ", " + p.getDescription());
        }
    }
}

abstract class Person
{
    public Person(String n)
    {
        name = n;
    }

    public String getName()
    {
        return name;
    }

    public abstract String getDescription();

    private String name;
}

class Employee extends Person
{
    public Employee(String n, double s, int year, int month, int day)
    {
        super(n);
        salary = s;
        GregorianCalendar d = new GregorianCalendar(year, month - 1, day);
        hireDay = d.getTime();
    }

    public double getSalary()
    {
        return salary;
    }

    public Date getHireDay()
    {
        return hireDay;
    }

    public String getDescription()
    {
        return String.format("an employee with a salary of $%.2f", salary);
    }

    public void raiseSalary(double byPercent)
    {
        double raise = byPercent * salary / 100;
        salary += raise;
    }

    private double salary;
    private Date hireDay;
}

class Student extends Person
{
    public Student(String n, String m)
    {
        super(n);
        major = m;
    }

    public String getDescription()
    {
        return "a student majoring in " + major;
    }
    private String major;
}