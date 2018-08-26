package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebFilter(filterName="AutoLoginFilter",
		urlPatterns="/login.jsp",
		dispatcherTypes={DispatcherType.REQUEST,
				DispatcherType.INCLUDE,
				DispatcherType.FORWARD,
				DispatcherType.ERROR})
public class AutoLoginFilter implements Filter{

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		//获得cookie中用户名和密码 进行登录的操作
		//定义cookie_username
		String username = null;
		//定义cookie_password
		String password = null;
		//获得cookie
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie c : cookies){
				if("e_name".equals(c.getName())){
					username = c.getValue();
				}else if ("e_num".equals(c.getName())){
					password = c.getValue();
				}

				if(username != null && password!=null){
					response.sendRedirect(request.getContextPath()+"/loginServlet?e_name="+username+"&e_num="+password);
				}
			}

		}
		//放行
		chain.doFilter(request, response);
		
	}
	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void destroy() {
		
	}

	
	
}
