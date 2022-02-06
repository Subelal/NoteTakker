package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dbconnection.FactoryProvider;
import com.entities.Note;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		try{
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int noteId =Integer.parseInt(request.getParameter("noteId").trim());
			
			
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			
			Note n1 =(Note)s.get(Note.class, noteId);
			n1.setTitle(title);
			n1.setContent(content);
			n1.setAddedDate(new Date());
			
			s.save(n1);
			
			tx.commit();
			s.close();
			
			response.sendRedirect("all_notes.jsp");
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
	}

}
