package com.hosp.controller;

import com.hosp.dao.CommDAO;
import com.hosp.dao.CommonDao;
import com.hosp.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * @author ZhangHang
 * @create 2018-12-02 23:14
 **/
@Controller
public class CommonController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private HttpServletRequest request; //自动注入request

    @Autowired
    private CommonDao commonDao;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(String uname, String upass, String tname, String sex, String age, String tel, String idcard) {
        CommDAO dao = new CommDAO();
        String csql = "select * from br where uname='" + uname + "'";
        jdbcTemplate.execute(csql);
        if (dao.select(csql).size() > 0) {
            request.setAttribute("no", "");
        } else {
            String sql = "insert into br (uname,upass,tname,sex,age,tel,isblack,delstatus,idcard) values('" + uname + "','" + upass + "','" + tname + "','" + sex + "','" + age + "','" + tel + "','no','0','" + idcard + "')";
            dao.commOper(sql);
            request.setAttribute("suc", "");
        }
        return "reg";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(String uname, String upass) {
        HttpSession session = request.getSession();
        String sql = "select * from br where uname='" + uname + "' and upass='" + upass + "' and isblack='no' and delstatus='0'  ";
        List<HashMap> list = commonDao.select(sql);
        if (list.size() == 1) {
            session.setAttribute("user", list.get(0));
            request.setAttribute("suc", "");
        } else {
            request.setAttribute("no", "");
        }
        return "index";
    }
}
