package com.git.test.test;

import java.util.Scanner;

public class Calc {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("숫자를 입력하세요");
		int num1 = sc.nextInt();
		
		//진하 숫자 하나 더 받아서 더하기 출력하는 기능 만들기
		System.out.print("숫자를 하나더 입력하세요");
		int num21 = sc.nextInt();
		System.out.println(num1 + num21);
		
		//경현 숫자 하나 더 받아서 num1이랑 빼기 해서 출력하는 기능 만들기
		System.out.println("뺄 숫자 입력하시오");
		int num123 = sc.nextInt();
		System.out.println(num1 - num123);
		// 채화 숫자 하나 더 받아서 num1이랑 곱하기 해서 출력하는 기능 만들기
		System.out.print("숫자를 입력하세요");
		int num2 = sc.nextInt();
		System.out.println(num1*num2);
	}
}
