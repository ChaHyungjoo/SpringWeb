package com.newlecture.aop;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class Program {

	public static void main(String[] args) {
		Calculator origin = new NewlecCalculator();
		
		//proxy를 생성해서 실제 주업무 로직을 위임
		Calculator cal = (Calculator) Proxy.newProxyInstance(
							NewlecCalculator.class.getClassLoader(), 
							new Class[] {Calculator.class}, 
							new InvocationHandler() {
								//h(handler) 자리에 보조업무를 실행할 클래스를 넣어줌
								@Override
								public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
									System.out.println("사전처리 보조업무");
									
									Object result = method.invoke(origin, args);
									
									return result;
								}
							});
		
		//int data = origin.add(3, 4);
		int data = cal.add(3, 4);	//proxy가 실제 calculator을 생성한 것 처럼 역할을 함
		
		System.out.println(data);

	}

}
