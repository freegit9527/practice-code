package com.aries;

import java.text.DateFormatSymbols;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Main {

    public static void main(String[] args) {
        GregorianCalendar d = new GregorianCalendar();

        int currentDay = d.get(Calendar.DAY_OF_MONTH);
        int currentMonth = d.get(Calendar.MONTH);

        int firstDayOfWeek = d.getFirstDayOfWeek();

        GregorianCalendar firstDay = new GregorianCalendar();
        firstDay.set(Calendar.DAY_OF_MONTH, 1);
        int indentOfSpaces = firstDay.get(Calendar.DAY_OF_WEEK) - firstDayOfWeek;


        String[] weekdayNames = new DateFormatSymbols().getShortWeekdays();

        GregorianCalendar tmpDay = new GregorianCalendar();
        tmpDay.set(Calendar.DAY_OF_WEEK, firstDayOfWeek);

        do {
            int weekDay = tmpDay.get(Calendar.DAY_OF_WEEK);
            System.out.printf("%5s", weekdayNames[weekDay]);
            tmpDay.add(Calendar.DAY_OF_MONTH, 1);
        } while (firstDayOfWeek != tmpDay.get(Calendar.DAY_OF_WEEK));

        System.out.println();

        while (indentOfSpaces != 0) {
            System.out.printf("     ");
            --indentOfSpaces;
        }

        tmpDay.set(Calendar.DAY_OF_MONTH, 1);
        tmpDay.set(Calendar.MONTH, currentMonth);
        while (tmpDay.get(Calendar.MONTH) == currentMonth) {
            if (tmpDay.get(Calendar.DAY_OF_WEEK) == firstDayOfWeek) {
                System.out.println();
            }
            System.out.printf("%4d", tmpDay.get(Calendar.DAY_OF_MONTH));
            if (tmpDay.get(Calendar.DAY_OF_MONTH) == currentDay) {
                System.out.printf("*");
            } else {
                System.out.printf(" ");
            }
            tmpDay.add(Calendar.DAY_OF_MONTH, 1);
        }

        System.out.println();
    }
}
