package com.hosp.controller;

import com.hosp.dao.CommonDao;
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
@RequestMapping("/common")
public class CommonController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private HttpServletRequest request; //自动注入request

    @Autowired
    private CommonDao commonDao;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(String uname, String upass, String tname, String sex, String age, String tel, String idcard) {
        String csql = "select * from t_user where uname='" + uname + "'";
        if (commonDao.select(csql).size() > 0) {
            request.setAttribute("no", "");
        } else {
            String sql = "insert into h_user (uname,upass,tname,sex,age,tel,isblack,delstatus,idcard) values('" + uname + "','" + upass + "','" + tname + "','" + sex + "','" + age + "','" + tel + "','no','0','" + idcard + "')";
            commonDao.commOper(sql);
            request.setAttribute("suc", "");
        }
        return "/jsp/reg";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(String uname, String upass) {
        HttpSession session = request.getSession();
        String sql = "select * from h_user where uname='" + uname + "' and upass='" + upass + "' and isblack='no' and delstatus='0'  ";
        List<HashMap> list = commonDao.select(sql);
        if (list.size() == 1) {
            session.setAttribute("user", list.get(0));
            request.setAttribute("suc", "");
        } else {
            request.setAttribute("no", "");
        }
        return "/index";
    }

    /**
     * 病人修改个人信息
     *
     * @param uname
     * @param oldupass
     * @param upass
     * @param tname
     * @param sex
     * @param age
     * @param tel
     * @param idcard
     * @return
     */
    @RequestMapping(value = "/updatePatient", method = RequestMethod.GET)
    public String updatePatient(String uname, String oldupass, String upass, String tname, String sex, String age, String tel, String idcard) {
        HashMap user = (HashMap) request.getSession().getAttribute("user");
        String csql = "select * from h_user where id='" + user.get("id") + "'";
        HashMap map = commonDao.select(csql).get(0);
        if (!oldupass.equals(map.get("upass"))) {
            request.setAttribute("no", "");
        } else {
            String sql = "update h_user set upass='" + upass + "',tname='" + tname + "',sex='" + sex + "',age='" + age + "',tel='" + tel + "',idcard='" + idcard + "' where id=" + user.get("id");
            commonDao.commOper(sql);
            request.setAttribute("suc", "");
        }
        return "/jsp/patient_info";
    }

    /**
     * 病人注销
     *
     * @return
     */
    @RequestMapping(value = "/logoutPatient", method = RequestMethod.GET)
    public String logoutPatient() {
        request.getSession().removeAttribute("user");
        return "/jsp/newscenter";
    }
}
