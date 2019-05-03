
package com.sjl.neer.utility;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NeerDate {
	public static String getCurrentTime() {
		return new SimpleDateFormat("hh:mm:ss").format(new java.util.Date());
	}

	public static String getConvertDate(String dateStr) throws ParseException {
		DateFormat srcDf = new SimpleDateFormat("MM/dd/yyyy");
		Date date = srcDf.parse(dateStr);
		DateFormat destDf = new SimpleDateFormat("yyyy-MM-dd");
		dateStr = destDf.format(date);
		return dateStr;
	}

	public static java.sql.Date getUtilToSql() throws Exception {
		return new java.sql.Date(new java.util.Date().getTime());
	}

	public static long calculateDays(java.util.Date startDate, java.util.Date lastDate) {
		return (startDate.getTime() - lastDate.getTime()) / (24 * 60 * 60 * 1000);
	}

	public static void main(String[] args) {
		try {
			System.out.println(getConvertDate("04/30/2018"));
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
