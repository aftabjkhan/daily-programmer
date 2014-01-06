import java.util.Scanner;

/** 
 * A Class used for determining Julian/Lunar calendar synchronicity
 * @author Aftab Khan
 */
public class CalendarSync {

	public static final double DAYS_PER_LUNAR_MONTH = 29.53059;
	public static final double DAYS_PER_JULIAN_YEAR = 365.25;

	public static void main (String[] args){
		Scanner scanner = new Scanner(System.in);
		String results = "";
		while(scanner.hasNext()){
			String[] inputs = scanner.nextLine().split(", ");
			results += getSynchronizedDays(
				Integer.parseInt(inputs[0]), Integer.parseInt(inputs[1])) + "\n";
		}
		System.out.print(results);
	}

	/*
	 * Determines if a given number of Julian calendar years and lunar calendar 
	 * months occurs at the same time. 
	 * @param julianYears - the number of Julian calendar years
	 * @param lunarMonths - the number of Lunar calendar months
	 * @return If synchronized, returns the number of days that will have elapsed 
	 * until synchronization. If not synchronized, returns 0.
	 */
	private static int getSynchronizedDays (int julianYears, int lunarMonths){
		int julianDays = (int) Math.floor(julianYears * DAYS_PER_JULIAN_YEAR);
		int lunarDays = (int) Math.round(lunarMonths * DAYS_PER_LUNAR_MONTH);
		return (julianDays == lunarDays) ? lunarDays : 0;
	}

}