package com.newlecture.webapp.chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value="/resource/chat-server")
public class ChatServer {
	
	//POJO: Plain Old Java Object
	
	// Map: key와 value로 이루어진 데이터 집합
	// List: 순서가 있는 데이터 집합(중복허용, 넣는 순서가 키가 됨)
	// Set: 순서가 없는 데이터 집합(중복X, 값과 키가 같음)
	private static Set<Session> sessionAll = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		sessionAll.add(session);
		//session.getBasicRemote();
		System.out.println("누가 접속한거여??");
	}
	
	@OnMessage
	public void onTextMessage(Session session, String data) throws IOException {
		
		for(Session s : sessionAll)
			s.getBasicRemote().sendText(data);
		
		System.out.println(sessionAll.size()+": "+data);
	}
	
	@OnClose
	public void onClose(Session session) throws IOException {
		sessionAll.remove(session);
		
		for(Session s : sessionAll)
			s.getBasicRemote().sendText("누군가 접속을 끊었습니다.");
	}
	
	
}
