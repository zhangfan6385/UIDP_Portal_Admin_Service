﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.UTILITY;
namespace STORE.ODS
{
    public class PlatDetailDB
    {
        DBTool db = new DBTool("");
        /// <summary>
        /// 查询公告附件信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable fetchPlatDetailList(Dictionary<string, object> d)
        {
            string sql = "select * from ts_store_platform_detail a ";
            sql += " where 1=1 and IS_DELETE=0 ";
            if (d.Count > 0)
            {
                if (d["PLAT_ID"] != null && d["PLAT_ID"].ToString() != "")
                {
                    sql += " and a.PLAT_ID = '" + d["PLAT_ID"].ToString() + "'";
                }
            }
            sql += " order by a.FILE_TYPE ";
            return db.GetDataTable(sql);
        }
        public string createPlatDetailArticle(Dictionary<string, object> d)
        {
            string col = "";
            string val = "";
            foreach (var v in d)
            {
                if (v.Value != null)
                {
                    col += "," + v.Key;
                    val += ",'" + v.Value + "'";
                }
                else
                {
                    col += "," + v.Key;
                    val += ",''";
                }
            }
            if (col != "")
            {
                col = col.Substring(1);
            }
            if (val != "")
            {
                val = val.Substring(1);
            }

            string sql = "INSERT INTO ts_store_platform_detail(" + col + ",CREATE_DATE,IS_DELETE) VALUES(" + val + ",'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0)";

            return db.ExecutByStringResult(sql);
        }

        public string updatePlatDetailArticle(string id)
        {
            string sql = "update ts_store_platform_detail set IS_DELETE=1 where PLAT_DETAIL_ID ='" + id + "'";

            return db.ExecutByStringResult(sql);
        }


    }
}