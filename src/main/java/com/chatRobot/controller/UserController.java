package com.chatRobot.controller;

import com.chatRobot.model.User;
import com.chatRobot.service.UserService;
import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;
    @Autowired
    //验证码
    private Producer captchaProducer;

    //通过url转发
    @RequestMapping("/main.do")
    public String star(HttpServletRequest req) {
        String url = req.getParameter("url");
        return url;
    }
    //入口
    @RequestMapping("/go.do")
    public String go(HttpServletRequest req) {
        return "user/login";
    }
    //登录
    @RequestMapping("/login.do")
    public ModelAndView selectByPhone(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        ModelAndView mv = new ModelAndView();
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        User user = this.userService.selectUser(id);
        session.setAttribute("user", user);
        String vcode = (String) session.getAttribute("vcode");
        String code = request.getParameter("code");
        if (vcode.equals(code)) {
            if (user == null || !password.equals(user.getPassword())) {
                mv.setViewName("user/login");
                mv.addObject("mess", "密码错误！");
                return mv;
            } else {
                mv.setViewName("user/index");
                return mv;
            }
        }
        {
            mv.addObject("mess", "验证码错误！");
            return mv;
        }
    }

    //验证码生成
    @RequestMapping("/vcode.do")
    public void createVcode(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        /* 不让浏览器或中间缓存服务器缓存页面，配合Expires 置为0限定更保险 */
        response.setHeader("Pragma", "no-cache");
        /*
         * response.setContentType(MIME)的作用是使客户端浏览器区分不同类型的数据，
         * 并根据不同的MIME调用浏览器内部不同的程序嵌入模块来处理相应的数据
         */
        response.setContentType("image/jpeg");
        /* 生成验证码 */
        String capText = captchaProducer.createText();
        /* 保存验证码到Session中 */
        request.getSession().setAttribute("vcode", capText);
        /* 使用给定文字创建图片 */
        BufferedImage bi = captchaProducer.createImage(capText);
        /* 数据写入输出流 */
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
    }
    @RequestMapping("/password.do")
    @ResponseBody
    public boolean password(HttpSession session,
                            @RequestParam(value = "password",defaultValue = "") String password,
    @RequestParam(value = "sPassword",defaultValue = "") String sPassword){
        User user  = (User) session.getAttribute("user");
        if (!user.getPassword().equals(password))
        {
            return false;
        }
        else
       {
            userService.updatePassword(sPassword,user.getUser_id());
            return true;
       }

    }


}