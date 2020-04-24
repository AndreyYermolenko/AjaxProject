package com.yermolenko.dao.impl;

import com.yermolenko.dao.ConnectionPool;
import com.yermolenko.dao.StudentDAO;
import com.yermolenko.entities.Student;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Component
public class StudentDAOImpl implements StudentDAO {

    private final ConnectionPool connectionPool;

    public StudentDAOImpl(ConnectionPool connectionPool) {
        this.connectionPool = connectionPool;
    }

    @Override
    public List<Student> getSomeStudents(String partOfName) {
        Connection connection = connectionPool.getConnection();
        List<Student> list = new ArrayList<>();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(
                    "SELECT * FROM students WHERE name LIKE ?"
            );
            preparedStatement.setString(1, partOfName + "%");

            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt(1));
                student.setName(rs.getString(2));
                student.setScholarship(rs.getFloat(3));

                list.add(student);
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
