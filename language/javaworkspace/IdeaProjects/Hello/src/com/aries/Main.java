package com.aries;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Main {

    public static void main(String[] args) {

        GregorianCalendar birthday = new GregorianCalendar(1992, Calendar.NOVEMBER, 21, 23, 3, 0);


        int month = birthday.get(Calendar.MONTH) + 1;
        int year = birthday.get(Calendar.YEAR);
        int day = birthday.get(Calendar.DATE);
        int weekday = birthday.get(Calendar.DAY_OF_WEEK);

        System.out.println("I am birth in " + year + "/" + month + "/" + day +
            ". It is " + weekday);

        Date birth;
        birth = birthday.getTime();
        System.out.println("birth = " + birth);

        Date today = new Date();
        GregorianCalendar date = new GregorianCalendar();
        date.setTime(today);
        int     today_year = date.get(Calendar.YEAR),
                today_month = date.get(Calendar.MONTH),
                today_day = date.get(Calendar.DAY_OF_MONTH);
        System.out.println("today is " + today_year + "/" + today_month + 1 + "/"
            + today_day);

        GregorianCalendar other = new GregorianCalendar();
        other.set(Calendar.YEAR, 1994);
        other.set(Calendar.MONTH, Calendar.FEBRUARY);
        other.set(Calendar.DATE, 26);

        int other_month = other.get(Calendar.MONTH);
        System.out.println("other's birthday month is: " + other_month);

        System.out.printf("(%5s)==(%5s)\n", 3, 3000);

    }
}
