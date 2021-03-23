
package Filters;

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


public class AuthenticationFilter implements Filter {


    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //this code will execute before the servlet 
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        
        HttpSession session =  httpRequest.getSession();
        
        String email = (String) session.getAttribute("email");
        
        if(email == null){
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendRedirect("login");
            return;
        }
        chain.doFilter(request, response); //forward on to the next filter int he chian or the servlet if it is finihsed 
        
        //this code will execute after the servlet 
    }

    @Override
    public void destroy() {
        
    }
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    
}
