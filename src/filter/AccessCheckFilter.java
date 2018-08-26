package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName="AccessCheckFilter",
        urlPatterns={"/admin/*","/user/*"},
        dispatcherTypes={DispatcherType.REQUEST,
                DispatcherType.INCLUDE,
                DispatcherType.FORWARD,
                DispatcherType.ERROR})
public class AccessCheckFilter implements Filter {

    @Override
    public void destroy() {}

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)res;
        HttpSession session = request.getSession();
        Object o = session.getAttribute("employee") ;
        if(o == null){
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }else{
            chain.doFilter(req, res);
        }
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        System.out.println("AccessCheckFilter类init方法");
    }

}
