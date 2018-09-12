using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using STORE.UTILITY;
namespace STORE.ODS
{
    public class PlatDB
    {
        DBTool db = new DBTool("");
        /// <summary>
        /// 查询公告信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable fetchPlatformList(Dictionary<string, object> d)
        {
            string sql = @"select a.*,b.ORG_CODE from ts_store_platform a 
                        LEFT JOIN ts_uidp_org b on a.MANAGE_ORG_ID = b.ORG_ID";
            sql += " where 1=1 and a.IS_DELETE=0 ";
            if (d.Count > 0)
            {
                if (d["PLAT_TYPE"] != null && d["PLAT_TYPE"].ToString() != "")
                {
                    sql += " and a.PLAT_TYPE =" + d["PLAT_TYPE"].ToString();
                }
                if (d["PLAT_CODE"] != null && d["PLAT_CODE"].ToString() != "")
                {
                    sql += " and a.PLAT_CODE like '%" + d["PLAT_CODE"].ToString() + "%'";
                }
                if (d["MANAGE_ORG_CODE"] != null && d["MANAGE_ORG_CODE"].ToString() != "")
                {
                    sql += " and b.ORG_CODE like '" + d["MANAGE_ORG_CODE"].ToString() + "%'";
                }
                if (d["PLAT_NAME"] != null && d["PLAT_NAME"].ToString() != "")
                {
                    sql += " and a.PLAT_NAME like '%" + d["PLAT_NAME"].ToString() + "%'";
                }
                if (d["BEGIN_PLAT_PUBLISHDATE"] != null && d["BEGIN_PLAT_PUBLISHDATE"].ToString() != "" && (d["END_PLAT_PUBLISHDATE"] == null || d["END_PLAT_PUBLISHDATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["BEGIN_PROJECT_SETDATE"].ToString());
                    sql += " and PLAT_PUBLISHDATE > '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00'";
                    //sql += " and NOTICE_DATETIME between '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00' and '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";
                }
                else if (d["END_PLAT_PUBLISHDATE"] != null && d["END_PLAT_PUBLISHDATE"].ToString() != "" && (d["BEGIN_PLAT_PUBLISHDATE"] == null || d["BEGIN_PLAT_PUBLISHDATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["END_PLAT_PUBLISHDATE"].ToString());
                    sql += " and PLAT_PUBLISHDATE < '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";

                }
                else if (d["BEGIN_PLAT_PUBLISHDATE"] != null && d["BEGIN_PLAT_PUBLISHDATE"].ToString() != "" && d["END_PLAT_PUBLISHDATE"] != null && d["END_PLAT_PUBLISHDATE"].ToString() != "")
                {
                    DateTime bdate = Convert.ToDateTime(d["BEGIN_PLAT_PUBLISHDATE"].ToString());
                    DateTime edate = Convert.ToDateTime(d["END_PLAT_PUBLISHDATE"].ToString());
                    sql += " and PLAT_PUBLISHDATE between '" + bdate.Year + "-" + bdate.Month + "-" + bdate.Day + " 00:00:00' and '" + edate.Year + "-" + edate.Month + "-" + edate.Day + " 23:59:59'";
                }
            }
            return db.GetDataTable(sql);
        }


        public string createPlatformArticle(Dictionary<string, object> d)
        {
            string col = "";
            string val = "";
            if (d.Keys.Contains("ORG_CODE"))
            {
                d.Remove("ORG_CODE");
            }
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

            string sql = "INSERT INTO ts_store_platform(" + col + ",CREATE_DATE,IS_DELETE) VALUES(" + val + ",'"+ DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0)";

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

        public string updatePlatformData(Dictionary<string, object> d)
        {
            string col = "";
            if (d.Keys.Contains("ORG_CODE"))
            {
                d.Remove("ORG_CODE");
            }
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

            string sql = "update  ts_store_platform set " + col + " where PLAT_ID='" + d["PLAT_ID"].ToString() + "'";

            return db.ExecutByStringResult(sql);
        }

        public string updatePlatformArticle(string id)
        {
            string sql = "update ts_store_platform set IS_DELETE=1 where PLAT_ID ='" + id + "'";

            return db.ExecutByStringResult(sql);
        }

      

    }
}