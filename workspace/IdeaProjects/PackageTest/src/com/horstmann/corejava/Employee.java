package com.horstmann.corejava;

import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Created by aries on 1/30/15.
 */
public class Employee {
    public Employee(String n, double s, int year, int month, int day)
    {
        name = n;
        salary = s;
        GregorianCalendar d = new GregorianCalendar(year, month - 1, day);
        hireDay = d.getTime();
    }
    
    public String getName()
    {
        return name;
    }

    public double getSalary()
    {
        return salary;
    }

    public Date getHireDay()
    {
        return hireDay;
    }

    public void raiseSalary(double percent)
    {
        double raise = percent * this.salary / 100.0;
        this.salary += raise;
    }

    private String name;
    private double salary;
    private Date hireDay;
}
