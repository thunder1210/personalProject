package com.onlineLearning.util;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

public class GeneratePasswordUtil {

	public static String getPassWordOne(int len) {

		int i;
		int count = 0;
		char[] str = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
				'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
				'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8',
				'9' };

		List<Character> bigStrList = Arrays.asList('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
				'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
		Set<Character> bigStrSet = new HashSet<>(bigStrList);

		List<Character> upperStrList = Arrays.asList('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
				'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z');
		Set<Character> upperStrSet = new HashSet<>(upperStrList);

		List<Character> numStrList = Arrays.asList('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
		
		Set<Character> numStrSet = new HashSet<>(numStrList);

		StringBuilder builder = new StringBuilder();
		Random r = new Random();
		boolean isContainBigChar = false;
		boolean isContainUpperChar = false;
		boolean isContainNumChar = false;

		while (count < len - 3) {
			i = r.nextInt(str.length);
			builder.append(str[i]);
			count++;
			if (!isContainBigChar && bigStrSet.contains(str[i])) {
				isContainBigChar = true;
			}
			if (!isContainUpperChar && upperStrSet.contains(str[i])) {
				isContainUpperChar = true;
			}
			if (!isContainNumChar && numStrSet.contains(str[i])) {
				isContainNumChar = true;
			}
		}
		if (!isContainBigChar) {
			builder.append(bigStrList.get(r.nextInt(bigStrList.size())));
		}
		if (!isContainUpperChar) {
			builder.append(upperStrList.get(r.nextInt(upperStrList.size())));
		}
		if (!isContainNumChar) {
			builder.append(numStrList.get(r.nextInt(numStrList.size())));
		}
		while (builder.length() < len) {
			builder.append(str[r.nextInt(str.length)]);
		}
		return builder.toString();
	}
}
