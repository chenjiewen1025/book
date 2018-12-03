package com.chatRobot.controller;

import com.chatRobot.model.Book;
import com.chatRobot.model.MyOrder;
import com.chatRobot.model.User;
import com.chatRobot.service.BookService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.Calendar;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
    @Resource
    private BookService bookService;

    @RequestMapping("/list.do")
    public ModelAndView selectAll(@RequestParam(value = "page",defaultValue = "1") int page,
    @RequestParam(value = "selectBookName",defaultValue = "") String selectBookName,
     @RequestParam(value = "selectActorName",defaultValue = "") String selectActorName ) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/tushujieyue");
        PageHelper.startPage(page, 2);
        List<Book> books = null;
            books = bookService.selectBook(selectBookName,selectActorName,page);
       PageInfo<Book> pageInfo = new PageInfo<Book>(books);
        long total = pageInfo.getTotal();  //总记录数
        int pages = pageInfo.getPages();  //总页数
        int pagesize = pageInfo.getPageSize();  //每页的展示条数
        mv.addObject("books",books);
        mv.addObject("total",total);
        mv.addObject("pages",pages);
        mv.addObject("pagesize",pagesize);
        mv.addObject("selectBookName",selectBookName);
        mv.addObject("selectActorName",selectActorName);
        mv.addObject("current",page);
       return mv;
    }

    @RequestMapping(value = "/borrow.do",produces="text/html;charset=UTF-8;")
    @ResponseBody
    public String borrow(@RequestParam(value = "bookid") String bookid, HttpSession session){
          int book_id = Integer.parseInt(bookid);
           User user = (User) session.getAttribute("user");
           int user_id = user.getUser_id();
           return bookService.borrow(book_id,user_id);

  }
}
