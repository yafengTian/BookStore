package com.experiment.filter;/*
 *Experiment
 *@author yafeng
 *2018-4-17
 *上午8:59
 */

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EncodeFilter implements Filter {
    String encoding;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        encoding=filterConfig.getInitParameter("encoding");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
    //强制类型转换
        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse response=(HttpServletResponse)servletResponse;
        //进行编码
        request.setCharacterEncoding(encoding);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding(encoding);
        //设置浏览球页面不用缓存
        response.setHeader("pragma","no-cache");
        response.setHeader("cache-control","no-cache");
        response.setDateHeader("expires",0);
        //执行该方法,允许请求目标资源
        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
