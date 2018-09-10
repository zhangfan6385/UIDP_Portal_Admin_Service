using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.UTILITY;
namespace STORE.ODS
{
    public class StoreLogDB
    {
        DBTool db = new DBTool("");
        /// <summary>
        /// 查询资源库日志信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable fetchStoreLogList(Dictionary<string, object> d)
        {
            string sql = "select * from ts_store_log a ";
            if (d.Count > 0)
            {
                if (d["IP_ADDR"] != null && d["IP_ADDR"].ToString() != "")
                {
                    sql += " and a.IP_ADDR like '%" + d["IP_ADDR"].ToString() + "%'";
                }
                if (d["RESOURCE_NAME"] != null && d["RESOURCE_NAME"].ToString() != "")
                {
                    sql += " and a.RESOURCE_NAME like '%" + d["RESOURCE_NAME"].ToString() + "%'";
                }
                if (d["LOG_CONTENT"] != null && d["LOG_CONTENT"].ToString() != "")
                {
                    sql += " and a.LOG_CONTENT like '%" + d["LOG_CONTENT"].ToString() + "%'";
                }
                if (d["BEGIN_ACCESS_TIME"] != null && d["BEGIN_ACCESS_TIME"].ToString() != "" && (d["END_ACCESS_TIME"] == null || d["END_ACCESS_TIME"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["BEGIN_ACCESS_TIME"].ToString());
                    sql += " and ACCESS_TIME > '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00'";
                    //sql += " and NOTICE_DATETIME between '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00' and '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";
                }
                else if (d["END_ACCESS_TIME"] != null && d["END_ACCESS_TIME"].ToString() != "" && (d["BEGIN_ACCESS_TIME"] == null || d["BEGIN_ACCESS_TIME"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["END_NOTICE_DATETIME"].ToString());
                    sql += " and ACCESS_TIME < '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";

                }
                else if (d["BEGIN_ACCESS_TIME"] != null && d["BEGIN_ACCESS_TIME"].ToString() != "" && d["END_ACCESS_TIME"] != null && d["END_ACCESS_TIME"].ToString() != "")
                {
                    DateTime bdate = Convert.ToDateTime(d["BEGIN_ACCESS_TIME"].ToString());
                    DateTime edate = Convert.ToDateTime(d["END_ACCESS_TIME"].ToString());
                    sql += " and ACCESS_TIME between '" + bdate.Year + "-" + bdate.Month + "-" + bdate.Day + " 00:00:00' and '" + edate.Year + "-" + edate.Month + "-" + edate.Day + " 23:59:59'";
                }
            }
            return db.GetDataTable(sql);
        }
        public string createStoreLogArticle(Dictionary<string, object> d)
        {
            string sql = "INSERT INTO ts_store_log(STORE_LOG_ID,ACCESS_TIME,IP_ADDR,INVOKE_TYPE,RESOURCE_ID,LOG_CONTENT,RESOURCE_NAME,REMARK) VALUES(";
            sql += "'" + GetIsNullStr(d["STORE_LOG_ID"]) + "',";
            sql += "'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',";
            sql += "'" + GetIsNullStr(d["IP_ADDR"]) + "',"; 
            sql += GetIsNullStr(d["INVOKE_TYPE"]) + ",";
            sql += "'" + GetIsNullStr(d["RESOURCE_ID"]) + "',";
            sql += "'" + GetIsNullStr(d["LOG_CONTENT"]) + "',";
            sql += "'" + GetIsNullStr(d["RESOURCE_NAME"]) + "',";
            sql += "'" + GetIsNullStr(d["REMARK"]) + "')";
            return db.ExecutByStringResult(sql);
        }
        public string GetIsNullStr(object obj)
        {
            if (obj == null)
            {
                return "";
            }
            else
            {
                return obj.ToString();
            }
        }

    }
}