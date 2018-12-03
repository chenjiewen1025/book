package com.chatRobot.controller;

import com.chatRobot.model.Book;
import com.chatRobot.model.Record;
import com.chatRobot.model.User;
import com.chatRobot.service.MyOrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/myOrder")
public class MyOrderController {
    @Resource
    private MyOrderService myOrderService;
 @RequestMapping("/showRecord.do")
    public ModelAndView selectRecord(HttpSession session,
    @RequestParam(value = "page",defaultValue = "1")int page,
 @RequestParam(value = "selectBookName",defaultValue = "") String selectBookName)

   {
       PageHelper.startPage(page, 2);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/jieyuejilu");
        User user = (User) session.getAttribute("user");
     List<Record> records = myOrderService.selectRecord(user.getUser_id(),page,selectBookName);
       PageInfo<Record> pageInfo = new PageInfo<Record>(records);
       long total = pageInfo.getTotal();  //总记录数
       int pages = pageInfo.getPages();  //总页数
       int pageSize = pageInfo.getPageSize();  //每页的展示条数
     mv.addObject("records",records);
       mv.addObject("total",total);
       mv.addObject("pages",pages);
       mv.addObject("pageSize",pageSize);
       mv.addObject("selectBookName",selectBookName);
       mv.addObject("current",page);
        return mv;
    }

}
