package com.hosp.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.jdbc.support.rowset.SqlRowSetMetaData;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author ZhangHang
 * @create 2018-12-02 23:20
 **/

@Repository
public class CommonDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<HashMap> select(String sql) {
        List<HashMap> list = new ArrayList();
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);

        while (rowSet.next()) {
            SqlRowSetMetaData metaData = rowSet.getMetaData();
            HashMap map = new HashMap();
            for (int i = 0; i < metaData.getColumnCount(); i++) {
                if (!metaData.getColumnName(i).equals("ID")) {
                    map.put(metaData.getColumnName(i), rowSet.getString(i) == null ? "" : rowSet.getString(i));
                } else {

                    map.put("id", rowSet.getString(i));
                }
            }
            list.add(map);
        }

//            for (int i = 1; i <= columnCount; i++) {
//                
//                int i = metaData.getColumnCount();
//                for (int j = 1; j <= i; j++) {
//                    if (!metaData.getColumnName(j).equals("ID")) {
//
//                        map.put(metaData.getColumnName(j), rs.getString(j) == null ? "" : rs.getString(j));
//                    } else {
//
//                        map.put("id", rs.getString(j));
//                    }
//                }
//                list.add(map);
//            }
        return list;
    }
}
