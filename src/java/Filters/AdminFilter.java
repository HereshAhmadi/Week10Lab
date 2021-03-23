
package Filters;

import dataaccess.UserDB;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;


public class AdminFilter implements Filter {



    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //this code will execute before the servlet 
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        
        HttpSession session =  httpRequest.getSession();
        
        String email = (String) session.getAttribute("email");
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        
        if(user.getRole().getRoleId() != 1){
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendRedirect("notes");
            return;
        }
        chain.doFilter(request, response); //forward on to the next filter int he chian or the servlet if it is finihsed 
        
        //this code will execute after the servlet 
    }
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    
    @Override
    public void destroy() {
    }
    

    
}
