package com.aries;

import java.util.GregorianCalendar;

import static java.lang.System.*;
import static java.lang.Math.*;
import static java.util.Calendar.*;


public class Main {

    public static void main(String[] args) {

        Manager boss = new Manager("Carl", 80000, 1987, 12, 15);
        boss.setBonus(5000);

        Employee[] staff = new Employee[3];

        staff[0] = boss;
        staff[1] = new Employee("Tom", 50000, 1989, 10, 1);
        staff[2] = new Employee("Tony", 40000, 1990, 3, 15);

        for (Employee ele : staff) {
            out.println(ele.getName() + " " + ele.getSalary());
        }

    }
}
