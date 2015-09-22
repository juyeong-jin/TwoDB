package com.webapp;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Servlet implementation class DBInit
 */
public class DBInit extends HttpServlet {
   private static final long serialVersionUID = 1L;
    
   static Log log = LogFactory.getLog(DBInit.class);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBInit() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
       log.info("#########");
       log.info("DBinit...");
       log.info("#########");
       String classNames = config.getInitParameter("classNames");
       log.info("classNames = " + classNames);
       StringTokenizer tokens = new StringTokenizer(classNames);
       while(tokens.hasMoreTokens()) {
          String className = tokens.nextToken();
          log.info("className = [" + className + "]");
          try {
            Class.forName(className);
         } catch (ClassNotFoundException e) {
            log.info(className, e);
         }
       }
       
    }

}