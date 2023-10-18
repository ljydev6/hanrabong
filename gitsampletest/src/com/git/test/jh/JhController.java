package com.git.test.jh;

import java.util.Scanner;

public class JhController {
	Scanner sc = new Scanner(System.in);
	public static void main(String[] args) {
		System.out.println("JH 컨트롤러입니다.");
		JhController jh = new JhController();
		jh.msg();
	}
	public void msg() {
		System.out.print("이름을 입력해주세요 : ");
		String name = sc.nextLine();
		
		System.out.println(name + "님 반갑습니다 :)");
	}
}
