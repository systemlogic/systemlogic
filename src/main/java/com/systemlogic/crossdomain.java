package com.systemlogic;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

// Extend HttpServlet class
public class crossdomain extends HttpServlet {

	private String message;

	public void init() throws ServletException
	{
		// Do required initialization
		message = "Hello World";
	}

	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException
	{
		// Set response content type
		response.setContentType("text/html");

		// Actual logic goes here.
		PrintWriter out = response.getWriter();
		String result = "<?xml version='1.0'?>"
				+ "<!DOCTYPE cross-domain-policy SYSTEM '/xml/dtds/cross-domain-policy.dtd'>"
				+ "<cross-domain-policy>"
				+ "<site-control permitted-cross-domain-policies='all'/>"
				+ "<allow-access-from domain='*' to-ports='*' />"
				+ "<allow-http-request-headers-from domain='*' headers='*'/>"
				+ "</cross-domain-policy>";
		out.println(result);
	}

	public void destroy()
	{
		// do nothing.
	}
}