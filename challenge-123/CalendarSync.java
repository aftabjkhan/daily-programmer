import java.util.Scanner;


public class CalendarSync {

	public static final double DAYS_PER_LUNAR_MONTH = 29.53059;
	public static final double DAYS_PER_JULIAN_YEAR = 365.25;

	public static void main (String[] args){
		Scanner scanner = new Scanner(System.in);
		String[] inputs = scanner.nextLine().split(", ");
		System.out.println(getSynchronizedDays(
			Integer.parseInt(inputs[0]), Integer.parseInt(inputs[1])));
	}

	private static int getSynchronizedDays (int julianYears, int lunarMonths){
		int julianDays = (int) Math.floor(julianYears * DAYS_PER_JULIAN_YEAR);
		int lunarDays = (int) Math.floor(lunarMonths * DAYS_PER_LUNAR_MONTH);
		return (julianDays == lunarDays) ? lunarDays : 0;
	}

}