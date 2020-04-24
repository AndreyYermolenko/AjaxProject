package com.yermolenko.dao;

import org.springframework.stereotype.Component;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

@Component
public class ConnectionPool {

    private String datasource;

    private DataSource ds;

    {
        try(InputStream in = ConnectionPool.class
                .getClassLoader().getResourceAsStream("application.properties")) {
            Properties properties = new Properties();
            properties.load(in);
            datasource = properties.getProperty("datasource.name");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    {
        Context context;
        try {
            context = new InitialContext();
            ds = (DataSource) context.lookup(datasource);
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection(){
        Connection connection = null;
        try {
            connection = ds.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}

