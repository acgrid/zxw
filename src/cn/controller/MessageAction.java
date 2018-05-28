package cn.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;

import cn.dao.GuanzhuDao;
import cn.dao.MessageDao;
import cn.entity.TGuanzhu;
import cn.entity.TMessage;
import cn.entity.TUser;
import cn.util.Const;
import cn.util.PageBean;

@Controller("messageAction")
public class MessageAction extends BaseAction {
	private Integer id;
	
	private TMessage message=new TMessage();
	
	private List<TMessage> list=new ArrayList<TMessage>();
	private PageBean pageBean=new PageBean();
	@Autowired
	@Qualifier("messageDao")
	private MessageDao messageDao;
	
	// 列表
	public String list() {
		request.setAttribute("uid", id);
		TUser u = (TUser) session.getAttribute("currentUser");
		//查询自己发送的消息和收到的消息
		String hql = "from TMessage u where u.myuser.id="+u.getId()+" or u.frienduser.id="+u.getId();
		list=messageDao.getByHql(hql);
		return "success";
	}
	public String detail() throws IOException{
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		TMessage message=messageDao.get(TMessage.class, id);		
		out.print(JSON.toJSONString(message));
		out.close();
		return null;
	}
	
	public String add() {
		message.setMsgtime(Const.getCurrentTime());
		messageDao.add(message);
		return "list";
	}
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TMessage getMessage() {
		return message;
	}

	public void setMessage(TMessage message) {
		this.message = message;
	}

	public List<TMessage> getList() {
		return list;
	}

	public void setList(List<TMessage> list) {
		this.list = list;
	}

	public MessageDao getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}
	


}
