import java.util.Scanner;
import java.util.LinkedList;
import java.util.Iterator;

public class Checksum {

	/**
	 * Calculates the Fletcher-16 checksum of Strings read via console
	 * input and prints the results to the console
	 */
	public static void main (String[] args){

		Scanner scanner = new Scanner(System.in);
		LinkedList<String> lineList = new LinkedList<String>();

		while (scanner.hasNext()){
			lineList.add(scanner.nextLine());
		}

		Iterator<String> iterator = lineList.iterator();

		while (iterator.hasNext()) {
			short checksum = fletcher16(iterator.next().getBytes());
			// Bitmask short to int
			System.out.println(Integer.toHexString(checksum & 0xffff));
		}
	}

	/**
	 * Calculates the Fletcher-16 checksum of a byte array
	 * @param data The byte array representation of the data
	 */
	private static short fletcher16(byte[] data){
		short sum1 = 0;
		short sum2 = 0;
		short modulus = 255;

		for (int i = 0; i < data.length; i++){
			sum1 = (short) ((sum1 + data[i]) % modulus);
			sum2 = (short) ((sum2 + sum1) % modulus);
		}
		return (short) ((sum2 << 8) | sum1);
	}
}