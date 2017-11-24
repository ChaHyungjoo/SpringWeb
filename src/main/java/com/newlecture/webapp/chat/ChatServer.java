package com.newlecture.webapp.chat;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value="/resource/chat-server")
public class ChatServer {
	
	//POJO: Plain Old Java Object
	
	@OnOpen
	public void onOpen() {
		System.out.println("누가 접속한거여??");
	}
	
	@OnMessage
	public void onTextMessage(Session session, String data) {
		System.out.println(data);
		
	}
	
	
}
