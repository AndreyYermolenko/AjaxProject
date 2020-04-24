package com.yermolenko.controller;

import com.yermolenko.dao.StudentDAO;
import com.yermolenko.entities.Student;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {

    private final StudentDAO studentDAO;

    public MainController(StudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }

    @GetMapping("/")
    public String view() {
        return "welcome";
    }

    @GetMapping("/index")
    public String index(@RequestParam(name = "val") String val,
                        HttpSession session) {
        List<Student> list = studentDAO.getSomeStudents(val);
        session.setAttribute("list", list);
        return "index";
    }
}
