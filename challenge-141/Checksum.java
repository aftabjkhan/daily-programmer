import java.util.Scanner;
import java.util.LinkedList;
import java.util.Iterator;

public class Checksum {

	public static void main (String[] args){

		Scanner scanner = new Scanner(System.in);
		LinkedList<String> lineList = new LinkedList<String>();

		while (scanner.hasNext()){
			lineList.add(scanner.nextLine());
		}		

		Iterator<String> iterator = lineList.iterator();

		while (iterator.hasNext()) {
			printFletcherChecksum(iterator.next());
		}

	}

	/**
	 * Calculates the Fletcher-16 checksum of a String and prints the result to System.out
	 * @param data The String to analyze
	 */
	private static void printFletcherChecksum(String data){
		byte[] dataByteArray = data.getBytes();
		short checksum = fletcher16(dataByteArray, dataByteArray.length);
		String hexString = Integer.toHexString(checksum & 0xffff);
		System.out.println(hexString);
	}

	/**
	 * Implements the Fletcher-16 checksum algorithm
	 * @param data The byte array representation of the data
	 * @param length The length of the data byte array
	 */
	private static short fletcher16(byte[] data, int length){
		short sum1 = 0;
		short sum2 = 0;
		short modulus = 255;

		for (int i = 0; i < length; i++){
			sum1 = (short) ((sum1 + data[i]) % modulus);
			sum2 = (short) ((sum2 + sum1) % modulus);
		}
		return (short) ((sum2 << 8) | sum1);
	}
}