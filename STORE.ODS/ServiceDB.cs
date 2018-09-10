using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.UTILITY;
namespace STORE.ODS
{
    public class ServiceDB
    {
        DBTool db = new DBTool("");
        /// <summary>
        /// 根据主键获取服务信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable getServiceInfo(Dictionary<string, object> d)
        {
            string sql = "select * from ts_store_service a ";
            sql += " where 1=1 and IS_DELETE=0 and SERVICE_ID='"+ d["APPLY_RESOURCE_ID"] + "'";
            return db.GetDataTable(sql);
        }
        /// <summary>
        /// 查询服务信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable fetchServiceList(Dictionary<string, object> d)
        {
            string sql = @"select a.*,b.ORG_CODE from ts_store_service a 
                        INNER JOIN ts_uidp_org b on a.MANAGE_ORG_ID = b.ORG_ID";
            sql += " where 1=1 and a.IS_DELETE=0 ";
            if (d.Count > 0)
            {
                if (d["SERVICE_CODE"] != null && d["SERVICE_CODE"].ToString() != "")
                {
                    sql += " and a.SERVICE_CODE like '%" + d["SERVICE_CODE"].ToString() + "%'";
                }
                if (d["MANAGE_ORG_CODE"] != null && d["MANAGE_ORG_CODE"].ToString() != "")
                {
                    sql += " and b.ORG_CODE like '" + d["MANAGE_ORG_CODE"].ToString() + "%'";
                }
                if (d["SERVICE_NAME"] != null && d["SERVICE_NAME"].ToString() != "")
                {
                    sql += " and a.SERVICE_NAME like '%" + d["SERVICE_NAME"].ToString() + "%'";
                }
                if (d["BEGIN_SERVICE_PUBLISHDATE"] != null && d["BEGIN_SERVICE_PUBLISHDATE"].ToString() != "" && (d["END_SERVICE_PUBLISHDATE"] == null || d["END_SERVICE_PUBLISHDATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["BEGIN_SERVICE_PUBLISHDATE"].ToString());
                    sql += " and SERVICE_PUBLISHDATE > '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00'";
                    //sql += " and NOTICE_DATETIME between '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00' and '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";
                }
                else if (d["END_SERVICE_PUBLISHDATE"] != null && d["END_SERVICE_PUBLISHDATE"].ToString() != "" && (d["BEGIN_SERVICE_PUBLISHDATE"] == null || d["BEGIN_SERVICE_PUBLISHDATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["END_PLAT_PUBLISHDATE"].ToString());
                    sql += " and SERVICE_PUBLISHDATE < '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";

                }
                else if (d["BEGIN_SERVICE_PUBLISHDATE"] != null && d["BEGIN_SERVICE_PUBLISHDATE"].ToString() != "" && d["END_SERVICE_PUBLISHDATE"] != null && d["END_SERVICE_PUBLISHDATE"].ToString() != "")
                {
                    DateTime bdate = Convert.ToDateTime(d["BEGIN_SERVICE_PUBLISHDATE"].ToString());
                    DateTime edate = Convert.ToDateTime(d["END_SERVICE_PUBLISHDATE"].ToString());
                    sql += " and SERVICE_PUBLISHDATE between '" + bdate.Year + "-" + bdate.Month + "-" + bdate.Day + " 00:00:00' and '" + edate.Year + "-" + edate.Month + "-" + edate.Day + " 23:59:59'";
                }
            }
            return db.GetDataTable(sql);
        }


        public string createServiceArticle(Dictionary<string, object> d)
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

            string sql = "INSERT INTO ts_store_service(" + col + ",CREATE_DATE,IS_DELETE) VALUES(" + val + ",'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0)";

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

        public string updateServiceData(Dictionary<string, object> d)
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

            string sql = "update ts_store_service set " + col + " where SERVICE_ID='" + d["SERVICE_ID"].ToString() + "'";

            return db.ExecutByStringResult(sql);
        }

        public string updateServiceArticle(string id)
        {
            string sql = "update ts_store_service set IS_DELETE=1 where SERVICE_ID ='" + id + "'";

            return db.ExecutByStringResult(sql);
        }



    }
}