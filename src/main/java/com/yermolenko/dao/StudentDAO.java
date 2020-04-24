package com.yermolenko.dao;

import com.yermolenko.entities.Student;

import java.util.List;

public interface StudentDAO {

    List<Student> getSomeStudents(String partOfName);

}
