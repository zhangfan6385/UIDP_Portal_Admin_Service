using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.UTILITY;
namespace STORE.ODS
{
    public class ProjectDB
    {
        DBTool db = new DBTool("");
        /// <summary>
        /// 查询公告信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable fetchProjectList(Dictionary<string, object> d)
        {
            string sql = "select * from ts_store_project a ";
            sql += " where 1=1 and IS_DELETE=0 ";
            if (d.Count > 0)
            {
                if (d["PROJECT_CODE"] != null && d["PROJECT_CODE"].ToString() != "")
                {
                    sql += " and a.PROJECT_CODE like '%" + d["PROJECT_CODE"].ToString() + "%'";
                }
                if (d["PROJECT_NAME"] != null && d["PROJECT_NAME"].ToString() != "")
                {
                    sql += " and a.PROJECT_NAME like '%" + d["PROJECT_NAME"].ToString() + "%'";
                }
                if (d["PROJECT_PARTYA_ID"] != null && d["PROJECT_PARTYA_ID"].ToString() != "")
                {
                    sql += " and a.PROJECT_PARTYA_ID=" + d["PROJECT_PARTYA_ID"].ToString();
                }
                if (d["PROJECT_PARTYB_ID"] != null && d["PROJECT_PARTYB_ID"].ToString() != "")
                {
                    sql += " and a.PROJECT_PARTYB_ID=" + d["PROJECT_PARTYB_ID"].ToString();
                }
             
                if (d["BEGIN_PROJECT_SETDATE"] != null && d["BEGIN_PROJECT_SETDATE"].ToString() != "" && (d["END_PROJECT_SETDATE"] == null || d["END_PROJECT_SETDATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["BEGIN_PROJECT_SETDATE"].ToString());
                    sql += " and PROJECT_SETDATE > '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00'";
                    //sql += " and NOTICE_DATETIME between '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00' and '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";
                }
                else if (d["END_PROJECT_SETDATE"] != null && d["END_PROJECT_SETDATE"].ToString() != "" && (d["BEGIN_PROJECT_SETDATE"] == null || d["BEGIN_PROJECT_SETDATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["END_PROJECT_SETDATE"].ToString());
                    sql += " and PROJECT_SETDATE < '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";

                }
                else if (d["BEGIN_PROJECT_SETDATE"] != null && d["BEGIN_PROJECT_SETDATE"].ToString() != "" && d["END_PROJECT_SETDATE"] != null && d["END_PROJECT_SETDATE"].ToString() != "")
                {
                    DateTime bdate = Convert.ToDateTime(d["BEGIN_PROJECT_SETDATE"].ToString());
                    DateTime edate = Convert.ToDateTime(d["END_PROJECT_SETDATE"].ToString());
                    sql += " and PROJECT_SETDATE between '" + bdate.Year + "-" + bdate.Month + "-" + bdate.Day + " 00:00:00' and '" + edate.Year + "-" + edate.Month + "-" + edate.Day + " 23:59:59'";
                }
            }
            return db.GetDataTable(sql);
        }
        //public string createProjectArticle(Dictionary<string, object> d)
        //{
        //    string sql = "INSERT INTO ts_store_project(PROJECT_ID,PROJECT_CODE,PROJECT_NAME,PROJECT_PARTYA_ID,PROJECT_PARTYA_CODE,PROJECT_PARTYA_NAME,PROJECT_PARTYB_ID,PROJECT_PARTYB_CODE,CREATER,CREATE_DATE,IS_DELETE) VALUES(";
        //    sql += "'" + GetIsNullStr(d["NOTICE_ID"]) + "',";
        //    sql += "'" + GetIsNullStr(d["NOTICE_CODE"]) + "',";
        //    sql += "'" + GetIsNullStr(d["NOTICE_TITLE"]) + "',"; 
        //    sql += "'" + GetIsNullStr(d["NOTICE_CONTENT"]) + "',";
        //    sql += "'" + GetIsNullStr(d["NOTICE_DATETIME"]) + "',";
        //    sql += "'" + GetIsNullStr(d["NOTICE_ORGID"]) + "',";
        //    sql += "'" + GetIsNullStr(d["NOTICE_ORGNAME"]) + "',";
        //    sql += "'" + GetIsNullStr(d["CREATER"]) + "',";
        //    sql += "'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0 )";
        //    //sql += "'" + GetIsNullStr(d["REMARK"]) + "')";
        //    return db.ExecutByStringResult(sql);
        //}


        public string createProjectArticle(Dictionary<string, object> d)
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
                    val += ",null";
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

            string sql = "INSERT INTO ts_store_project(" + col + ",CREATE_DATE,IS_DELETE) VALUES(" + val + ",'"+ DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0)";

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

        public string updateProjectData(Dictionary<string, object> d)
        {
            string col = "";

            foreach (var v in d)
            {
                if (v.Value == null)
                {
                    col += "," + v.Key + "=''";
                }
                else
                {
                    col += "," + v.Key + "='" + v.Value.ToString() + "'";
                }


            }
            if (col != "")
            {
                col = col.Substring(1);
            }

            string sql = "update  ts_store_project set " + col + " where PROJECT_ID='" + d["PROJECT_ID"].ToString() + "'";

            return db.ExecutByStringResult(sql);
        }

        public string updateProjectArticle(string id)
        {
            string sql = "update ts_store_project set IS_DELETE=1 where PROJECT_ID ='" + id + "'";

            return db.ExecutByStringResult(sql);
        }

      

    }
}