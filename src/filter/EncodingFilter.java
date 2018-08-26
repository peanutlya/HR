package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName="EncodingFilter",
		urlPatterns="/*",
		dispatcherTypes={DispatcherType.REQUEST,
				DispatcherType.INCLUDE,
				DispatcherType.FORWARD,
				DispatcherType.ERROR})
public class EncodingFilter implements Filter{
	//内部增强包装类
	class EnhanceRequest extends HttpServletRequestWrapper{

		private HttpServletRequest request;

		public EnhanceRequest(HttpServletRequest request) {
			super(request);
			this.request = request;
		}

		//对getParameter增强
		@Override
		public String getParameter(String name) {
			String parameter = request.getParameter(name);//乱码
			/*try {
				if(parameter!=null){
					parameter = new String(parameter.getBytes("iso8859-1"),"UTF-8");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}*/
			return parameter;
		}

	}


	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {

		req.setCharacterEncoding("utf-8");
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)resp;

		//判断方式
		String method = request.getMethod();
		if("GET".equalsIgnoreCase(method)){
			//System.out.println("get");
			EnhanceRequest enhanceRequest = new EnhanceRequest(request);
			chain.doFilter(enhanceRequest, response);
		}else if("POST".equalsIgnoreCase(method)){
			//System.out.println("post");
			chain.doFilter(request,response);
		}
	}

	@Override
	public void destroy() {
		
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("EncodingFilter类init方法");
	}

}


